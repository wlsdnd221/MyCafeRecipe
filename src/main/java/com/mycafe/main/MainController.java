package com.mycafe.main;

import java.io.File;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mycafe.menu.MenuDTO;
import com.mycafe.menu.MenuService;

@Controller
public class MainController
{	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/")
	public String ko()
	{
		return "redirect:main";
	}
	// 메인화면
	@RequestMapping(value="/main")
	public String main(Model mo)
	{
		MenuService mdao = sqlSession.getMapper(MenuService.class);
		MenuDTO sbnew = mdao.main_newmenu("starbucks");
		MenuDTO honew = mdao.main_newmenu("hollys");
		MenuDTO ednew = mdao.main_newmenu("ediya");
		
		mo.addAttribute("sbnew",sbnew);;
		mo.addAttribute("honew",honew);;
		mo.addAttribute("ednew",ednew);;
		
		return "main";
	}
	
	// 공지사항 목록
	@RequestMapping(value="/notice_list")
	public String notice_list(HttpServletRequest request, Model mo)
	{	
		int totalrecord=1, totalpage=1, pagenum, start, end;
		if(request.getParameter("pagenum")==null)
		{
			pagenum = 1;
		}
		else
		{
			pagenum = Integer.parseInt(request.getParameter("pagenum"));
		}
		start = 1+(pagenum-1)*5;
		end = start+4;
		
		Service dao = sqlSession.getMapper(Service.class);
		totalrecord = dao.totalrecord();
		if((totalrecord%5)==0)
		{
			totalpage = totalrecord/5;
		}
		else
		{
			totalpage = (totalrecord/5)+1;
		}
		
		ArrayList<NoticeDTO> nodto = dao.notice_list(start, end);
		
		mo.addAttribute("nodto", nodto);
		mo.addAttribute("totalpage", totalpage);
		
		return "notice_list";
	}
	
	// 공지사항 글작성
	@RequestMapping(value="/notice_input")
	public String notice_input()
	{
		return "notice_input";
	}
	
	@RequestMapping(value="/notice_enroll", method=RequestMethod.POST)
	public String notice_enroll(MultipartHttpServletRequest multi)
	{
		String writer, title, picture, content;
		MultipartFile mf = multi.getFile("picture");
		
		writer = multi.getParameter("writer");
		title = multi.getParameter("title");
		picture = mf.getOriginalFilename();
		content = multi.getParameter("content");
		
		Service dao = sqlSession.getMapper(Service.class);
		dao.notice_enroll(writer, title, picture, content);
		
		return "redirect:notice_list";
	}
	
	// 파일업로드 경로
	private String path="C:\\Spring\\my_cafe_recipe\\src\\main\\webapp\\image\\normal";
	
	// 공지사항 파일업로드
	@RequestMapping("/notice_upload")
    public void result(@RequestParam("picture") MultipartFile multi,HttpServletRequest request,HttpServletResponse response, Model model)
    {
        String url = null;
        
        try {

            //String uploadpath = request.getServletContext().getRealPath(path);
            String uploadpath = path;
            String originFilename = multi.getOriginalFilename();
            String extName = originFilename.substring(originFilename.lastIndexOf("."),originFilename.length());
            long size = multi.getSize();
            String saveFileName = genSaveFileName(extName);
            
            System.out.println("uploadpath : " + uploadpath);
            
            System.out.println("originFilename : " + originFilename);
            System.out.println("extensionName : " + extName);
            System.out.println("size : " + size);
            System.out.println("saveFileName : " + saveFileName);
            
            if(!multi.isEmpty())
            {
                File file = new File(uploadpath, multi.getOriginalFilename());
                multi.transferTo(file);
                
                model.addAttribute("filename", multi.getOriginalFilename());
                model.addAttribute("uploadPath", file.getAbsolutePath());
                
            }
        }catch(Exception e)
        {
            System.out.println(e);
        }
    }
    
