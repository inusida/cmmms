<%@ page language="java" import="java.util.*" contentType="text/html;charset=gb2312"%>

<style>

	body{
		margin: 0;
	}

	.left_menu{
		font-size:12px;
		background:#1C2241;
		color:#fff;
		margin-top: 35px
	}

	.menu_title{
		font-size: 20px;
		color: #7f8fa6;
		text-align: center;
		margin: 30px;
	}

	.left_menu div{
		overflow:hidden;
		margin-top:-1px;
		background:#1C2241  repeat-y right;
	}

	i{
		height: 45px;
		width: 45px;
	}

	.collapsed{
		height:30px;
	}

	.left_menu div span{
		display:block;
		height:30px;
		line-height:30px;
		overflow:hidden;
		cursor:pointer;
		font-size:15px;
		text-indent:20px;
		font-family:"microsoft yahei";
	}

	span{
		background:#1C2241;
		font-family:"microsoft yahei";
		font-size:15px;
		color:white ;
		text-indent:30px;
	}

	a{
		display:block;
		color:#718093;
		font-size:15px;
		text-indent:30px;
		padding:10px 0;
		text-decoration: none;
	}

	 a:hover{
		color:#333;
		text-decoration:none;
	}


	a:focus{
		text-decoration: none;
		color: white;
	}

	.left_menu_frame {
		float: left;
		width: 210px;
		background: #1C2241  repeat-y  right;
		overflow-x:hidden;
		overflow-y:auto;
		height: 100%;
		position: relative;
	}

	.left_menu_frame::-webkit-scrollbar{
		display: none;
	}

</style>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%--	菜单插件--%>
<script type="text/javascript" src="<%=basePath %>images/js/sdmenu.js"></script>
</HEAD>

