package com.mycafe.recipe;

import java.util.ArrayList;

public interface RecipeService
{
	// �����ǰԽ��ǵ��
	public void rboard_enroll(RecipeBoardDTO rbdto);
	// �����ǵ��
	public void recipe_enroll(int num, int rec1, int rec2, int rec3, int rec4, int rec5, int rec6);
	// �����Ǹ��
	public int totalrecord(String cafename);
	public ArrayList<RecipeBoardDTO> recipe_list(String cafename, int start, int end);
	// �����ǻ�
	public RecipeBoardDTO recipe_detail(int num);
	public void readcnt(int num);
	// �����ǻ���
	public void rboard_delete(int num);
	public void recipe_delete(int num);
	// �����Ǽ���
	public void rboard_modify(String writer, String cafe, String title, String content, int num);
	public void recipe_modify(int rec1, int rec2, int rec3, int rec4, int rec5, int rec6, int num);
	public void image_modify(String picture, int num);
	// ��۴ޱ�
	public void rboard_reply(RecipeBoardDTO rbdto);
	public void stepup(int group, int step);
	// �����ǰ˻�
	public ArrayList<RecipeBoardDTO> recipe_search(String cafename, String category, String search);
}
