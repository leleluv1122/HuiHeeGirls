package net.lele.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import net.lele.domain.Board;
import net.lele.model.Option;
import net.lele.model.Pagination;

public interface BoardRepository extends JpaRepository<Board, Integer> {
	public List<Board> findAllByOrderByIdDesc();

	@Query("SELECT b FROM Board b WHERE b.id = ?1")
	List<Board> findBoardById(int id);

	Option[] searchBy = { new Option(0, "검색 없음"), new Option(1, "글쓴이"), new Option(2, "제목"), new Option(3, "본문") };
	Option[] orderBy = { new Option(0, "최근 글"), new Option(1, "오래된 글"), new Option(2, "글쓴이") };

	Sort[] sort = { Sort.by(Sort.Direction.DESC, "id"), Sort.by(Sort.Direction.ASC, "id"),
			Sort.by(Sort.Direction.ASC, "user.name") };

	public default List<Board> findAll(Pagination pagination){
		Pageable pageable = 
                PageRequest.of(pagination.getPg() - 1, pagination.getSz(), sort[pagination.getOb()]);

      Page<Board> page;
      String searchText = pagination.getSt();
      switch (pagination.getSb()) {
      case 1: page = this.findByUserName(searchText, pageable); break;
      case 2: page = this.findByTitleContains(searchText, pageable); break;
      case 3: page = this.findByDetailContains(searchText, pageable); break;
      default: page = this.findAllByOrderByIdDesc(pageable); break;
      }
      pagination.setRecordCount((int)page.getTotalElements());
      return page.getContent();
  }

	public Page<Board> findAllByOrderByIdDesc(Pageable pageable);

	public Page<Board> findByUserName(String name, Pageable pageable);

	public Page<Board> findByTitleContains(String title, Pageable pageable);

	public Page<Board> findByDetailContains(String detail, Pageable pageable);
}