    // 현재 시간을 기준으로 파일 이름 생성
    private String genSaveFileName(String extName) {
        String fileName = "";
        
        Calendar calendar = Calendar.getInstance();
        fileName += calendar.get(Calendar.YEAR);
        fileName += calendar.get(Calendar.MONTH);
        fileName += calendar.get(Calendar.DATE);
        fileName += calendar.get(Calendar.HOUR);
        fileName += calendar.get(Calendar.MINUTE);
        fileName += calendar.get(Calendar.SECOND);
        fileName += calendar.get(Calendar.MILLISECOND);
        fileName += extName;
        
        return fileName;
    }
	
	// 공지사항 상세
	@RequestMapping(value="/notice_detail")
	public String notice_detail(HttpServletRequest request, Model mo)
	{
		int num;
		num = Integer.parseInt(request.getParameter("num"));
		
		readcnt(num);
		
		Service dao = sqlSession.getMapper(Service.class);
		NoticeDTO nodto = dao.notice_detail(num);
		
		mo.addAttribute("nodto", nodto);
		
		return "notice_detail";
	}
	
	public void readcnt(int num)
	{
		Service dao = sqlSession.getMapper(Service.class);
		dao.readcnt(num);
	}
	
	// 공지사항 삭제
	@RequestMapping(value="/notice_delete")
	public String notice_delete(HttpServletRequest request)
	{
		int num;
		num = Integer.parseInt(request.getParameter("num"));
		
		Service dao = sqlSession.getMapper(Service.class);
		dao.notice_delete(num);
		
		return "redirect:notice_list";
	}
	
	// 공지사항 수정
	@RequestMapping(value="/notice_modify_input")
	public String notice_modify_input(HttpServletRequest request, Model mo)
	{	
		int num;
		num = Integer.parseInt(request.getParameter("num"));
		
		Service dao = sqlSession.getMapper(Service.class);
		NoticeDTO nodto = dao.notice_detail(num);
		
		mo.addAttribute("nodto", nodto);
		
		return "notice_modify";
	}
	
	@RequestMapping(value="/notice_modify", method=RequestMethod.POST)
	public String notice_modify(MultipartHttpServletRequest multi, Model mo)
	{
		int num;
		String writer, title, picture, content;
		MultipartFile mf = multi.getFile("picture");
		
		num = Integer.parseInt(multi.getParameter("num"));
		writer = multi.getParameter("writer");
		title = multi.getParameter("title");
		picture = mf.getOriginalFilename();
		content = multi.getParameter("content");
		
		Service dao = sqlSession.getMapper(Service.class);
		dao.notice_modify(writer, title, content, num);
		if(picture.equals("")){}
		else
		{
			dao.image_modify(picture, num);
		}
		
		mo.addAttribute("num", num);
		
		return "redirect:notice_detail";
	}
	
	// 공지사항 검색
	@RequestMapping(value="/notice_search", method=RequestMethod.POST)
	public String notice_search(HttpServletRequest request, Model mo)
	{
		String category, search;
		category = request.getParameter("category");
		search = request.getParameter("search");
		
		Service dao = sqlSession.getMapper(Service.class);
		ArrayList<NoticeDTO> nodto = dao.notice_search(category, search);
		
		mo.addAttribute("nodto", nodto);
		return "notice_list";
	}
	
	// 지도
	@RequestMapping(value="/map")
	public String map(HttpServletRequest request, Model mo)
	{
		String cafename;
		cafename = request.getParameter("cafename");
		
		if(request.getParameter("cafename").equals("starbucks"))
		{
			cafename = "스타벅스";
		}
		else if(request.getParameter("cafename").equals("hollys"))
		{
			cafename = "할리스";
		}
		else if(request.getParameter("cafename").equals("ediya"))
		{
			cafename = "이디야";
		}
		mo.addAttribute("cafename", cafename);
		
		return "map";
	}
	
	// 이용안내
	@RequestMapping(value="/guide")
	public String guide()
	{
		return "guide";
	}
}
