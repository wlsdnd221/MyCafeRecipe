package com.mycafe.menu;

import java.io.File;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class MenuController
{
	@Autowired
	private SqlSession sqlSession;
	
	// 카페메뉴 리스트
	@RequestMapping(value="/cafe_menu_list")
	public String menu(HttpServletRequest request, Model mo)
	{
		String cafename;
		cafename = request.getParameter("cafename");
		
		MenuService mdao = sqlSession.getMapper(MenuService.class);
		ArrayList<MenuDTO> beverage = mdao.menu_list(cafename, "beverage");
		ArrayList<MenuDTO> food = mdao.menu_list(cafename, "food");
		ArrayList<MenuDTO> topping = mdao.menu_list(cafename, "topping");
		
		mo.addAttribute("cafename",cafename);
		mo.addAttribute("beverage", beverage);
		mo.addAttribute("food", food);
		mo.addAttribute("topping", topping);
		
		return "cafe_menu_list";
	}
	
	// 카페메뉴 등록
	@RequestMapping(value="/cafe_menu_input")
	public String menu_enroll_page()
	{
		return "cafe_menu_input";
	}
	
	@RequestMapping(value="/cafe_menu_enroll", method=RequestMethod.POST)
	public String menu_enroll(MultipartHttpServletRequest multi, Model mo)
	{
		String picture, cafe, sort, product, explain;
		int calorie, saturated_fat, protein, natrium, sugar, caffeine;
		MultipartFile mf = multi.getFile("picture");
		
		picture = mf.getOriginalFilename();
		cafe = multi.getParameter("cafe");
		sort = multi.getParameter("sort");
		product = multi.getParameter("product");
		explain = multi.getParameter("explain");
		calorie = Integer.parseInt(multi.getParameter("calorie"));
		saturated_fat = Integer.parseInt(multi.getParameter("saturated_fat"));
		protein = Integer.parseInt(multi.getParameter("protein"));
		natrium = Integer.parseInt(multi.getParameter("natrium"));
		sugar = Integer.parseInt(multi.getParameter("sugar"));
		caffeine = Integer.parseInt(multi.getParameter("caffeine"));
		
		MenuDTO mndto = new MenuDTO();
		mndto.setPicture(picture);
		mndto.setCafe(cafe);
		mndto.setSort(sort);
		mndto.setProduct(product);
		mndto.setExplain(explain);
		
		MenuService mdao = sqlSession.getMapper(MenuService.class);
		mdao.menu_enroll(mndto);
		int num = mndto.getNum();
		mdao.nutrition_enroll(num, calorie, saturated_fat, protein, natrium, sugar, caffeine);
		
		mo.addAttribute("cafename", cafe);
		
		return "redirect:cafe_menu_list";
	}
	
	// 파일업로드 경로
	private String path="C:\\Spring\\my_cafe_recipe\\src\\main\\webapp\\image\\";
		
	// 공지사항 파일업로드
	@RequestMapping("/cafe_menu_upload")
    public void result(@RequestParam("picture") MultipartFile multi,HttpServletRequest request,HttpServletResponse response, Model model)
    {
        String url = null;
        String cafe = request.getParameter("cafe");
        try {

            //String uploadpath = request.getServletContext().getRealPath(path);
            String uploadpath = path+cafe;
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
	
	// 메뉴상세
	@RequestMapping(value="/cafe_menu_detail")
	public String cafe_menu_detail(HttpServletRequest request, Model mo)
	{
		int num;
		num = Integer.parseInt(request.getParameter("num"));
		
		MenuService mdao = sqlSession.getMapper(MenuService.class);
		MenuDTO mndto = mdao.menu_detail(num);
		
		mo.addAttribute("mndto", mndto);
		mo.addAttribute("cafename", mndto.getCafe());
		
		return "cafe_menu_detail";
	}
	
	// 메뉴삭제
	@RequestMapping(value="/cafe_menu_delete")
	public String cafe_menu_delete(HttpServletRequest request, Model mo)
	{
		int num;
		String cafename;
		num = Integer.parseInt(request.getParameter("num"));
		cafename = request.getParameter("cafename");
		
		MenuService mdao = sqlSession.getMapper(MenuService.class);
		mdao.menu_delete(num);
		mdao.nutrition_delete(num);
		
		mo.addAttribute("cafename", cafename);
		
		return "redirect:cafe_menu_list";
	}
	
	// 메뉴수정
	@RequestMapping(value="/cafe_menu_modify_input")
	public String cafe_menu_modify_input(HttpServletRequest request, Model mo)
	{
		int num;
		num = Integer.parseInt(request.getParameter("num"));
		
		MenuService mdao = sqlSession.getMapper(MenuService.class);
		MenuDTO mndto = mdao.menu_detail(num);
		
		mo.addAttribute("mndto", mndto);
		
		return "cafe_menu_modify";
	}
	
	@RequestMapping(value="/cafe_menu_modify", method=RequestMethod.POST)
	public String cafe_menu_modify(MultipartHttpServletRequest multi, Model mo)
	{
		int num;
		String picture, cafe, sort, product, explain;
		int calorie, saturated_fat, protein, natrium, sugar, caffeine;
		MultipartFile mf = multi.getFile("picture");
		
		num = Integer.parseInt(multi.getParameter("num"));
		picture = mf.getOriginalFilename();
		cafe = multi.getParameter("cafe");
		sort = multi.getParameter("sort");
		product = multi.getParameter("product");
		explain = multi.getParameter("explain");
		calorie = Integer.parseInt(multi.getParameter("calorie"));
		saturated_fat = Integer.parseInt(multi.getParameter("saturated_fat"));
		protein = Integer.parseInt(multi.getParameter("protein"));
		natrium = Integer.parseInt(multi.getParameter("natrium"));
		sugar = Integer.parseInt(multi.getParameter("sugar"));
		caffeine = Integer.parseInt(multi.getParameter("caffeine"));
		
		MenuService mdao = sqlSession.getMapper(MenuService.class);
		
		mdao.menu_modify(cafe, sort, product, explain, num);
		mdao.nutrition_modify(calorie, saturated_fat, protein, natrium, sugar, caffeine, num);
		
		if(picture.equals("")){}
		else
		{
			mdao.image_modify(picture, num);
		}
		
		mo.addAttribute("cafename", cafe);
		
		return "redirect:cafe_menu_list";
	}
}
