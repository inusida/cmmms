<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312"%> 
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<style>

     .right_cont{
          padding:10px; width:auto;

     }

     .title_right{
          font-size:12px;
          font-family:"microsoft yahei";
          border-bottom:1px solid #ddd;
          margin-bottom:20px;
          line-height:30px;
     }

     .title_right strong{
          border-bottom:1px solid #F60;
          line-height:30px;
          display:inline-block;
          padding:0 10px;
          margin-bottom:-1px;
     }

     .input_style{
          width: 440px;
          max-width: 100%;
          margin-right: 5px;
          background-color: #f6f8fa;
          padding: 5px 12px;
          font-size: 14px;
          line-height: 20px;
          color: #1F2328;
          vertical-align: middle;
          border: 1px solid #d0d7de;
          border-radius: 6px;
          box-shadow: inset 0 1px 0 rgba(208,215,222,0.2);
     }
</style>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="<%=basePath %>images/js/sdmenu.js"></script>
</head>
<script type="text/javascript">
function check()
{
	if(document.form1.oldpwd.value=="")
	{
		alert("请输入旧密码！");
		document.form1.oldpwd.focus();
		return false;
	}
	if(document.form1.newpwd.value=="")
	{
		alert("请输入新密码！");
		document.form1.newpwd.focus();
		return false;
	} 
	if(document.form1.repwd.value=="")
	{
		alert("请确认密码！");
		document.form1.repwd.focus();
		return false;
	}
	if(document.form1.repwd.value!=document.form1.newpwd.value)
	{
		alert("对不起，两次输入的密码不相同，请确认密码！");
		document.form1.repwd.focus();
		return false;
	}
}
function checkPasswords() {
        var pass1 = document.getElementById("newpwd");
        var pass2 = document.getElementById("repwd");
 
        if (pass2.value != pass1.value)
            pass2.setCustomValidity("两次输入的密码不匹配");
        else
            pass2.setCustomValidity("");
}
</script>
<%
String message = (String)request.getAttribute("message");
	if(message == null){
			message = "";
	}
	if (!message.trim().equals("")){
		out.println("<script language='javascript'>");
		out.println("alert('"+message+"');");
		out.println("</script>");
	}
	request.removeAttribute("message");
%>
<%
	String username=(String)session.getAttribute("user");
	if(username==null){
		response.sendRedirect(basePath+"/error.jsp");
	}
	else{ 
%>
<body >
<div class="right_cont">
<div class="title_right"><strong>密码信息管理</strong></div>  
<div style="width:440px;margin:0 auto;">
<form action="<%=basePath %>AdminServlet?method=uppwd" method="post" name="form1">
<table >
	 <tr >
     <td width="40%" align="left" nowrap="nowrap" >旧&nbsp;&nbsp;密&nbsp;&nbsp;码：</td>
     </tr>
     <tr>
     <td><input type="password" name="oldpwd"  class="input_style" required/></td>
     </tr>
     <tr>
     <td width="40%" align="left" nowrap="nowrap" >新&nbsp;&nbsp;密&nbsp;&nbsp;码：</td>
     </tr>
     <tr>
     <td><input type="password" name="newpwd" id="newpwd" onchange="checkPasswords()" class="input_style" required/></td>
     </tr>
     <tr>
     <td width="40%" align="left" nowrap="nowrap" >确认密码：</td>
     </tr>
     <tr>
     <td><input type="password" name="repwd" id="repwd" onchange="checkPasswords()" class="input_style" required/></td>
     </tr>
     <tr>
     	<td style="text-align: left;" colspan="2"><input type="submit" value="确定"
                                                         style="width:200px; height: 30px;background-color: #f6f8fa; border: 1px solid #d0d7de;font-weight:bold;border-radius: 6px;margin-top: 20px;" /></td>
     </tr>
     </table> 
</form>
   </div>  
 </div>  
</body>
<%} %>
 
