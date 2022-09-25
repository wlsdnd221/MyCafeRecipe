package com.mycafe.menu;

import java.util.ArrayList;

public interface MenuService
{
	// 메뉴등록
	public void menu_enroll(MenuDTO mndto);
	public int menunum();
	public void nutrition_enroll(int num, int calorie, int saturated_fat, int protein, int natrium, int sugar, int caffeine);
	
	// 메뉴목록
	public ArrayList<MenuDTO> menu_list(String cafename, String sort);
	
	// 메뉴상세
	public MenuDTO menu_detail(int num);
	
	// 메뉴삭제
	public void menu_delete(int num);
	public void nutrition_delete(int num);
	
	// 메뉴수정
	public void menu_modify(String cafe, String sort, String product, String explain, int num);
	public void nutrition_modify(int calorie, int saturated_fat, int protein, int natrium, int sugar, int caffeine, int num);
	public void image_modify(String picture, int num);
	
	// 메인화면 신메뉴이미지
	public MenuDTO main_newmenu(String cafe);
	
	// 레시피 이미지
	public MenuDTO recipe(int rec);
}
