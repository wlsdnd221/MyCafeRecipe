package com.mycafe.recipe;

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
public class RecipeController
{
	@Autowired
	private SqlSession sqlSession;
	
	// 레시피목록
	@RequestMapping(value="/recipe_list")
	public String recipe_list(HttpServletRequest request, Model mo)
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
		
		String cafename;
		cafename = request.getParameter("cafename");
		
		RecipeService rdao = sqlSession.getMapper(RecipeService.class);
		totalrecord = rdao.totalrecord(cafename);
		if((totalrecord%5)==0)
		{
			totalpage = totalrecord/5;
		}
		else
		{
			totalpage = (totalrecord/5)+1;
		}
		
		ArrayList<RecipeBoardDTO> lista = rdao.recipe_list(cafename, start, end);
		
		mo.addAttribute("cafename", cafename);
		mo.addAttribute("lista", lista);
		mo.addAttribute("totalpage", totalpage);
		
		return "recipe_list";
	}
	
	// 레시피등록
	@RequestMapping(value="/recipe_input")
	public String recipe_input(HttpServletRequest request, Model mo)
	{
		String cafename;
		cafename = request.getParameter("cafename");
		
		MenuService mndao = sqlSession.getMapper(MenuService.class);
		ArrayList<MenuDTO> beverage = mndao.menu_list(cafename, "beverage");
		ArrayList<MenuDTO> food = mndao.menu_list(cafename, "food");
		ArrayList<MenuDTO> topping = mndao.menu_list(cafename, "topping");
		
		mo.addAttribute("cafename", cafename);
		mo.addAttribute("beverage", beverage);
		mo.addAttribute("food", food);
		mo.addAttribute("topping", topping);
		
		return "recipe_input";
	}

	@RequestMapping(value="/recipe_enroll", method=RequestMethod.POST)
	public String recipe_enroll(MultipartHttpServletRequest multi, Model mo)
	{
		String writer, cafe, title, picture, content;
		int rec1, rec2, rec3, rec4, rec5, rec6;
		MultipartFile mf = multi.getFile("picture");
		
		writer = multi.getParameter("writer");
		cafe = multi.getParameter("cafe");
		title = multi.getParameter("title");
		picture = mf.getOriginalFilename();
		content = multi.getParameter("content");
		
		rec1 = Integer.parseInt(multi.getParameter("rec1")); 
		rec2 = Integer.parseInt(multi.getParameter("rec2"));
		rec3 = Integer.parseInt(multi.getParameter("rec3"));
		rec4 = Integer.parseInt(multi.getParameter("rec4"));
		rec5 = Integer.parseInt(multi.getParameter("rec5"));
		rec6 = Integer.parseInt(multi.getParameter("rec6"));
		
		RecipeBoardDTO rbdto = new RecipeBoardDTO();
		rbdto.setWriter(writer);
		rbdto.setCafe(cafe);
		rbdto.setTitle(title);
		rbdto.setPicture(picture);
		rbdto.setContent(content);
		
		RecipeService rdao = sqlSession.getMapper(RecipeService.class);
		rdao.rboard_enroll(rbdto);
		int num = rbdto.getNum();
		rdao.recipe_enroll(num, rec1, rec2, rec3, rec4, rec5, rec6);
		
		mo.addAttribute("cafename", cafe);
		
		return "redirect:recipe_list";
	}
	
	// 파일업로드 경로
	private String path="C:\\Spring\\my_cafe_recipe\\src\\main\\webapp\\image\\recipe";
		
	// 공지사항 파일업로드
	@RequestMapping("/recipe_upload")
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
	
	// 레시피상세
	@RequestMapping(value="/recipe_detail")
	public String recipe_detail(HttpServletRequest request, Model mo)
	{
		int num;
		num = Integer.parseInt(request.getParameter("num"));
		
		readcnt(num);
		
		RecipeService rdao = sqlSession.getMapper(RecipeService.class);
		RecipeBoardDTO rbdto = rdao.recipe_detail(num);
		mo.addAttribute("rbdto", rbdto);
		
		MenuService mndao = sqlSession.getMapper(MenuService.class);
		MenuDTO rec1 = mndao.recipe(rbdto.rdto.getRec1());
		MenuDTO rec2 = mndao.recipe(rbdto.rdto.getRec2());
		MenuDTO rec3 = mndao.recipe(rbdto.rdto.getRec3());
		MenuDTO rec4 = mndao.recipe(rbdto.rdto.getRec4());
		MenuDTO rec5 = mndao.recipe(rbdto.rdto.getRec5());
		MenuDTO rec6 = mndao.recipe(rbdto.rdto.getRec6());
		
		ArrayList<MenuDTO> lista = new ArrayList<MenuDTO>();
		lista.add(rec1);
		lista.add(rec2);
		lista.add(rec3);
		lista.add(rec4);
		lista.add(rec5);
		lista.add(rec6);
		
		mo.addAttribute("lista", lista);
		
		return "recipe_detail";
	}
	public void readcnt(int num)
	{
		RecipeService rdao = sqlSession.getMapper(RecipeService.class);
		rdao.readcnt(num);
	}
	
	// 레시피삭제
	@RequestMapping(value="/recipe_delete")
	public String recipe_delete(HttpServletRequest request, Model mo)
	{
		int num;
		String cafename;
		num = Integer.parseInt(request.getParameter("num"));
		cafename = request.getParameter("cafename");
		
		RecipeService rdao = sqlSession.getMapper(RecipeService.class);
		rdao.rboard_delete(num);
		rdao.recipe_delete(num);
		
		mo.addAttribute("cafename", cafename);
		
		return "redirect:recipe_list";
	}
	
	// 레시피수정
	@RequestMapping(value="/recipe_modify_input")
	public String recipe_modify_input(HttpServletRequest request, Model mo)
	{
		int num;
		num = Integer.parseInt(request.getParameter("num"));
		
		RecipeService rdao = sqlSession.getMapper(RecipeService.class);
		RecipeBoardDTO rbdto = rdao.recipe_detail(num);
		
		mo.addAttribute("rbdto", rbdto);
		
		MenuService mndao = sqlSession.getMapper(MenuService.class);
		MenuDTO rec1 = mndao.recipe(rbdto.rdto.getRec1());
		MenuDTO rec2 = mndao.recipe(rbdto.rdto.getRec2());
		MenuDTO rec3 = mndao.recipe(rbdto.rdto.getRec3());
		MenuDTO rec4 = mndao.recipe(rbdto.rdto.getRec4());
		MenuDTO rec5 = mndao.recipe(rbdto.rdto.getRec5());
		MenuDTO rec6 = mndao.recipe(rbdto.rdto.getRec6());
		
		ArrayList<MenuDTO> lista = new ArrayList<MenuDTO>();
		lista.add(rec1);
		lista.add(rec2);
		lista.add(rec3);
		lista.add(rec4);
		lista.add(rec5);
		lista.add(rec6);
		
		mo.addAttribute("lista", lista);
		
		// 모달페이지정보
		String cafename = rbdto.getCafe();
		ArrayList<MenuDTO> beverage = mndao.menu_list(cafename, "beverage");
		ArrayList<MenuDTO> food = mndao.menu_list(cafename, "food");
		ArrayList<MenuDTO> topping = mndao.menu_list(cafename, "topping");
		
		mo.addAttribute("cafename", cafename);
		mo.addAttribute("beverage", beverage);
		mo.addAttribute("food", food);
		mo.addAttribute("topping", topping);
		// 모달페이지정보 종료
		
		return "recipe_modify";
	}
	
	@RequestMapping(value="/recipe_modify")
	public String recipe_modify(MultipartHttpServletRequest multi, Model mo)
	{
		int num;
		String writer, cafe, title, picture, content;
		int rec1, rec2, rec3, rec4, rec5, rec6;
		MultipartFile mf = multi.getFile("picture");
		
		num = Integer.parseInt(multi.getParameter("num"));
		writer = multi.getParameter("writer");
		cafe = multi.getParameter("cafe");
		title = multi.getParameter("title");
		picture = mf.getOriginalFilename();
		content = multi.getParameter("content");
		
		RecipeService rdao = sqlSession.getMapper(RecipeService.class);
		rdao.rboard_modify(writer, cafe, title, content, num);
		
		if(multi.getParameter("rec1").equals("")) {}
		else
		{
			rec1 = Integer.parseInt(multi.getParameter("rec1"));
			rec2 = Integer.parseInt(multi.getParameter("rec2"));
			rec3 = Integer.parseInt(multi.getParameter("rec3"));
			rec4 = Integer.parseInt(multi.getParameter("rec4"));
			rec5 = Integer.parseInt(multi.getParameter("rec5"));
			rec6 = Integer.parseInt(multi.getParameter("rec6"));
			
			rdao.recipe_modify(rec1, rec2, rec3, rec4, rec5, rec6, num);
		}
		
		if(picture.equals("")){}
		else
		{
			rdao.image_modify(picture, num);
		}
		
		mo.addAttribute("cafename", cafe);
		
		return "redirect:recipe_list";
	}
	
	// 답글달기
	@RequestMapping(value="/recipe_reply_input")
	public String recipe_reply_input(HttpServletRequest request, Model mo)
	{
		int num;
		num = Integer.parseInt(request.getParameter("num"));
		
		RecipeService rdao = sqlSession.getMapper(RecipeService.class);
		RecipeBoardDTO rbdto = rdao.recipe_detail(num);
		
		mo.addAttribute("rbdto", rbdto);
		
		MenuService mndao = sqlSession.getMapper(MenuService.class);
		MenuDTO rec1 = mndao.recipe(rbdto.rdto.getRec1());
		MenuDTO rec2 = mndao.recipe(rbdto.rdto.getRec2());
		MenuDTO rec3 = mndao.recipe(rbdto.rdto.getRec3());
		MenuDTO rec4 = mndao.recipe(rbdto.rdto.getRec4());
		MenuDTO rec5 = mndao.recipe(rbdto.rdto.getRec5());
		MenuDTO rec6 = mndao.recipe(rbdto.rdto.getRec6());
		
		ArrayList<MenuDTO> lista = new ArrayList<MenuDTO>();
		lista.add(rec1);
		lista.add(rec2);
		lista.add(rec3);
		lista.add(rec4);
		lista.add(rec5);
		lista.add(rec6);
		
		mo.addAttribute("lista", lista);
		mo.addAttribute("cafename", rbdto.getCafe());
		
		return "recipe_reply";
	}
	
	@RequestMapping(value="/recipe_reply")
	public String recipe_reply(MultipartHttpServletRequest multi, Model mo)
	{
		String writer, cafe, title, picture, content;
		int groups, step, indent;
		int rec1, rec2, rec3, rec4, rec5, rec6;
		MultipartFile mf = multi.getFile("picture");
		
		writer = multi.getParameter("writer");
		cafe = multi.getParameter("cafe");
		title = multi.getParameter("title");
		picture = mf.getOriginalFilename();
		content = multi.getParameter("content");
		
		groups = Integer.parseInt(multi.getParameter("groups"));
		step = Integer.parseInt(multi.getParameter("step"));
		indent = Integer.parseInt(multi.getParameter("indent"));
		
		stepup(groups, step);
		
		rec1 = Integer.parseInt(multi.getParameter("rec1")); 
		rec2 = Integer.parseInt(multi.getParameter("rec2"));
		rec3 = Integer.parseInt(multi.getParameter("rec3"));
		rec4 = Integer.parseInt(multi.getParameter("rec4"));
		rec5 = Integer.parseInt(multi.getParameter("rec5"));
		rec6 = Integer.parseInt(multi.getParameter("rec6"));
		
		RecipeBoardDTO rbdto = new RecipeBoardDTO();
		rbdto.setWriter(writer);
		rbdto.setCafe(cafe);
		rbdto.setTitle(title);
		rbdto.setPicture(picture);
		rbdto.setContent(content);
		rbdto.setGroups(groups);
		rbdto.setStep(step+1);
		rbdto.setIndent(indent+1);
		RecipeService rdao = sqlSession.getMapper(RecipeService.class);
		rdao.rboard_reply(rbdto);
		
		int num = rbdto.getNum();
		rdao.recipe_enroll(num, rec1, rec2, rec3, rec4, rec5, rec6);
		
		mo.addAttribute("cafename", cafe);
		
		return "redirect:recipe_list";
	}
	
	public void stepup(int group, int step)
	{
		RecipeService rdao = sqlSession.getMapper(RecipeService.class);
		rdao.stepup(group, step);
	}
	
	@RequestMapping(value="/recipe_search", method=RequestMethod.POST)
	public String recipe_search(HttpServletRequest request, Model mo)
	{
		String cafename ,category, search;
		cafename = request.getParameter("cafename");
		category = request.getParameter("category");
		search = request.getParameter("search");
		
		RecipeService rdao = sqlSession.getMapper(RecipeService.class);
		ArrayList<RecipeBoardDTO> lista = rdao.recipe_search(cafename, category, search);
		
		mo.addAttribute("cafename", cafename);
		mo.addAttribute("lista", lista);
		
		return "recipe_list";
	}
}
