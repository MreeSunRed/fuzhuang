package com.action;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.DB;
import com.orm.TAdmin;
import com.orm.Tyonghu;

public class yonghu_servlet extends HttpServlet
{
	public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException
	{
		String type=req.getParameter("type");


		if(type.endsWith("userReg"))
		{
			userReg(req, res);
		}
		if(type.endsWith("userLogout"))
		{
			userLogout(req, res);
		}
		if(type.endsWith("userEdit"))
		{
			userEdit(req, res);
		}
		if(type.endsWith("userMana"))
		{
			userMana(req, res);
		}
		if(type.endsWith("userDel"))
		{
			userDel(req, res);
		}
	}


	public void userReg(HttpServletRequest req,HttpServletResponse res) throws UnsupportedEncodingException {
		res.setContentType("text/html;charset=UTF-8");
		String id=String.valueOf(new Date().getTime());
		String loginname=req.getParameter("loginname");
		String loginpw=req.getParameter("loginpw");
		String name=req.getParameter("name");
		String address=req.getParameter("address");
		String tel=req.getParameter("tel");
		String email=req.getParameter("email");
		String s=yonghuyanzheng(loginname);
		if(s.equals("true"))
		{
			req.setCharacterEncoding("utf-8");
			req.setAttribute("message", "账号已经存在，请重新输入账号");
			req.setAttribute("path", "qiantai/yonghu/yonghuReg.jsp");
			String targetURL = "/common/success.jsp";
			dispatch(targetURL, req, res);
		}
		else
		{
			String sql="insert into t_yonghu(id,loginname,loginpw,name,address,tel,email)values(?,?,?,?,?,?,?)";
			Object[] params={id,loginname,loginpw,name,address,tel,email};
			DB mydb=new DB();
			mydb.doPstm(sql, params);
			mydb.closed();
			req.setCharacterEncoding("utf-8");
			req.setAttribute("message", "用户注册成功");
			req.setAttribute("path", "index");

			String targetURL = "/common/success.jsp";
			dispatch(targetURL, req, res);
		}
	}
	public String yonghuyanzheng(String loginname)
	{
		String s="false";
		String sql="select * from t_yonghu where loginname=?";
		Object[] params={loginname};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				s="true";
			}
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		return s;
	}


	public void userLogout(HttpServletRequest req,HttpServletResponse res)
	{
		req.getSession().setAttribute("user", null);
		String targetURL = "/qiantai/default.jsp";
		dispatch(targetURL, req, res);
	}

	public void userEdit(HttpServletRequest req,HttpServletResponse res)
	{
		String id=req.getParameter("id");
		String loginname=req.getParameter("loginname");
		String name=req.getParameter("name");
		String address=req.getParameter("address");
		String tel=req.getParameter("tel");
		String email=req.getParameter("email");

		String sql="update t_yonghu set name=?,address=?,tel=?,email=? where id=?";
		Object[] params={name,address,tel,email,id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();

		req.setAttribute("message", "个人信息修改成功");
		req.setAttribute("path", "qiantai/default.jsp");

		String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}


	public void userDel(HttpServletRequest req,HttpServletResponse res)
	{
		String id=req.getParameter("id");

		String sql="delete from t_yonghu where id=?";
		Object[] params={id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();

		req.setAttribute("message", "删除成功");
		req.setAttribute("path", "yonghu?type=userMana");

		String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}

	public void userMana(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		List userList=new ArrayList();
		String sql="select * from t_yonghu";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Tyonghu user=new Tyonghu();

				user.setId(rs.getString("id"));
				user.setLoginname(rs.getString("loginname"));
				user.setLoginpw(rs.getString("loginpw"));
				user.setLoginpw(rs.getString("loginpw"));
				user.setName(rs.getString("name"));
				user.setAddress(rs.getString("address"));
				user.setTel(rs.getString("tel"));
				user.setEmail(rs.getString("email"));

				userList.add(user);
			}
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();

		req.setAttribute("userList", userList);
		req.getRequestDispatcher("admin/user/userMana.jsp").forward(req, res);
	}
	public void dispatch(String targetURI,HttpServletRequest request,HttpServletResponse response)
	{
		RequestDispatcher dispatch = getServletContext().getRequestDispatcher(targetURI);
		try
		{
			dispatch.forward(request, response);
			return;
		}
		catch (ServletException e)
		{
			e.printStackTrace();
		}
		catch (IOException e)
		{

			e.printStackTrace();
		}
	}
	public void init(ServletConfig config) throws ServletException
	{
		super.init(config);
	}

	public void destroy()
	{

	}
}
