package com.mycafe.main;

import java.util.ArrayList;

public interface Service
{
		// 공지사항등록
		public void notice_enroll(String writer, String title, String picture, String content);
		// 공지사항목록
		public ArrayList<NoticeDTO> notice_list(int start, int end);
		// 공지사항상세
		public NoticeDTO notice_detail(int num);
		public void readcnt(int num);
		// 공지사항삭제
		public void notice_delete(int num);
		// 공지사항수정
		public void notice_modify(String writer, String title, String content, int num);
		public void image_modify(String picture, int num);
		// 공지사항검색
		public ArrayList<NoticeDTO> notice_search(String category, String search);
		public int totalrecord();
}
