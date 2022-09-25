package com.mycafe.recipe;

/* 테이블 생성 SQL
  CREATE TABLE "CAFE_RECIPE" 
   (	"NUM" NUMBER(6,0) NOT NULL ENABLE, 
	"REC1" NUMBER(5,0), 
	"REC2" NUMBER(5,0), 
	"REC3" NUMBER(5,0), 
	"REC4" NUMBER(5,0), 
	"REC5" NUMBER(5,0), 
	"REC6" NUMBER(5,0), 
	 CONSTRAINT "CAFE_RECIPE_PK" PRIMARY KEY ("NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" 
*/

public class RecipeDTO
{
	int num, rec1, rec2, rec3, rec4, rec5, rec6;

	public RecipeDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public RecipeDTO(int num, int rec1, int rec2, int rec3, int rec4, int rec5, int rec6) {
		super();
		this.num = num;
		this.rec1 = rec1;
		this.rec2 = rec2;
		this.rec3 = rec3;
		this.rec4 = rec4;
		this.rec5 = rec5;
		this.rec6 = rec6;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getRec1() {
		return rec1;
	}

	public void setRec1(int rec1) {
		this.rec1 = rec1;
	}

	public int getRec2() {
		return rec2;
	}

	public void setRec2(int rec2) {
		this.rec2 = rec2;
	}

	public int getRec3() {
		return rec3;
	}

	public void setRec3(int rec3) {
		this.rec3 = rec3;
	}

	public int getRec4() {
		return rec4;
	}

	public void setRec4(int rec4) {
		this.rec4 = rec4;
	}

	public int getRec5() {
		return rec5;
	}

	public void setRec5(int rec5) {
		this.rec5 = rec5;
	}

	public int getRec6() {
		return rec6;
	}

	public void setRec6(int rec6) {
		this.rec6 = rec6;
	}

	
	
}
