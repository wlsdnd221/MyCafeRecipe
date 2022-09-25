package com.mycafe.menu;

import java.util.ArrayList;

public interface MenuService
{
	// �޴����
	public void menu_enroll(MenuDTO mndto);
	public int menunum();
	public void nutrition_enroll(int num, int calorie, int saturated_fat, int protein, int natrium, int sugar, int caffeine);
	
	// �޴����
	public ArrayList<MenuDTO> menu_list(String cafename, String sort);
	
	// �޴���
	public MenuDTO menu_detail(int num);
	
	// �޴�����
	public void menu_delete(int num);
	public void nutrition_delete(int num);
	
	// �޴�����
	public void menu_modify(String cafe, String sort, String product, String explain, int num);
	public void nutrition_modify(int calorie, int saturated_fat, int protein, int natrium, int sugar, int caffeine, int num);
	public void image_modify(String picture, int num);
	
	// ����ȭ�� �Ÿ޴��̹���
	public MenuDTO main_newmenu(String cafe);
	
	// ������ �̹���
	public MenuDTO recipe(int rec);
}
