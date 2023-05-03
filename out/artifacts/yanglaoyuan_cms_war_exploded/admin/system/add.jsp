<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<jsp:useBean id="cb" scope="page" class="demo.bean.ComBean" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<style>

     .right_cont{ padding:10px; width:auto;}
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
</head>
 
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
	
	String username=(String)session.getAttribute("user"); 
	if(username==null){
		response.sendRedirect(basePath+"index.jsp");
	}
	else{
		String method=request.getParameter("method");
		String id="";
		String usernam="";String password="";String realname="";String sex="";String age="";String address="";String tel=""; 
		if(method.equals("updateAdmin")){
			id=request.getParameter("id");
			List alist=cb.get1Com("select * from admin where id='"+id+"'",10);
			usernam=alist.get(1).toString();
			password=alist.get(2).toString();
			realname=alist.get(3).toString();
			sex=alist.get(4).toString();
			age=alist.get(5).toString();
			address=alist.get(6).toString();
			tel=alist.get(7).toString(); 
		}
%>
<body >
<div class="right_cont">
<div class="title_right"><strong>系统用户管理</strong></div>  
<div style="width:440px;margin:0 auto;">
<form action="<%=basePath %>AdminServlet?method=<%=method%>&id=<%=id%>" method="post" name="form1">
<table >
	 <tr style="margin: 10px">
     <td width="40%" align="left" nowrap="nowrap" >登录帐号：</td>
     <td><%if(method.equals("updateAdmin")){ %><input type="text" name="username" class="input_style" value="<%=usernam %>" readonly/><%}else{ %><input type="text" class="input_style" name="username" required/><% } %></td>
     </tr>
     <tr style="margin: 10px">
     <td width="40%" align="left" nowrap="nowrap" >初始密码：</td>
     <td><input type="password" name="password" class="input_style" value="<%=password %>" required/></td>
     </tr> 
     <tr style="margin: 10px">
     <td width="40%" align="left" nowrap="nowrap" >用户姓名：</td>
     <td><input type="text" name="realname" class="input_style" value="<%=realname %>" required/></td>
     </tr>
     <tr style="margin: 10px">
     <td width="40%" align="left" nowrap="nowrap" >用户性别：</td>
     <td><input type="radio" name="sex" value="男" checked="checked"/> 男 <input type="radio" name="sex" value="女"/> 女</td> 
     </tr>
     <tr style="margin: 10px">
     <td width="40%" align="left" nowrap="nowrap" >用户年龄：</td>
     <td><input type="number" name="age" class="input_style" value="<%=age %>" required/></td>
     </tr>
     <tr style="margin: 10px">
     <td width="40%" align="left" nowrap="nowrap" >联系电话：</td>
     <td><input type="text" name="tel" class="input_style" value="<%=tel %>" pattern="[0-9]{11}" title="11位手机号码" required /></td>
     </tr>
     <tr style="margin: 10px">
     <td width="40%" align="left" nowrap="nowrap" >联系地址：</td>
     <td><input type="text" name="address" class="input_style" value="<%=address %>" required/></td>
     </tr>  
     <tr style="margin: 10px">
     	<td style="text-align: center;" colspan="2"><input type="submit" value="确定" style="width:200px; height: 30px;background-color: #f6f8fa; border: 1px solid #d0d7de;font-weight:bold;border-radius: 6px;margin-top: 20px;" /></td>
     </tr>
     </table> 
</form>
   </div>  
 </div>  
</body>
<%} %>