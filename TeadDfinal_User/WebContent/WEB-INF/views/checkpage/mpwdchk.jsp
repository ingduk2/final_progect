<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	request.setCharacterEncoding("euc-kr");

	String pwd = request.getParameter("mpwd");
	String pwdchk = request.getParameter("mpwdchk");
	String msg = "";
	
	if (pwd.equals(pwdchk)) {
		msg = "<p style='color:blue'> ��й�ȣ ��ġ </p>";
	}
	else {
		msg = "<p style='color:red'> ��й�ȣ ����ġ </p>";
	}
%>
<%=msg%>