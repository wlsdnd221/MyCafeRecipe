package com.mycafe.recipe;

import java.util.ArrayList;

public interface RecipeService
{
	// 레시피게시판등록
	public void rboard_enroll(RecipeBoardDTO rbdto);
	// 레시피등록
	public void recipe_enroll(int num, int rec1, int rec2, int rec3, int rec4, int rec5, int rec6);
	// 레시피목록
	public int totalrecord(String cafename);
	public ArrayList<RecipeBoardDTO> recipe_list(String cafename, int start, int end);
	// 레시피상세
	public RecipeBoardDTO recipe_detail(int num);
	public void readcnt(int num);
	// 레시피삭제
	public void rboard_delete(int num);
	public void recipe_delete(int num);
	// 레시피수정
	public void rboard_modify(String writer, String cafe, String title, String content, int num);
	public void recipe_modify(int rec1, int rec2, int rec3, int rec4, int rec5, int rec6, int num);
	public void image_modify(String picture, int num);
	// 답글달기
	public void rboard_reply(RecipeBoardDTO rbdto);
	public void stepup(int group, int step);
	// 레시피검색
	public ArrayList<RecipeBoardDTO> recipe_search(String cafename, String category, String search);
}
