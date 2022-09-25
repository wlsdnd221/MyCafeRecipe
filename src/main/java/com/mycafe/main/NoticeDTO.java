package com.mycafe.main;

/* ���̺� ���� SQL
  CREATE TABLE "CAFE_NOTICE" 
   (	"NUM" NUMBER(6,0) NOT NULL ENABLE, 
	"WRITER" VARCHAR2(50 BYTE), 
	"TITLE" VARCHAR2(200 BYTE), 
	"PICTURE" VARCHAR2(1000 BYTE), 
	"CONTENT" VARCHAR2(3000 BYTE), 
	"WRITEDAY" DATE DEFAULT SYSDATE, 
	"READCNT" NUMBER(8,0), 
	 CONSTRAINT "CAFE_NOTICE_PK" PRIMARY KEY ("NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"
   
   ������ ���� SQL
   CREATE SEQUENCE "CAFE_NOTICE_SEQ"
 */

public class NoticeDTO
{
	int num;
	String writer, title, picture, content, writeday;
	int readcnt;
	public NoticeDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public NoticeDTO(int num, String writer, String title, String picture, String content, String writeday,
			int readcnt) {
		super();
		this.num = num;
		this.writer = writer;
		this.title = title;
		this.picture = picture;
		this.content = content;
		this.writeday = writeday;
		this.readcnt = readcnt;
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
	

}
