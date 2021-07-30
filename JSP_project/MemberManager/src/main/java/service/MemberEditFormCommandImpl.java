package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberEditFormCommandImpl implements Command {
	
	@Override
	public String getPage(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		request.setAttribute("id", id);
		return "/WEB-INF/views/editForm.jsp";
	}

}
