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
    img{
        display: block;
        width: 340px;
    }
    .table{
        width: 340px;
        padding-top: 40px;
    }
    .tbody-infos{
        /*padding: 20px;*/
    }
    .title-info{
        margin: 50px 0 40px 0;
        width: 100%;
        text-align: center;
        font-size: 24px;
        font-weight: 600;
    }
    .user-infos{
        margin: 36px 40px;
        font-size: 18px;
        color: #000000;
    }
    input{
        margin-left: 12px;
        border: 0;
        outline: none;
        cursor: pointer;
        font-size: 16px;
        width: 120px;
    }
    .user-infos-item{
        margin: 40px;
        font-size: 16px;
    }
    .input{
        /*margin: 0;*/
        width: 10px;
    }
    .btn{
        margin:  40px auto 0 auto;
        width:250px;
        height:46px
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
<body >
<div class="login-box">
    <img src="./images/login-01.png"/>
<FORM name="loginform" method="post" action="<%=basePath %>AdminServlet"> 
   <table class="table">
	  <tbody class="tbody-infos">
      <div class="title-info">
          ϵͳ�û���¼
      </div>
      <div class="user-infos">
          ��¼�ʺţ�<input type=hidden name=method value="UserLogin"/><input type="text" size="18" name="username" required placeholder="�������û���"/>
      </div>
      <div class="user-infos">��¼���룺<input type="password" size="18" name="password" required placeholder="����������"/>
      </div>
      <div class="user-infos-item">
          �û���ݣ�
          <input class="input" type="radio" name="type" value="��ͨ����Ա" > ����
          <input class="input" type="radio" name="type" value="ϵͳ����Ա" checked> ����Ա
      </div>
      <div class="btn">
          <input type="submit" class="btn-click" value="��¼" />
      </div>
      </tbody>
</table>
</FORM> 
</div>
</body>
