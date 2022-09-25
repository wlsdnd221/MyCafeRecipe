package com.mycafe.member;

public interface MemberService
{
	public void application_enroll(String id, String pw, String name, String birthday, String phon, String email);
	public MemberDTO login(String id, String pw);

}
