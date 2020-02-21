package net.lele.model;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import lombok.Data;

@Data
public class Pagination {
    int pg = 1;      // 현재 페이지
    int sz = 15;     // 페이지 당 레코드 수
    int sb;          // search by : 어떤 조건으로 조회하는가?
    String st;       // search text : 조회 문자열
    int ob;          // order by : 정렬 순서
    int recordCount; // 전체 레코드 수

    public String getQueryString() {
        String url = null;
        try {
            String temp = (st == null) ? "" : URLEncoder.encode(st, "UTF-8");
            url = String.format("pg=%d&sz=%d&ob=%d&sb=%d&st=%s", pg, sz, ob, sb, temp);
        } catch (UnsupportedEncodingException e) { }
        return url;
    }
}
