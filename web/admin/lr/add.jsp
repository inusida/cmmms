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
		String name="";String age="";String health_status="";String household_register="";String id_card="";String contact_person="";
		String tel="";String address="";String bed_no="";String caregiver_id="";String startTime="";String endTime="";
		if(method.equals("updateOldman")){
			id=request.getParameter("id");
			List alist=cb.get1Com("select * from elderly_info where id='"+id+"'",14);
			name=alist.get(1).toString();
			age=alist.get(3).toString();
			health_status=alist.get(4).toString();
			household_register=alist.get(5).toString();
			id_card=alist.get(6).toString();
			contact_person=alist.get(7).toString();
			tel=alist.get(8).toString();
			address=alist.get(9).toString();
			bed_no=alist.get(10).toString();
			caregiver_id=alist.get(11).toString();
			startTime=alist.get(12).toString();
			endTime=alist.get(13).toString();
		}
%>
<body >
<div class="right_cont">
<div class="title_right"><strong>������Ϣ����</strong></div>  
<div style="width:440px;margin: 0 auto;">
<form action="<%=basePath %>ComServlet?method=<%=method%>&id=<%=id%>" method="post" name="form1">
<table >
     <tr>
     <td width="40%" align="left" nowrap="nowrap" >������</td>
     <td><input type="text" name="name" class="input_style" value="<%=name %>" required/></td>
     </tr>
     <tr>
     <td width="40%" align="left" nowrap="nowrap" >�Ա�</td>
     <td>
         <input type="radio" name="sex" value="��" checked/> ��
         <input type="radio" name="sex" value="Ů"/> Ů
     </td>
     </tr>
     <tr>
     <td width="40%" align="left" nowrap="nowrap" >���䣺</td>
     <td><input type="number" name="age" class="input_style" value="<%=age %>" required/>
     </td>
     </tr>
     <tr>
     <td width="40%" align="left" nowrap="nowrap" >����״����</td>
     <td><input type="text" name="health_status" class="input_style" value="<%=health_status %>" required /></td>
     </tr>
     <tr>
     <td width="40%" align="left" nowrap="nowrap" >������</td>
     <td><input type="text" name="household_register" class="input_style" value="<%=household_register %>" required/></td>
     </tr> 
     <tr>
     <td width="40%" align="left" nowrap="nowrap" >���֤��</td>
     <td><input type="text" name="id_card" class="input_style" value="<%=id_card %>" pattern="[0-9]{18}" title="18λ���֤����" required/></td>
     </tr> 
     <tr>
     <td width="40%" align="left" nowrap="nowrap" >��ϵ�ˣ�</td>
     <td><input type="text" name="contact_person" class="input_style" value="<%=contact_person %>" required/></td>
     </tr> 
     <tr>
     <td width="40%" align="left" nowrap="nowrap" >��ϵ�绰��</td>
     <td><input type="text" name="tel" class="input_style" value="<%=tel %>" required/></td>
     </tr> 
     <tr>
     <td width="40%" align="left" nowrap="nowrap" >��ͥסַ��</td>
     <td><input type="text" name="address" class="input_style" value="<%=address %>" required /></td>
     </tr>
     <tr>
     <td width="40%" align="left" nowrap="nowrap" >��λ�ţ�</td>
     <td><input type="text" name="bed_no" class="input_style" value="<%=bed_no %>" required/></td>
     </tr> 
     <tr>
     <td width="40%" align="left" nowrap="nowrap" >������ţ�</td>
     <td><select name="caregiver_id" class="select_style">
    <%if(method.equals("updateOldman")){ %><option value="<%=caregiver_id%>"><%=caregiver_id%></option> <%} %>
    <%List flist=cb.getCom("select * from admin where admin_type='��ͨ����Ա' order by id desc",2);if(!flist.isEmpty()){for(int i=0;i<flist.size();i++){List list2=(List)flist.get(i);%>
    <option value=<%=list2.get(1).toString() %>><%=list2.get(1).toString() %></option>
    <%}} %>
    </select></td> 
     </tr> 
     <tr>
     <td width="40%" align="left" nowrap="nowrap" >��ס���ڣ�</td>
     <td><input type="date" name="startTime" class="input_style" value="<%=startTime %>" required/></td>
     </tr> 
     <tr>
     <td width="40%" align="left" nowrap="nowrap" >��Ժ���ڣ�</td>
     <td><input type="date" name="endTime" class="input_style" value="<%=endTime %>" required/></td>
     </tr>   
     <tr>
     	<td style="text-align: center;"   colspan="2"><input type="submit" value="ȷ��" style="width:200px; height: 30px;background-color: #f6f8fa; border: 1px solid #d0d7de;font-weight:bold;border-radius: 6px;margin-top: 20px;" /></td>
     </tr>
     </table>
</form>
   </div>  
 </div>  
</body>
<%} %>