<%
	String username=(String)session.getAttribute("user");
	String type=(String)session.getAttribute("type");
	if(username==null){
		response.sendRedirect(path+"index.jsp");
	}
	else{ 
%>

<body>
<div class="left_menu_frame">
     
<script type="text/javascript">
var myMenu;
window.onload = function() {
	myMenu = new SDMenu("my_menu");
	myMenu.init();
};
</script>
	<div class="menu_title">
		养老院管理系统
	</div>

<div id="my_menu" class="left_menu">

	<li style="display: flex; margin-left: 10px; margin-bottom: 20px">
		<img src="<%=basePath%>images/img/icon_secret.png" height="30px" width="30px">
		<div style="height: 30px">
			<span class="span_style">个人中心</span>
			<a href="<%=basePath %>admin/system/editpwd.jsp" target="MainFrame">密码信息管理</a>
		</div>
	</li>


	<%if(type.equals("系统管理员")){ %>
	<li style="display: flex; margin-left: 10px; margin-bottom: 20px">
		<img src="<%=basePath%>images/img/icon_user.png" height="30px" width="30px">
		<div class="collapsed">
				<span class="span_style">系统用户管理</span>
			<a href="<%=basePath %>admin/system/index.jsp" target="MainFrame">系统用户管理</a>
			<a href="<%=basePath %>admin/system/add.jsp?method=addm" target="MainFrame">增加系统用户</a>
			<a href="<%=basePath %>admin/system/s.jsp" target="MainFrame">系统用户查询</a>
		</div>
	</li>

	<li style="display: flex; margin-left: 10px; margin-bottom: 20px">
		<img src="<%=basePath%>images/img/icon_old.png" height="30px" width="30px">
			<div class="collapsed">
				<span>老人信息管理</span>
				<a href="<%=basePath %>admin/lr/index.jsp" target="MainFrame">老人信息管理</a>
				<a href="<%=basePath %>admin/lr/add.jsp?method=addlr" target="MainFrame">增加老人信息</a>
				 <a href="<%=basePath %>admin/lr/s.jsp" target="MainFrame">老人信息查询</a>
			</div>
	</li>

	<li style="display: flex; margin-left: 10px; margin-bottom: 20px">
		<img src="<%=basePath%>images/img/icon_sg.png" height="30px" width="30px">
			<div class="collapsed">
				<span>事故记录管理</span>
				 <a href="<%=basePath %>admin/sg/index.jsp" target="MainFrame">事故记录管理</a>
				<a href="<%=basePath %>admin/sg/add.jsp?method=addsg" target="MainFrame">增加事故记录</a>
				 <a href="<%=basePath %>admin/sg/s.jsp" target="MainFrame">事故记录查询</a>
			</div>
	</li>

	<li style="display: flex; margin-left: 10px; margin-bottom: 20px">
		<img src="<%=basePath%>images/img/icon_qj.png" height="30px" width="30px">
		<div class="collapsed">
			<span>请假信息管理</span>
			<a href="<%=basePath %>admin/qj/index.jsp" target="MainFrame">请假信息管理</a>
			<a href="<%=basePath %>admin/qj/add.jsp?method=addqj" target="MainFrame">增加请假信息</a>
			<a href="<%=basePath %>admin/qj/s.jsp" target="MainFrame">请假信息查询</a>
		</div>
	</li>



	<li style="display: flex; margin-left: 10px; margin-bottom: 20px">
		<img src="<%=basePath%>images/img/icon_bed.png" height="30px" width="30px">
		<div class="collapsed">
			<span>床位分配管理</span>
			<a href="<%=basePath %>admin/cw/index.jsp" target="MainFrame">床位分配管理</a>
<%--			<a href="<%=basePath %>admin/cw/add.jsp" target="MainFrame">添加床位管理</a>--%>
			<a href="<%=basePath %>admin/cw/s.jsp" target="MainFrame">床位信息查询</a>
		</div>
	</li>

	<li style="display: flex; margin-left: 10px; margin-bottom: 20px">
		<img src="<%=basePath%>images/img/icon_fee.png" height="30px" width="30px">
		<div class="collapsed">
			<span>入住费用管理</span>
			<a href="<%=basePath %>admin/fy/index.jsp" target="MainFrame">入住费用管理</a>
			<a href="<%=basePath %>admin/fy/add.jsp?method=addfy" target="MainFrame">增加入住费用</a>
			<a href="<%=basePath %>admin/fy/s.jsp" target="MainFrame">入住费用查询</a>
		</div>
	</li>

	<li style="display: flex; margin-left: 10px; margin-bottom: 20px">
		<img src="<%=basePath%>images/img/icon_personnel.png" height="30px" width="30px">
		<div class="collapsed">
			<span>护工薪资管理</span>
			<a href="<%=basePath %>admin/xz/index.jsp" target="MainFrame">护工薪资管理</a>
			<a href="<%=basePath %>admin/xz/add.jsp?method=addxz" target="MainFrame">增加护工薪资</a>
		</div>
	</li>

	<li style="display: flex; margin-left: 10px; margin-bottom: 20px">
		<img src="<%=basePath%>images/img/icon_qj.png" height="30px" width="30px">
		<div class="collapsed">
			<span>护工请假管理</span>
			<a href="<%=basePath %>admin/hgqj/index.jsp" target="MainFrame">护工请假管理</a>
			<a href="<%=basePath %>admin/hgqj/add.jsp?method=addhgqj" target="MainFrame">增加护工请假</a>
			<a href="<%=basePath %>admin/hgqj/s.jsp" target="MainFrame">护工请假查询</a>
		</div>
	</li>

	<%}else{ %>
	<li style="display: flex; margin-left: 10px; margin-bottom: 20px">
		<img src="<%=basePath%>images/img/icon_old.png" height="30px" width="30px">
		<div class="collapsed">
			<span>老人信息管理</span>
			<a href="<%=basePath %>admin/lr/index.jsp" target="MainFrame">老人信息管理</a>
			<a href="<%=basePath %>admin/lr/s.jsp" target="MainFrame">老人信息查询</a>
		</div>
	</li>
<%--	<li style="display: flex; margin-left: 10px; margin-bottom: 20px">--%>
<%--		<img src="<%=basePath%>images/img/icon_sg.png" height="30px" width="30px">--%>
<%--		<div class="collapsed">--%>
<%--			<span>事故记录管理</span>--%>
<%--			<a href="<%=basePath %>admin/sg/index.jsp" target="MainFrame">事故记录管理</a>--%>
<%--			<a href="<%=basePath %>admin/sg/add.jsp?method=addsg" target="MainFrame">增加事故记录</a>--%>
<%--			<a href="<%=basePath %>admin/sg/s.jsp" target="MainFrame">事故记录查询</a>--%>
<%--		</div>--%>
<%--	</li>--%>
	<li style="display: flex; margin-left: 10px; margin-bottom: 20px">
		<img src="<%=basePath%>images/img/look.png" height="30px" width="30px">
		<div class="collapsed">
			<span>请假信息查看</span>
			<a href="<%=basePath %>admin/hgqj/index.jsp" target="MainFrame">请假信息查看</a>
		</div>
	</li>
	<li style="display: flex; margin-left: 10px; margin-bottom: 20px">
		<img src="<%=basePath%>images/img/icon_bed.png" height="30px" width="30px">
		<div class="collapsed">
			<span>床位分配管理</span>
			<a href="<%=basePath %>admin/cw/index.jsp" target="MainFrame">床位分配管理</a>
			<a href="<%=basePath %>admin/cw/s.jsp" target="MainFrame">床位信息查询</a>
		</div>
	</li>
	<li style="display: flex; margin-left: 10px; margin-bottom: 20px">
		<img src="<%=basePath%>images/img/look1.png" height="30px" width="30px">
		<div class="collapsed">
			<span>护工薪资查看</span>
			<a href="<%=basePath %>admin/xz/index.jsp" target="MainFrame">护工薪资查看</a>
		</div>
	</li>
	<%} %>

	<li style="display: flex; margin-left: 10px; margin-bottom: 20px">
		<img src="<%=basePath%>images/img/icon_exit.png" height="30px" width="30px">
		<div class="collapsed">
			<span>退出系统</span>
			<a onclick="if (confirm('确定要退出吗？')) return true; else return false;" href="<%=basePath %>AdminServlet?method=adminexit" target="_top" >注销退出系统</a>
		</div>
	</li>
</div>
</div>

</body>
<%} %>

</html>
