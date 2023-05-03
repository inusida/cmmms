package demo.servlet;

import demo.bean.ComBean;
import demo.util.Constant;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

/**
 * 用户服务连接器
 */

public class AdminServlet extends HttpServlet {

	public AdminServlet() {
		super();
	}

	public void destroy() {
		super.destroy();
	}

	/**
	 *
	 * 当表单的 tag value 方法等于 get 时，调用此方法。
	 *
	 * @param request 客户端发送给服务器的请求
	 * @param response 服务器发送给客户端的响应
	 * @throws ServletException
	 * @throws IOException
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request,response);
	}

	/**
	 *
	 * 当窗体的标记值方法等于 post 时调用此方法。
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType(Constant.CONTENTTYPE);
		request.setCharacterEncoding(Constant.CHARACTERENCODING);
		String date=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
//		String date2=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
		try{
			String method=request.getParameter("method").trim();
			ComBean cBean = new ComBean();
			HttpSession session = request.getSession();
			if(method.equals("UserLogin")){//用户登录
				String username = request.getParameter("username");
				String password = request.getParameter("password");
				String type = request.getParameter("type");
				String sql="select realname from admin where username='"+username+"' and  password='"+password+"'  and  type='"+type+"';";
				String str=cBean.getString(sql);
				if(str==null){
					request.setAttribute("message", "登录信息错误！");
					request.getRequestDispatcher("index.jsp").forward(request, response);
				}
				else{
					session.setAttribute("user", username);
					session.setAttribute("type", type);
					request.getRequestDispatcher("admin/index.jsp").forward(request, response);
				}
			}
			else if(method.equals("uppwd")){//修改密码
				String username=(String)session.getAttribute("user");
				String oldpwd = request.getParameter("oldpwd");
				String newpwd = request.getParameter("newpwd");
				String str=cBean.getString("select id from admin where username='"+username+"' and  password='"+oldpwd+"';");
				if(str==null){
					request.setAttribute("message", "原始密码信息错误！");
					request.getRequestDispatcher("admin/system/editpwd.jsp").forward(request, response);
				}
				else{
					int flag=cBean.comUp("update admin set password='"+newpwd+"' where username='"+username+"'");
					if(flag == Constant.SUCCESS){
						request.setAttribute("message", "操作成功！");
						request.getRequestDispatcher("admin/system/editpwd.jsp").forward(request, response);
					}
					else {
						request.setAttribute("message", "操作失败！");
						request.getRequestDispatcher("admin/system/editpwd.jsp").forward(request, response);
					}
				}
			}
			else if(method.equals("adminexit")){//退出登录
				session.removeAttribute("user");  session.removeAttribute("type");
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
			else if(method.equals("addAdmin")){//增加系统用户
				String username = request.getParameter("username");
				String password = request.getParameter("password");
				String realname = request.getParameter("realname");
				String sex = request.getParameter("sex");
				String age = request.getParameter("age");
				String address = request.getParameter("address");
				String tel = request.getParameter("tel");
				String str=cBean.getString("select id from admin where username='"+username+"'");
				if(str==null){
					int flag=cBean.comUp("insert into admin(username,password,realname,sex,age,address,tel,addtime ) " +
							"values('"+username+"','"+password+"','"+realname+"','"+sex+"','"+age+"','"+address+"','"+tel+"','"+date+"' )");
					if(flag == Constant.SUCCESS){
						request.setAttribute("message", "添加成功！");
						request.getRequestDispatcher("admin/system/index.jsp").forward(request, response);
					}
					else {
						request.setAttribute("message", "添加失败！");
						request.getRequestDispatcher("admin/system/index.jsp").forward(request, response);
					}
				}
				else{
					request.setAttribute("message", "该用户名已存在！");
					request.getRequestDispatcher("admin/system/index.jsp").forward(request, response);
				}
			}
			else if(method.equals("updateAdmin")){//修改系统用户
				String id = request.getParameter("id");
				String password = request.getParameter("password");
				String realname = request.getParameter("realname");
				String sex = request.getParameter("sex");
				String age = request.getParameter("age");
				String address = request.getParameter("address");
				String tel = request.getParameter("tel");
				int flag=cBean.comUp("update admin set password='"+password+"',realname='"+realname+"',sex='"+sex+"',age='"+age+"'," +
						"address='"+address+"',tel='"+tel+"' where id='"+id+"'");
				if(flag == Constant.SUCCESS){
					request.setAttribute("message", "修改成功！");
					request.getRequestDispatcher("admin/system/index.jsp").forward(request, response);
				}
				else {
					request.setAttribute("message", "修改失败！");
					request.getRequestDispatcher("admin/system/index.jsp").forward(request, response);
				}
			}
			else if(method.equals("deleteAdmin")){//删除系统用户
				String id = request.getParameter("id");
				int flag=cBean.comUp("delete from admin where id='"+id+"'");
				if(flag == Constant.SUCCESS){
					request.setAttribute("message", "删除成功！");
					request.getRequestDispatcher("admin/system/index.jsp").forward(request, response);
				}
				else {
					request.setAttribute("message", "删除失败！");
					request.getRequestDispatcher("admin/system/index.jsp").forward(request, response);
				}
			}
			else{//无参数传入转到错误页面
				request.getRequestDispatcher("error.jsp").forward(request, response);
			}
		}catch(Exception e){
			e.printStackTrace();
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}

	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occure
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
