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

    .select_style{
        width: 200px;
        max-width: 100%;
        margin-right: 5px;
        background-color: #f6f8fa;
        font-size: 14px;
        line-height: 20px;
        color: #1F2328;
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
		String xm="";String xb="";String nl="";String st="";String hj="";String sfz="";String lxr="";
		String dh="";String zz="";String cw="";String hg="";String rz="";String cy="";
		if(method.equals("uplr")){
			id=request.getParameter("id");
			List alist=cb.get1Com("select * from lr where id='"+id+"'",14);
			xm=alist.get(1).toString();
			xb=alist.get(2).toString();
			nl=alist.get(3).toString();
			st=alist.get(4).toString();
			hj=alist.get(5).toString();
			sfz=alist.get(6).toString();
			lxr=alist.get(7).toString(); 
			dh=alist.get(8).toString();  
			zz=alist.get(9).toString();  
			cw=alist.get(10).toString();  
			hg=alist.get(11).toString();  
			rz=alist.get(12).toString();  
			cy=alist.get(13).toString();   
		}
%>
<body >
<div class="right_cont">
<div class="title_right"><strong>老人信息管理</strong></div>  
<div style="width:440px;margin: 0 auto;">
<form action="<%=basePath %>ComServlet?method=<%=method%>&id=<%=id%>" method="post" name="form1">
<table >
     <tr>
     <td width="40%" align="left" nowrap="nowrap" >姓名：</td>
     <td><input type="text" name="xm" class="input_style" value="<%=xm %>" required/></td>
     </tr>
     <tr>
     <td width="40%" align="left" nowrap="nowrap" >性别：</td>
     <td><input type="radio" name="xb" value="男" checked="checked"/> 男 <input type="radio" name="xb" value="女"/> 女</td> 
     </tr>
     <tr>
     <td width="40%" align="left" nowrap="nowrap" >年龄：</td>
     <td><input type="number" name="nl" class="input_style" value="<%=nl %>" required/></td>
     </tr>
     <tr>
     <td width="40%" align="left" nowrap="nowrap" >身体状况：</td>
     <td><input type="text" name="st" class="input_style" value="<%=st %>" required /></td>
     </tr>
     <tr>
     <td width="40%" align="left" nowrap="nowrap" >户籍：</td>
     <td><input type="text" name="hj" class="input_style" value="<%=hj %>" required/></td>
     </tr> 
     <tr>
     <td width="40%" align="left" nowrap="nowrap" >身份证：</td>
     <td><input type="text" name="sfz" class="input_style" value="<%=sfz %>" pattern="[0-9]{18}" title="18位身份证号码" required/></td>
     </tr> 
     <tr>
     <td width="40%" align="left" nowrap="nowrap" >联系人：</td>
     <td><input type="text" name="lxr" class="input_style" value="<%=lxr %>" required/></td>
     </tr> 
     <tr>
     <td width="40%" align="left" nowrap="nowrap" >联系电话：</td>
     <td><input type="text" name="dh" class="input_style" value="<%=dh %>" required/></td>
     </tr> 
     <tr>
     <td width="40%" align="left" nowrap="nowrap" >家庭住址：</td>
     <td><input type="text" name="zz" class="input_style" value="<%=zz %>" required/></td>
     </tr> 
     <tr>
     <td width="40%" align="left" nowrap="nowrap" >床位号：</td>
     <td><input type="text" name="cw" class="input_style" value="<%=cw %>" required/></td>
     </tr> 
     <tr>
     <td width="40%" align="left" nowrap="nowrap" >护工编号：</td>
     <td><select name="hg" class="select_style">
    <%if(method.equals("uplr")){ %><option value="<%=hg%>"><%=hg%></option> <%} %> 
    <%List flist=cb.getCom("select * from admin where type='普通管理员' order by id desc",2);if(!flist.isEmpty()){for(int i=0;i<flist.size();i++){List list2=(List)flist.get(i);%>
    <option value=<%=list2.get(1).toString() %>><%=list2.get(1).toString() %></option>
    <%}} %>
    </select></td> 
     </tr> 
     <tr>
     <td width="40%" align="left" nowrap="nowrap" >入住日期：</td>
     <td><input type="date" name="rz" class="input_style" value="<%=rz %>" required/></td>
     </tr> 
     <tr>
     <td width="40%" align="left" nowrap="nowrap" >出院日期：</td>
     <td><input type="date" name="cy" class="input_style" value="<%=cy %>" required/></td>
     </tr>   
     <tr>
     	<td style="text-align: center;"   colspan="2"><input type="submit" value="确定" style="width:200px; height: 30px;background-color: #f6f8fa; border: 1px solid #d0d7de;font-weight:bold;border-radius: 6px;margin-top: 20px;" /></td>
     </tr>
     </table> 
</form>
   </div>  
 </div>  
</body>
<%} %>