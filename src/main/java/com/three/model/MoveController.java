package com.three.model;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MoveController {

	@RequestMapping(value = "/indexf")
	public ModelAndView indexf(ModelAndView mv) {
		mv.addObject("result",200);
		mv.setViewName("showin/index");
		return mv;
	} 
	@RequestMapping(value = "/indexf2")
	public ModelAndView indexf2(ModelAndView mv) {
		mv.addObject("result",200);
		mv.setViewName("showin/index2");
		return mv;
	} 

}
