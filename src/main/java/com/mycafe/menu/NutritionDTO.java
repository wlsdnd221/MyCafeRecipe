package com.mycafe.menu;

/* 테이블 생성 SQL
  CREATE TABLE "CAFE_NUTRITION" 
   (	"NUM" NUMBER(6,0) NOT NULL ENABLE, 
	"CALORIE" NUMBER(5,0), 
	"SATURATED_FAT" NUMBER(5,0), 
	"PROTEIN" NUMBER(5,0), 
	"NATRIUM" NUMBER(5,0), 
	"SUGAR" NUMBER(5,0), 
	"CAFFEINE" NUMBER(5,0), 
	 CONSTRAINT "CAFE_NUTRITION_PK" PRIMARY KEY ("NUM")
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

public class NutritionDTO
{
	int num, calorie, saturated_fat, protein, natrium, sugar, caffeine;

	public NutritionDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public NutritionDTO(int num, int calorie, int saturated_fat, int protein, int natrium, int sugar, int caffeine) {
		super();
		this.num = num;
		this.calorie = calorie;
		this.saturated_fat = saturated_fat;
		this.protein = protein;
		this.natrium = natrium;
		this.sugar = sugar;
		this.caffeine = caffeine;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getCalorie() {
		return calorie;
	}

	public void setCalorie(int calorie) {
		this.calorie = calorie;
	}

	public int getSaturated_fat() {
		return saturated_fat;
	}

	public void setSaturated_fat(int saturated_fat) {
		this.saturated_fat = saturated_fat;
	}

	public int getProtein() {
		return protein;
	}

	public void setProtein(int protein) {
		this.protein = protein;
	}

	public int getNatrium() {
		return natrium;
	}

	public void setNatrium(int natrium) {
		this.natrium = natrium;
	}

	public int getSugar() {
		return sugar;
	}

	public void setSugar(int sugar) {
		this.sugar = sugar;
	}

	public int getCaffeine() {
		return caffeine;
	}

	public void setCaffeine(int caffeine) {
		this.caffeine = caffeine;
	}
	
	

}
