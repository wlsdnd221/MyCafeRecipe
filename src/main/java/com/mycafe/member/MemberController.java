package com.mycafe.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberController
{
	@Autowired
	private SqlSession sqlSession;
	
	// 회원가입
	@RequestMapping(value="/application_form")
	public String form()
	{
		return "application_form";
	}

	@RequestMapping(value="/application_enroll", method=RequestMethod.POST)
	public String enroll(HttpServletRequest request)
	{
		String id, pw, name, birthday, phon, email; 
		id = request.getParameter("id");
		pw = request.getParameter("pw");
		name = request.getParameter("name");
		birthday = request.getParameter("birthday");
		phon = request.getParameter("phon");
		email = request.getParameter("email");
		
		MemberService mdao = sqlSession.getMapper(MemberService.class);
		mdao.application_enroll(id, pw, name, birthday, phon, email);
		
		return "redirect:main";
	}
	
	// 로그인
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(HttpServletRequest request, Model mo)
	{
		String id, pw;
		id = request.getParameter("id");
		pw = request.getParameter("pw");
		
		MemberService mdao = sqlSession.getMapper(MemberService.class);
		MemberDTO mbdto =  mdao.login(id, pw);
		
		if(mbdto != null)
		{
			HttpSession hs = request.getSession();
			hs.setAttribute("mbdto", mbdto);
			hs.setAttribute("logon", true);
			
			return "redirect:main";
		}
		else
		{
			mo.addAttribute("loginresult", "fail");
			
			return "redirect:main";
		}
	}
	
	// 로그아웃
	@RequestMapping(value="/logout")
	public String logout(HttpServletRequest request)
	{
		HttpSession hs = request.getSession();
		hs.removeAttribute("mbdto");
		hs.removeAttribute("logon");
		
		return "redirect:main";
	}
}
