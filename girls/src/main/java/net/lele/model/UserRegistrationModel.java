package net.lele.model;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import lombok.Data;

@Data
public class UserRegistrationModel {

	@NotEmpty(message = "ID를 입력하세요")
	@Size(min = 3, max = 12)
	String userid;

	@NotEmpty(message = "비밀번호를 입력하세요")
	@Size(min = 8, max = 20, message = "8 자리 이상 20 자리 이하이어야 합니다.")
	String passwd1;

	@NotEmpty(message = "비밀번호를 한번 더 입력하세요")
	String passwd2;

	@NotEmpty(message = "이름을 입력하세요")
	@Size(min = 2, max = 10)
	String name;

	@NotEmpty(message = "이메일 주소를 입력하세요")
	@Email(message = "이메일 주소가 올바르지 않습니다")
	String email;

	@NotEmpty(message = "전화번호를 입력하세요")
	String phone;

	@NotEmpty(message = "주소를 입력하세요")
	String address;
	
	@NotEmpty(message = "상세주소를 입력하세요")
	String address_detail;
}
