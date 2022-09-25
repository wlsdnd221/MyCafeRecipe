package com.mycafe.menu;

/* 테이블 생성 SQL
  CREATE TABLE "CAFE_MENU" 
   (	"NUM" NUMBER(6,0) NOT NULL ENABLE, 
	"PICTURE" VARCHAR2(1000 BYTE), 
	"CAFE" VARCHAR2(30 BYTE), 
	"SORT" VARCHAR2(30 BYTE), 
	"PRODUCT" VARCHAR2(200 BYTE), 
	"EXPLAIN" VARCHAR2(3000 BYTE), 
	 CONSTRAINT "CAFE_MENU_PK" PRIMARY KEY ("NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"
   
   시퀀스 생성 SQL
   CREATE SEQUENCE "CAFE_MENU_SEQ"
 */
public class MenuDTO
{
	int num;
	String picture, cafe, sort, product, explain;
	NutritionDTO ndto;
	
	public MenuDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public MenuDTO(int num, String picture, String cafe, String sort, String product, String explain, NutritionDTO ndto) {
		super();
		this.num = num;
		this.picture = picture;
		this.cafe = cafe;
		this.sort = sort;
		this.product = product;
		this.explain = explain;
		this.ndto = ndto;
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public String getCafe() {
		return cafe;
	}
	public void setCafe(String cafe) {
		this.cafe = cafe;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getProduct() {
		return product;
	}
	public void setProduct(String product) {
		this.product = product;
	}
	public String getExplain() {
		return explain;
	}
	public void setExplain(String explain) {
		this.explain = explain;
	}
	public NutritionDTO getNdto() {
		return ndto;
	}
	public void setNdto(NutritionDTO ndto) {
		this.ndto = ndto;
	}
	
	
}
