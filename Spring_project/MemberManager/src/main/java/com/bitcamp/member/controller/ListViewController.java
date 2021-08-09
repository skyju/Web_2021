package com.bitcamp.member.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bitcamp.member.service.MemberListViewService;

@Controller
@RequestMapping("/member/list_view")
public class ListViewController {
	
	@Autowired
	MemberListViewService service;
	
	@RequestMapping(method = RequestMethod.GET)
	public String listView(HttpServletRequest request) {
		service.viewList(request);
		return "member/list_view";
	}

}
