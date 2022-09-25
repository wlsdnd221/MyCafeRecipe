package com.mycafe.recipe;

/* 테이블 생성 SQL
  CREATE TABLE "CAFE_RBOARD" 
   (	"NUM" NUMBER(6,0) NOT NULL ENABLE, 
	"WRITER" VARCHAR2(50 BYTE), 
	"CAFE" VARCHAR2(30 BYTE), 
	"TITLE" VARCHAR2(200 BYTE), 
	"PICTURE" VARCHAR2(1000 BYTE), 
	"CONTENT" VARCHAR2(3000 BYTE), 
	"WRITEDAY" DATE DEFAULT sysdate, 
	"READCNT" NUMBER(8,0), 
	"GROUPS" NUMBER(6,0), 
	"STEP" NUMBER(3,0), 
	"INDENT" NUMBER(3,0), 
	 CONSTRAINT "CAFE_RBOARD_PK" PRIMARY KEY ("NUM")
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
 	CREATE SEQUENCE "CAFE_RBOARD_SEQ"
*/

public class RecipeBoardDTO
{
	int num;
	String writer, cafe, title, picture, content, writeday;
	int readcnt, groups, step, indent;
	RecipeDTO rdto;
	public RecipeBoardDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public RecipeBoardDTO(int num, String writer, String cafe, String title, String picture, String content,
			String writeday, int readcnt, int groups, int step, int indent, RecipeDTO rdto) {
		super();
		this.num = num;
		this.writer = writer;
		this.cafe = cafe;
		this.title = title;
		this.picture = picture;
		this.content = content;
		this.writeday = writeday;
		this.readcnt = readcnt;
		this.groups = groups;
		this.step = step;
		this.indent = indent;
		this.rdto = rdto;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getCafe() {
		return cafe;
	}
	public void setCafe(String cafe) {
		this.cafe = cafe;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriteday() {
		return writeday;
	}
	public void setWriteday(String writeday) {
		this.writeday = writeday;
	}
	public int getReadcnt() {
		return readcnt;
	}
	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}
	public int getGroups() {
		return groups;
	}
	public void setGroups(int groups) {
		this.groups = groups;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public int getIndent() {
		return indent;
	}
	public void setIndent(int indent) {
		this.indent = indent;
	}
	public RecipeDTO getRdto() {
		return rdto;
	}
	public void setRdto(RecipeDTO rdto) {
		this.rdto = rdto;
	}
	
	
}
