<%@page import="guest.exception.NotMatchPwException"%>
<%@page import="guest.exception.MsgNotFoundException"%>
<%@page import="guest.service.DeleteMsgService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//데이터 받고 > Service에 요청 > Dao
	String mid = request.getParameter("mid");
	String pw = request.getParameter("password");
	
	int resultCnt = 0;
	
	try {
		resultCnt = DeleteMsgService.getInstance().deleteMessage(Integer.parseInt(mid), pw);
	} catch (MsgNotFoundException e) {
%>
<script>
	alert('게시물이 존재하지 않습니다. 게시물 번호를 확인해주세요.');
	history.go(-1);
</script>
<%
	} catch (NotMatchPwException e) {
%>
<script>
	alert('비밀번호가 맞지 않습니다.');
	history.go(-1);
</script>
<%		
	} if(resultCnt == 1) {
%>
<script>
	alert('게시물을 삭제했습니다.');
	location.href="list.jsp";
</script>
<%
	}
%>