package com.bitcamp.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/member/logout")
public class LogoutController {

	@RequestMapping(method = RequestMethod.GET)
	public String logout() {
		return "member/logout";
	}

}
