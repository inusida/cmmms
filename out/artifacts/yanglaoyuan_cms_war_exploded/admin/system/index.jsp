<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312"%> 
<jsp:useBean id="cb" scope="page" class="demo.bean.ComBean" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<style>
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
</style>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head> 
<script  language="javascript" >
function top2(){
   	form3.action="<%=basePath%>admin/system/index.jsp?page=1";
    form3.submit();
}
function last2(){
    if(form3.pageCount.value==0){//如果总页数为0，那么最后一页为1，也就是第一页，而不是第0页
    form3.action="<%=basePath%>admin/system/index.jsp?page=1";
    form3.submit();
	}else{
	form3.action="<%=basePath%>admin/system/index.jsp?page="+form3.pageCount.value;
    	form3.submit();
	}
}
function pre2(){
  var page=parseInt(form3.page.value);
  if(page <= 1){
    alert("已至第一页");
  }else{
    form3.action="<%=basePath%>admin/system/index.jsp?page="+(page-1);
    form3.submit();
  }
}

function next2(){
  var page=parseInt(form3.page.value);
  var pageCount=parseInt(form3.pageCount.value);
  if(page>=pageCount){
    alert("已至最后一页");
  }else{
    form3.action="<%=basePath%>admin/system/index.jsp?page="+(page+1);
    form3.submit();
  }
}
function bjump2(){
  	var pageCount=parseInt(form3.pageCount.value);
  	if( fIsNumber(form3.busjump.value,"1234567890")!=1 ){
		alert("跳转文本框中只能输入数字!");
		form3.busjump.select();
		form3.busjump.focus();
		return false;
	}
	if(form3.busjump.value>pageCount){//如果跳转文本框中输入的页数超过最后一页的数，则跳到最后一页
	  if(pageCount==0){	
	  form3.action="<%=basePath%>admin/system/index.jsp?page=1";
	  form3.submit();
	}
	else{
		form3.action="<%=basePath%>admin/system/index.jsp?page="+pageCount;
		form3.submit();
	}
}
else if(form3.busjump.value<=pageCount){
var page=parseInt(form3.busjump.value);
   if(page==0){
      page=1;//如果你输入的是0，那么就让它等于1
      form3.action="<%=basePath%>admin/system/index.jsp?page="+page;
      form3.submit();
   }else{
      form3.action="<%=basePath%>admin/system/index.jsp?page="+page;
      form3.submit();
   }

}

}
//****判断是否是Number.
function fIsNumber (sV,sR){
var sTmp;
if(sV.length==0){ return (false);}
for (var i=0; i < sV.length; i++){
sTmp= sV.substring (i, i+1);
if (sR.indexOf (sTmp, 0)==-1) {return (false);}
}
return (true);
}
function del()
{
	pageform.submit();
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
	
	String username=(String)session.getAttribute("user"); 
	if(username==null){
		response.sendRedirect(path+"index.jsp");
	}
	else{  
%>
<body >
<div class="right_cont">
<div class="title_right"><strong>系统用户管理</strong></div>  
<div style="width:100%;margin:0 auto">
<form action="" method="post" name="form3">	
<table border="1" cellspacing="0"
        style=" width: 100%; margin-bottom: 10px;border-color: #f1f2f6;">
     <tbody>
       <tr align=center style="height: 50px">
         <td nowrap="nowrap">序号</td>
         <td nowrap="nowrap">登录帐号</td>
         <td nowrap="nowrap">真实姓名</td>
         <td nowrap="nowrap">   性别</td>
         <td>   年龄</td>
         <td>联系电话</td>
         <td>联系地址</td>
         <td>创建时间</td>
         <td width="80" nowrap="nowrap">操作</td>
       </tr>
<%
	cb.setEVERYPAGENUM(12);
	int cou = cb.getMessageCount("select count(*) from admin where username!='admin'");//得到信息总数			        
	String page1=request.getParameter("page");
	if(page1==null){
		page1="1";
	}
	session.setAttribute("busMessageCount", cou + "");
	session.setAttribute("busPage", page1);
	List pagelist1 = cb.getMessage(Integer.parseInt(page1),"select * from admin where username!='admin' order by id desc",10);
	session.setAttribute("qqq", pagelist1);
	int pageCount = cb.getPageCount(); //得到页数  
	session.setAttribute("busPageCount", pageCount + ""); 
	List pagelist3=(ArrayList)session.getAttribute("qqq");
		if(!pagelist3.isEmpty()){
		for(int i = pagelist3.size() - 1;i >= 0;i--){
			List pagelist2 =(ArrayList)pagelist3.get(i);
%>       
       <tr align="center" style="height: 50px;" width="100">
         <td nowrap="nowrap"><%=pagelist2.get(0).toString()%></td>
         <td nowrap="nowrap"><%=pagelist2.get(1).toString() %></td> 
         <td nowrap="nowrap"><%=pagelist2.get(3).toString() %></td>
         <td nowrap="nowrap"><%=pagelist2.get(4).toString() %></td>
         <td nowrap="nowrap"><%=pagelist2.get(5).toString() %></td>
         <td nowrap="nowrap"><%=pagelist2.get(7).toString() %></td>
         <td nowrap="nowrap"><%=pagelist2.get(6).toString() %></td>
         <td nowrap="nowrap"><%=pagelist2.get(8).toString() %></td>  
         <td nowrap="nowrap" style="display: flex;align-items: center; padding: 10px;justify-content: center">
             <a style="text-decoration: none; width: 80px; height: 30px;background: #FFFFFF;color: #000000;border: 1px solid #333333;display: block; text-align: center; line-height: 30px; border-radius: 5px; margin-right: 10px" href="<%=basePath%>admin/system/add.jsp?method=updateAdmin&id=<%=pagelist2.get(0).toString()%>">编辑</a>
         <a style="text-decoration: none; width: 80px; height: 30px;background: rgb(241,18,18);color: #FFFFFF;border: 1px solid #333333;display: block; text-align: center; line-height: 30px; border-radius: 5px" href="<%=basePath%>AdminServlet?method=deleteAdmin&id=<%=pagelist2.get(0).toString()%>">删除</a></td>
       </tr>
<% }} %>
       <tr align="center" style="height: 40px">
         <td nowrap="nowrap" colspan="11">
         <input type="hidden" name="pageCount" value="<%= session.getAttribute("busPageCount").toString()%>" /><!--//用于给上面javascript传值-->
	 <input type="hidden" name="page" value="<%=session.getAttribute("busPage").toString()%>" /><!--//用于给上面javascript传值-->         
					<a href="#" onClick="top2()" style="text-decoration: none; color: #0f0f0f">首页</a>&nbsp;&nbsp;&nbsp;
		<a href="#" onClick="pre2()"  style="text-decoration: none; color: #0f0f0f">上一页</a>&nbsp;&nbsp;&nbsp;
		 共<%=session.getAttribute("busMessageCount").toString()%>条记录,共计<%=session.getAttribute("busPageCount").toString()%>页,当前第<%=session.getAttribute("busPage").toString()%>页&nbsp;&nbsp;&nbsp;
		<a href="#" onClick="next2()"  style="text-decoration: none; color: #0f0f0f">下一页</a>&nbsp;&nbsp;&nbsp;
		<a href="#" onClick="last2()"  style="text-decoration: none; color: #0f0f0f">尾页</a>
	 第<input name="busjump" type="text" class="span1" />页 <a href="#" onClick="bjump2()" style="text-decoration: none; color: #0f0f0f">转到</a>&nbsp;&nbsp;&nbsp;
         </td>
       </tr>        
     </tbody>
   </table>
   </form>
   </div>  
 </div>  
</body>
<%} %>
