package com.mycafe.main;

import java.util.ArrayList;

public interface Service
{
		// �������׵��
		public void notice_enroll(String writer, String title, String picture, String content);
		// �������׸��
		public ArrayList<NoticeDTO> notice_list(int start, int end);
		// �������׻�
		public NoticeDTO notice_detail(int num);
		public void readcnt(int num);
		// �������׻���
		public void notice_delete(int num);
		// �������׼���
		public void notice_modify(String writer, String title, String content, int num);
		public void image_modify(String picture, int num);
		// �������װ˻�
		public ArrayList<NoticeDTO> notice_search(String category, String search);
		public int totalrecord();
}
