<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312"%> 
<style>
    .header_top {
        position: relative;
        background-color: white;
        width: 100%; height: 60px;  }

    .top_header-left{
        float: left;
        display: flex;
        margin-top: 10px;
    }
    .top_header-right { float: right;  margin-top: 10px;}

</style>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String admin=(String)session.getAttribute("user");  
String type=(String)session.getAttribute("type");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</HEAD>

<body>
 
<div class="header_top">
    <div class="top_header-left">
        <img src="<%=basePath%>images/img/daohang.png" width="30px" height="30px">
        <div style="font-size: 20px;color: #0e0e0e;margin-left: 10px;"><strong>养老院管理系统</strong></div>
    </div>
<div class="top_header-right">
    <font color=#000000 style="margin-right: 56px"><%=admin %>(<%=type %>)</font>
    <a href="<%=basePath%>index.jsp" target="_top"> </a>
<%--    <img src="<%=basePath%>images/img/.png" height="18px" width="18px">--%>
<%--    <a onclick="if (confirm('确定要退出吗？')) return true; else return false;" href="<%=basePath %>AdminServlet?method=adminexit" target="_top"  style="    line-height: 60px;--%>
<%--        margin-right: 48px;--%>
<%--        color: #000000; margin-bottom: 3px">退出</a>--%>
<div id="modal-container-973558" class="modal hide fade" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="width:300px; margin-left:-150px; top:30%">
</div>
</div>
</div>
</body>
</html>