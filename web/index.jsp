<%@ page language="java" import="java.util.*"  contentType="text/html;charset=gb2312" %>
<%@ include file="util/path.jsp" %>
<SCRIPT language=javascript>
</SCRIPT>
<style>
    body{
        width: 100%;
        height: 100vh;
        background: url("./images/login_01.png") ;
        background-size: 100% 100%;
        position: fixed;
    }
    .login-box{
        margin: auto;
        position: absolute;
        top: 15%;
        bottom: 15%;
        left: 0px;
        right: 0px;
        width:680px;
        border-radius: 8px;
        background:#fff;
        overflow:hidden;
        display: flex;
    }
    .table{
        width: 340px;
        padding-top: 40px;
    }
    .tbody-infos{
        /*padding: 20px;*/
    }
    .title-info{
        margin: 40px 0 30px 0;
        width: 100%;
        text-align: center;
        font-size: 24px;
        font-weight: 600;
    }
    .user-infos{
        margin: 30px 40px;
        font-size: 18px;
        color: #000000;
    }
    input{
        border: 0;
        outline: none;
        cursor: pointer;
        font-size: 18px;
        width: 120px;
    }
    .user-infos-item{
        margin: 16px 40px ;
        font-size: 18px;
    }

    .btn{
        margin:  20px auto 0 auto;
        width:250px;
        height:46px;

    }
    .btn-click{
        margin: 0;
        width: 100%;
        height: 100%;
        line-height: 46px;
        text-align: center;
        color: #ffffff;
        font-size: 20px;
        background-color: #1452D9;
        border-radius: 8px;
    }

</style>

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

    <body >
<div class="login-box">
    <img style=" display: block;
        width: 340px;" src="./images/login-01.png"/>
<FORM name="loginform" method="post" action="<%=basePath %>AdminServlet"> 
   <table class="table">
	  <tbody class="tbody-infos">
      <div class="title-info">
          系统用户登录
      </div>
      <div class="user-infos">
          登录帐号：
          <input type=hidden name=method value="UserLogin"/>
          <input type="text" size="18" name="username" required placeholder="请输入用户名"/>
      </div>
      <div class="user-infos">登录密码：
          <input type="password" size="18" name="password" required placeholder="请输入密码"/>
      </div>
      <div class="user-infos-item">
          用户身份：
          <input style="width: 10px;" type="radio" name="admin_type" value="普通管理员" > 护工
          <input style="width: 10px;"  type="radio" name="admin_type" value="系统管理员" checked> 管理员
      </div>

      <div class="user-infos-item">
          验证码:
          <input style="width: 80px;"  type="text" size="18" name="code" required placeholder="验证码">
          <img src="randomCode.jsp" width="80px" height="25px">
      </div>

      <div class="btn">
          <input type="submit" class="btn-click" value="登录" />
      </div>
      </tbody>
</table>
</FORM> 
</div>
</body>
