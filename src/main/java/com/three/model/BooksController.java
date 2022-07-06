package com.three.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import service.BooksService;
import vo.BooksVO;

@Controller
public class BooksController {
	@Autowired
	BooksService service;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView index(ModelAndView mv,BooksVO vo,RedirectAttributes attr,
							  @RequestParam("code") String codename) {
		vo.setCodename(codename);
		service.selectOne(vo);
		vo = service.selectOne(vo);
		mv.addObject("result",200);
		mv.addObject("content",vo.getContent());
		
		attr.addFlashAttribute("content",vo.getContent());
		System.out.println(mv);
		mv.setViewName("redirect:indexf");
		return mv;
	} 
	@RequestMapping(value = "/save", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView save(ModelAndView mv,BooksVO vo,
							  @RequestParam("codename") String codename,
							  @RequestParam("postit") String postit,
							  @RequestParam("content") String content) {
		List<BooksVO> vo2 = service.allList();
		System.out.println(vo2);
		System.out.println(codename+""+content+""+postit);
		vo.setCodename(codename+"#"+postit);
		vo.setContent(content);
		System.out.println(vo.getCodename());
		System.out.println(vo.getContent());
		System.out.println("insert"+service.insert(vo));
		
		if(service.insert(vo)>0) {
			mv.setViewName("redirect:indexf");
		}
		else
			mv.setViewName("redirect:/");
		
			System.out.println(mv);
		return mv;
	} 
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(ModelAndView mv,BooksVO vo) {
		System.out.println(service.allList());
		mv.addObject("content1",service.allList());
		mv.setViewName("jsonView");
		return mv;
	} 
}
