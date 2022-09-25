package com.mycafe.member;

/* 테이블 생성 SQL
  CREATE TABLE "CAFE_MEMBER" 
   (	"NUM" NUMBER(6,0) NOT NULL ENABLE, 
	"ID" VARCHAR2(50 BYTE) NOT NULL ENABLE, 
	"PW" VARCHAR2(50 BYTE), 
	"NAME" VARCHAR2(50 BYTE), 
	"BIRTHDAY" DATE, 
	"PHON" VARCHAR2(50 BYTE), 
	"EMAIL" VARCHAR2(200 BYTE), 
	 CONSTRAINT "CAFE_MEMBER_PK" PRIMARY KEY ("NUM", "ID")
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
   CREATE SEQUENCE "CAFE_MEMBER_SEQ"
 */

public class MemberDTO 
{
	int num;
	String id, pw, name, birthday, phon, email;
	
	public MemberDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public MemberDTO(int num, String id, String pw, String name, String birthday, String phon, String email) {
		super();
		this.num = num;
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.birthday = birthday;
		this.phon = phon;
		this.email = email;
	}
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getPhon() {
		return phon;
	}
	public void setPhon(String phon) {
		this.phon = phon;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	

}
