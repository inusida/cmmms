package demo.servlet;

import demo.bean.ComBean;
import demo.util.Constant;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class ComServlet extends HttpServlet {

	public ComServlet() {
		super();
	}

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request,response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType(Constant.CONTENTTYPE);
		request.setCharacterEncoding(Constant.CHARACTERENCODING);
		HttpSession session = request.getSession();
		ComBean cBean = new ComBean();
//		String date=new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
//		String date2=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
		String method = request.getParameter("method");
		if(method.equals("addOldman")){  //老人信息
			String name = request.getParameter("name");
			String sex = request.getParameter("sex");
			String age = request.getParameter("age");
			String conditions = request.getParameter("conditions");
			String register = request.getParameter("register");
			String idcard = request.getParameter("idcard");
			String linkman = request.getParameter("linkman");
			String tel = request.getParameter("tel");
			String address = request.getParameter("address");
			String bednum = request.getParameter("bednum");
			String nursingworker = request.getParameter("nursingworker");
			String startTime = request.getParameter("startTime");
			String endTime = request.getParameter("endTime");
			String str_idcard = cBean.getString("select id from oldman_info where idcard='"+idcard+"'");
			String str_bednum = cBean.getString("select id from oldman_info where bednum='"+bednum+"'");
			if (str_idcard == null && str_bednum == null){
				int flag = cBean.comUp("insert into oldman_info(name,sex,age,conditions,register,idcard,linkman,tel,address,bednum,nursingworker,startTime,endTime)  " +
						"values('"+name+"','"+sex+"','"+age+"','"+conditions+"','"+register+"','"+idcard+"','"+linkman+"','"+tel+"','"+address+"','"+bednum+"','"+nursingworker+"','"+startTime+"','"+endTime+"' )");
				if(flag == Constant.SUCCESS){
					request.setAttribute("message", "添加成功！");
					request.getRequestDispatcher("admin/lr/index.jsp").forward(request, response);
				}
				else{
					request.setAttribute("message", "添加失败！");
					request.getRequestDispatcher("admin/lr/index.jsp").forward(request, response);
				}
			}else if(str_idcard != null){
				request.setAttribute("message", "该老人已存在！");
				request.getRequestDispatcher("admin/lr/index.jsp").forward(request, response);
			}else{
				request.setAttribute("message", "该床位已被选！");
				request.getRequestDispatcher("admin/lr/index.jsp").forward(request, response);
			}
		}
		else if(method.equals("updateOldman")){ //修改老人信息
			String id=request.getParameter("id");
			String name = request.getParameter("name");
			String sex = request.getParameter("sex");
			String age = request.getParameter("age");
			String conditions = request.getParameter("conditions");
			String register = request.getParameter("register");
			String idcard = request.getParameter("idcard");
			String linkman = request.getParameter("linkman");
			String tel = request.getParameter("tel");
			String address = request.getParameter("address");
			String bednum = request.getParameter("bednum");
			String nursingworker = request.getParameter("nursingworker");
			String startTime = request.getParameter("startTime");
			String endTime = request.getParameter("endTime");
			String str_idcard = cBean.getString("select id from oldman_info where idcard='"+idcard+"'");
			String str_bednum = cBean.getString("select id from oldman_info where bednum='"+bednum+"'");
			if (str_idcard == null && str_bednum == null){
				int flag = cBean.comUp("update oldman_info set name='"+name+"',sex='"+sex+"',age='"+age+"',conditions='"+conditions+"',register='"+register+"',idcard='"+idcard+"'" +
						",linkman='"+linkman+"',tel='"+tel+"',address='"+address+"',bednum='"+bednum+"',nursingworker='"+nursingworker+"',startTime='"+startTime+"',endTime='"+endTime+"' where id='"+id+"'");
				if(flag == Constant.SUCCESS){
					request.setAttribute("message", "修改成功！");
					request.getRequestDispatcher("admin/lr/index.jsp").forward(request, response);
				}
				else{
					request.setAttribute("message", "修改失败！");
					request.getRequestDispatcher("admin/lr/index.jsp").forward(request, response);
				}
			}else if(str_idcard != null){
				request.setAttribute("message", "该老人已存在！");
				request.getRequestDispatcher("admin/lr/index.jsp").forward(request, response);
			}else{
				request.setAttribute("message", "该床位已被选！");
				request.getRequestDispatcher("admin/lr/index.jsp").forward(request, response);
			}
		}
		else if(method.equals("deleteOldman")){//删除老人信息
			String id = request.getParameter("id");
			int flag = cBean.comUp("delete from oldman_info where id='"+id+"'");
			if(flag == Constant.SUCCESS){
				request.setAttribute("message", "删除成功！");
				request.getRequestDispatcher("admin/lr/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "系统维护中，请稍后再试！");
				request.getRequestDispatcher("admin/lr/index.jsp").forward(request, response);
			}
		}

		else if(method.equals("addAccident")){  //事故记录
			String name = request.getParameter("name");
			String time = request.getParameter("time");
			String notes = request.getParameter("notes");
			int flag = cBean.comUp("insert into accident_info(name,time,notes) values('"+name+"','"+time+"','"+notes+"' )");
			if(flag == Constant.SUCCESS){
				request.setAttribute("message", "添加成功！");
				request.getRequestDispatcher("admin/sg/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "添加失败！");
				request.getRequestDispatcher("admin/sg/index.jsp").forward(request, response);
			}
		}
		else if(method.equals("updateAccident")){ //修改事故记录
			String id=request.getParameter("id");
			String name = request.getParameter("name");
			String time = request.getParameter("time");
			String notes = request.getParameter("notes");
			int flag = cBean.comUp("update accident_info set name='"+name+"',time='"+time +"',notes='"+notes+"' where id='"+id+"'");
			if(flag == Constant.SUCCESS){
				request.setAttribute("message", "修改成功！");
				request.getRequestDispatcher("admin/sg/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "修改失败！");
				request.getRequestDispatcher("admin/sg/index.jsp").forward(request, response);
			}
		}
		else if(method.equals("deleteAccident")){//删除事故记录
			String id = request.getParameter("id");
			int flag = cBean.comUp("delete from accident_info where id='"+id+"'");
			if(flag == Constant.SUCCESS){
				request.setAttribute("message", "删除成功！");
				request.getRequestDispatcher("admin/sg/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "系统维护中，请稍后再试！");
				request.getRequestDispatcher("admin/sg/index.jsp").forward(request, response);
			}
		}

		else if(method.equals("addLeave")){  //请假信息
			String name = request.getParameter("name");
			String time = request.getParameter("time");
			String notes = request.getParameter("notes");
			int flag = cBean.comUp("insert into leave_info(name,time,notes) values('"+name+"','"+time+"','"+notes+"' )");
			if(flag == Constant.SUCCESS){
				request.setAttribute("message", "添加成功！");
				request.getRequestDispatcher("admin/qj/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "添加失败！");
				request.getRequestDispatcher("admin/qj/index.jsp").forward(request, response);
			}
		}
		else if(method.equals("updateLeave")){ //修改请假信息
			String id=request.getParameter("id");
			String name = request.getParameter("name");
			String time = request.getParameter("time");
			String notes = request.getParameter("notes");
			int flag = cBean.comUp("update leave_info set name = '"+name+"',time='"+time+"',notes='"+notes+"' where id='"+id+"'");
			if(flag == Constant.SUCCESS){
				request.setAttribute("message", "修改成功！");
				request.getRequestDispatcher("admin/qj/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "修改失败！");
				request.getRequestDispatcher("admin/qj/index.jsp").forward(request, response);
			}
		}
		else if(method.equals("deleteLeave")){//删除请假信息
			String id = request.getParameter("id");
			int flag = cBean.comUp("delete from leave_info where id='"+id+"'");
			if(flag == Constant.SUCCESS){
				request.setAttribute("message", "删除成功！");
				request.getRequestDispatcher("admin/qj/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "系统维护中，请稍后再试  ！");
				request.getRequestDispatcher("admin/qj/index.jsp").forward(request, response);
			}
		}
		else if(method.equals("updateBednum")){
			String id=request.getParameter("id");
			String bednum = request.getParameter("bednum");
			int flag = cBean.comUp("update oldman_info set bednum ='"+bednum+"'  where id='"+id+"'");
			if(flag == Constant.SUCCESS){
				request.setAttribute("message", "修改成功！");
				request.getRequestDispatcher("admin/cw/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "修改失败！");
				request.getRequestDispatcher("admin/cw/index.jsp").forward(request, response);
			}
		}


		else if(method.equals("addOldManFee")){  //入住费用
			String name = request.getParameter("name");
			String fee = request.getParameter("fee");
			String paid = request.getParameter("paid");
			String state = request.getParameter("state");
			String notes = request.getParameter("notes");
			float payment= Float.parseFloat(fee)- Float.parseFloat(paid);
			if(payment > 0 && state.equals("已付")){
				request.setAttribute("message", "未付清,请重新选择状态");
				request.getRequestDispatcher("admin/fy/add.jsp").forward(request, response);
			}else{
				int flag = cBean.comUp("insert into fee_info(name,fee,paid,state,notes,payment) values('"+name+"','"+fee+"','"+paid+"','"+state+"','"+notes+"','"+payment+"' )");
				if(flag == Constant.SUCCESS){
					request.setAttribute("message", "添加成功！");
					request.getRequestDispatcher("admin/fy/index.jsp").forward(request, response);
				}
				else{
					request.setAttribute("message", "添加失败！");
					request.getRequestDispatcher("admin/fy/index.jsp").forward(request, response);
				}
			}
		}
		else if(method.equals("updateOldManFee")){ //修改入住费用
			String id=request.getParameter("id");
			String name = request.getParameter("name");
			String fee = request.getParameter("fee");
			String paid = request.getParameter("paid");
			String state = request.getParameter("state");
			String notes = request.getParameter("notes");
			float payment= Float.parseFloat(fee)- Float.parseFloat(paid);
			if(payment > 0 && state.equals("已付")){
				request.setAttribute("message", "未付清,请重新选择状态");
				request.getRequestDispatcher("admin/fy/add.jsp").forward(request, response);
			}else{
				int flag = cBean.comUp("update fee_info set name='"+name+"',fee='"+fee+"',paid='"+paid+"',state='"+state+"',notes='"+notes+"',sji='"+payment+"'  where id='"+id+"'");
				if(flag == Constant.SUCCESS){
					request.setAttribute("message", "修改成功！");
					request.getRequestDispatcher("admin/fy/index.jsp").forward(request, response);
				}
				else{
					request.setAttribute("message", "修改失败！");
					request.getRequestDispatcher("admin/fy/index.jsp").forward(request, response);
				}
			}
		}
		else if(method.equals("deleteOldManFee")){//删除入住费用
			String id = request.getParameter("id");
			int flag = cBean.comUp("delete from fee_info where id='"+id+"'");
			if(flag == Constant.SUCCESS){
				request.setAttribute("message", "删除成功！");
				request.getRequestDispatcher("admin/fy/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "系统维护中，请稍后再试！");
				request.getRequestDispatcher("admin/fy/index.jsp").forward(request, response);
			}
		}
		else if(method.equals("addSalary")){  //薪资
			String name = request.getParameter("name");
			String baseSalary = request.getParameter("base_salary");
			String deduct = request.getParameter("deduct");
			String notes = request.getParameter("notes");
			String subsidy = request.getParameter("subsidy");
			float totalSalary = Float.parseFloat(baseSalary)+Float.parseFloat(subsidy);
			float payment= totalSalary -  Float.parseFloat(deduct);
			int flag = cBean.comUp("insert into salary_info(name,base_salary,deduct,notes,subsidy,total_salary,payment) " +
					"values('"+name+"','"+baseSalary+"','"+deduct+"','"+notes+"','"+subsidy+"','"+totalSalary+"','"+payment+"' )");
			if(flag == Constant.SUCCESS){
				request.setAttribute("message", "添加成功！");
				request.getRequestDispatcher("admin/xz/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "添加失败！");
				request.getRequestDispatcher("admin/xz/index.jsp").forward(request, response);
			}
		}
		else if(method.equals("updateSalary")){
			String id=request.getParameter("id");
			String name = request.getParameter("name");
			String baseSalary = request.getParameter("base_salary");
			String deduct = request.getParameter("deduct");
			String notes = request.getParameter("notes");
			String subsidy = request.getParameter("subsidy");
			float totalSalary = Float.parseFloat(baseSalary)+Float.parseFloat(subsidy);
			float payment= totalSalary -  Float.parseFloat(deduct);
			int flag = cBean.comUp("update salary_info set name='"+name+"',base_salary='"+baseSalary
					+"',deduct='"+deduct+"',notes='"+notes+"',subsidy='"+subsidy+"',total_salary='"+totalSalary+"',payment='"+payment+"'  where id='"+id+"'");
			if(flag == Constant.SUCCESS){
				request.setAttribute("message", "修改成功！");
				request.getRequestDispatcher("admin/xz/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "修改失败！");
				request.getRequestDispatcher("admin/xz/index.jsp").forward(request, response);
			}
		}
		else if(method.equals("deleteSalary")){//删除入住费用
			String id = request.getParameter("id");
			int flag = cBean.comUp("delete from salary_info where id='"+id+"'");
			if(flag == Constant.SUCCESS){
				request.setAttribute("message", "删除成功！");
				request.getRequestDispatcher("admin/xz/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "系统维护中，请稍后再试！");
				request.getRequestDispatcher("admin/xz/index.jsp").forward(request, response);
			}
		}



		else if(method.equals("addNursingworkerLeave")){  //请假信息
			String name = request.getParameter("name");
			String time = request.getParameter("time");
			String notes = request.getParameter("notes");
			int flag = cBean.comUp("insert into nursingworker_leave_info(name,time,notes) values('"+name+"','"+time+"','"+notes+"' )");
			if(flag == Constant.SUCCESS){
				request.setAttribute("message", "添加成功！");
				request.getRequestDispatcher("admin/hgqj/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "添加失败！");
				request.getRequestDispatcher("admin/hgqj/index.jsp").forward(request, response);
			}
		}
		else if(method.equals("updateNursingworkerLeave")){ //修改请假信息
			String id=request.getParameter("id");
			String name = request.getParameter("name");
			String time = request.getParameter("time");
			String notes = request.getParameter("notes");
			int flag = cBean.comUp("update nursingworker_leave_info set name = '"+name+"',time='"+time+"',notes='"+notes+"' where id='"+id+"'");
			if(flag == Constant.SUCCESS){
				request.setAttribute("message", "修改成功！");
				request.getRequestDispatcher("admin/hgqj/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "修改失败！");
				request.getRequestDispatcher("admin/hgqj/index.jsp").forward(request, response);
			}
		}
		else if(method.equals("deleteNursingworkerLeave")){//删除请假信息
			String id = request.getParameter("id");
			int flag = cBean.comUp("delete from nursingworker_leave_info where id='"+id+"'");
			if(flag == Constant.SUCCESS){
				request.setAttribute("message", "删除成功！");
				request.getRequestDispatcher("admin/hgqj/index.jsp").forward(request, response);
			}
			else{
				request.setAttribute("message", "系统维护中，请稍后再试！");
				request.getRequestDispatcher("admin/hgqj/index.jsp").forward(request, response);
			}
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
