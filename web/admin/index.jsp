<%@ page language="java" import="java.util.*" contentType="text/html;charset=gb2312"%> 
<% 
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<HTML>
<HEAD>

<META http-equiv=Content-Type content="text/html; charset=gb2312">

</HEAD>
<%
	String username=(String)session.getAttribute("user");
	if(username==null){
		response.sendRedirect(path+"/index.jsp");
	}
	else{ 		
%>

<FRAMESET cols="210, *">
    <FRAME name=menu src="<%=basePath %>admin/iframe/left.jsp" frameBorder=0 noResize>
        <FRAMESET border=0 frameSpacing=0 rows="60, *" frameBorder=0>
            <FRAME name=header src="<%=basePath %>admin/iframe/top.jsp" frameBorder=0 noResize scrolling=no>
            <FRAME name=MainFrame src="<%=basePath %>admin/iframe/main.jsp" frameBorder=0 noResize scrolling=yes>
        </FRAMESET>
</FRAMESET>
<noframes>
</noframes>
<%} %>
</HTML>