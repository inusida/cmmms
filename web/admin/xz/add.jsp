<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312"%>  
<jsp:useBean id="cb" scope="page" class="demo.bean.ComBean" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String htmlData = request.getParameter("content1") != null ? request.getParameter("content1") : "";
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
	<script>
		KindEditor.ready(function(K) {
			var editor1 = K.create('textarea[name="content1"]', {
				cssPath : '<%=basePath %>editor/plugins/code/prettify.css',
				uploadJson : '<%=basePath %>editor/jsp/upload_json.jsp',
				fileManagerJson : '<%=basePath %>editor/jsp/file_manager_json.jsp',
				allowFileManager : true,
				afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
						document.forms['form1'].submit();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
						document.forms['form1'].submit();
					});
				}
			});
			prettyPrint();
		});
	</script>
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
		response.sendRedirect(path+"index.jsp");
	}
	else{ 
		String method=request.getParameter("method");  
		String id="";String name = "";String baseSalary = "";String deduct = "";
		String notes = "";String subsidy = "";
		if(method.equals("updateSalary")){
			id=request.getParameter("id");
			List jlist = cb.get1Com("select * from salary_info where id='"+id+"'",6);
			name = jlist.get(1).toString();
			baseSalary = jlist.get(2).toString();
			deduct = jlist.get(3).toString();
			notes = jlist.get(4).toString();
			subsidy = jlist.get(5).toString();
		}	  
%>
<body >
<div class="right_cont">
<div class="title_right"><strong>护工薪资管理</strong></div>  
<div style="width:440px;margin:0 auto;">
<form action="<%=basePath %>ComServlet" method="post" name="form1">
<table>
     <tr><input type="hidden" name="method" value="<%=method%>" /><input type="hidden" name="id" value="<%=id%>" />
     <td width="40%" align="right" nowrap="nowrap" >护工：</td>
     <td><select name="name" class="select_style">
    <%if(method.equals("updateOldManFee")){ %><option value="<%=name%>"><%=name%></option> <%} %>
    <%List flist=cb.getCom("select * from admin where admin_type='普通管理员' order by id desc",2);if(!flist.isEmpty()){for(int i=0;i<flist.size();i++){List list2=(List)flist.get(i);%>
    <option value=<%=list2.get(1).toString() %>><%=list2.get(1).toString() %></option>
    <%}} %>
    </select></td> 
     </tr>
     <tr> 
     <td width="40%" align="right" nowrap="nowrap" >基本工资：</td>
     <td><input type="number" name="base_salary" class="input_style" value="<%=baseSalary %>" required/></td>
     </tr>
    <tr>
        <td width="40%" align="right" nowrap="nowrap" >补贴：</td>
        <td><input type="number" name="subsidy" class="input_style" value="<%=subsidy %>" required/></td>
    </tr>
     <tr> 
     <td width="40%" align="right" nowrap="nowrap" >扣除费用：</td>
     <td><input type="number" name="deduct" class="input_style" value="<%=deduct %>" required/></td>
     </tr>
<%--     <tr> --%>
<%--     <td width="40%" align="right" nowrap="nowrap" >发放状态：</td>--%>
<%--     <td><select name=zt class="select_style">--%>
<%--      <%if(method.equals("updateOldManFee")){ %><option value="<%=zt%>"><%=zt%></option> <%} %>--%>
<%--        <option value="已发">已发</option>--%>
<%--        <option value="未发">未发</option> --%>
<%--        </select></td> --%>
<%--     </tr>--%>
     <tr>
     <td width="40%" align="right" nowrap="nowrap" >详细信息：</td>
     <td><textarea name="notes" class="input_style" rows="6" required><%=notes%></textarea></td>
     </tr>
     <tr>
     	<td style="text-align: center;" colspan="2"><input type="submit" value="确定"style="width:200px; height: 30px;background-color: #f6f8fa; border: 1px solid #d0d7de;font-weight:bold;border-radius: 6px;margin-top: 20px;" /></td>
     </tr>
     </table> 
</form>
   </div>  
 </div>  
</body>
<%} %>