package com.action;

import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.DB;
import com.orm.Tcatelog;
import com.orm.Tgoods;
import com.service.liuService;

public class goods_servlet extends HttpServlet
{ 
	public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException 
	{
		String type=req.getParameter("type");
		
		if(type.endsWith("goodsAdd"))
		{
			goodsAdd(req, res);
		}
		if(type.endsWith("goodsUpdate"))
		{
			goodsUpdate(req, res);
		}
		if(type.endsWith("goodsMana"))
		{
			goodsMana(req, res);
		}

		if(type.endsWith("goodsDel"))
		{
			goodsDel(req, res);
		}
		if(type.endsWith("goodsDetailHou"))
		{
			goodsDetailHou(req, res);
		}
		if(type.endsWith("goodsManaid"))
		{
			goodsManaid(req, res);
		}
		if(type.endsWith("goodsList"))
		{
			goodsList(req, res);
		}
		if(type.endsWith("goodsByCatelog"))
		{
			goodsByCatelog(req, res);
		}
		if(type.endsWith("goodsBymingcheng"))
		{
			goodsBymingcheng(req, res);
		}
		if(type.endsWith("goodsDetailQian"))
		{
			goodsDetailQian(req, res);
		}
	}
	
	
	public void goodsAdd(HttpServletRequest req,HttpServletResponse res)
	{
		int catelog_id=Integer.parseInt(req.getParameter("catelog_id"));
		String bianhao=req.getParameter("bianhao");
		String mingcheng=req.getParameter("mingcheng");
		String jieshao=req.getParameter("jieshao");
		String chicun=req.getParameter("chicun");
		String fujian=req.getParameter("fujian");
		String yanse=req.getParameter("yanse");
		int shichangjia=Integer.parseInt(req.getParameter("shichangjia"));		
		int kucun=Integer.parseInt(req.getParameter("kucun"));
		String sql="insert into t_goods(catelog_id,bianhao,mingcheng,jieshao,chicun,yanse,fujian,shichangjia,kucun) " +
				   "values(?,?,?,?,?,?,?,?,?)";
		Object[] params={catelog_id,bianhao,mingcheng,jieshao,chicun,yanse,fujian,shichangjia,kucun};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		req.setAttribute("message", "操作成功");
		req.setAttribute("path", "goods?type=goodsMana");
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}	

	public void goodsUpdate(HttpServletRequest req,HttpServletResponse res)
	{
		int id=Integer.parseInt(req.getParameter("id"));
		int catelog_id=Integer.parseInt(req.getParameter("catelog_id"));
		String bianhao=req.getParameter("bianhao");
		String mingcheng=req.getParameter("mingcheng");
		
		String jieshao=req.getParameter("jieshao");
		String yanse=req.getParameter("yanse");
		String fujian=req.getParameter("fujian");
		String chicun=req.getParameter("chicun");
		int shichangjia=Integer.parseInt(req.getParameter("shichangjia"));		
		int kucun=Integer.parseInt(req.getParameter("kucun"));
		String sql="Update t_goods set catelog_id=?,bianhao=?,mingcheng=?,jieshao=?,yanse=?,chicun=?,fujian=?"+
		",shichangjia=?,kucun=? where id=?";
		Object[] params={catelog_id,bianhao,mingcheng,jieshao,yanse,chicun,fujian,shichangjia,kucun,id};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		req.setAttribute("message", "修改成功");
		req.setAttribute("path", "goods?type=goodsMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}
	public void goodsDel(HttpServletRequest req,HttpServletResponse res)
	{
		int id=Integer.parseInt(req.getParameter("id"));
		String sql="delete from  t_goods where id="+id;
		Object[] params={};
		DB mydb=new DB();
		mydb.doPstm(sql, params);
		mydb.closed();
		
		req.setAttribute("message", "删除成功");
		req.setAttribute("path", "goods?type=goodsMana");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
	}


	public void goodsManaid(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		List catelogList = getcatelogxList();
		List goodsList=new ArrayList();
		int id = Integer.parseInt(req.getParameter("id"));
		String sql = "select * from t_goods where id = ?";
		Object[] params={id};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Tgoods goods=new Tgoods();
				
				goods.setId(rs.getInt("id"));
				goods.setCatelog_id(rs.getInt("catelog_id"));
				goods.setBianhao(rs.getString("bianhao"));
				
				goods.setMingcheng(rs.getString("mingcheng"));
				goods.setJieshao(rs.getString("jieshao"));
				goods.setYanse(rs.getString("yanse"));
				goods.setFujian(rs.getString("fujian"));
				
				goods.setShichangjia(rs.getInt("shichangjia"));
				goods.setChicun(rs.getString("chicun"));
				goods.setKucun(rs.getInt("kucun"));				
				goodsList.add(goods);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		req.setAttribute("catelogList", catelogList);
		req.setAttribute("goodsxx", goodsList);
		req.getRequestDispatcher("admin/goods/goodsEdit.jsp").forward(req, res);
	}
	private List getcatelogxList()
	{
		List catelogList=new ArrayList();
		
		String sql="select * from t_catelog";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Tcatelog catelog=new Tcatelog();
				catelog.setId(rs.getInt("id"));
				catelog.setName(rs.getString("name"));
				catelogList.add(catelog);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		return catelogList;
	}
	
	public void goodsMana(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		List goodsList=new ArrayList();
		String sql="select a.*,b.name from t_goods a left join t_catelog b on a.catelog_id =b.id  order by a.id";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Tgoods goods=new Tgoods();
				
				goods.setId(rs.getInt("id"));
				goods.setCatelog_id(rs.getInt("catelog_id"));
				goods.setBianhao(rs.getString("bianhao"));
				
				goods.setMingcheng(rs.getString("mingcheng"));
				goods.setJieshao(rs.getString("jieshao"));
				goods.setYanse(rs.getString("yanse"));
				goods.setFujian(rs.getString("fujian"));
				
				goods.setShichangjia(rs.getInt("shichangjia"));
				goods.setChicun(rs.getString("chicun"));
				goods.setKucun(rs.getInt("kucun"));

				goods.setName(rs.getString("name"));
				goodsList.add(goods);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("goodsList", goodsList);
		req.getRequestDispatcher("admin/goods/goodsMana.jsp").forward(req, res);
	}

	public void goodsDetailHou(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		int id=Integer.parseInt(req.getParameter("id"));
		 
		req.setAttribute("goods", liuService.getGoods(id));
		req.getRequestDispatcher("admin/goods/goodsDetailHou.jsp").forward(req, res);
	}
	

	public void goodsList(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		List goodsList=new ArrayList();
		String sql="select a.*,b.name from t_goods a left join t_catelog b on a.catelog_id =b.id order by a.id";
		Object[] params={};
		DB mydb=new DB();
		try
		{
			mydb.doPstm(sql, params);
			ResultSet rs=mydb.getRs();
			while(rs.next())
			{
				Tgoods goods=new Tgoods();
				
				goods.setId(rs.getInt("id"));
				goods.setCatelog_id(rs.getInt("catelog_id"));
				goods.setBianhao(rs.getString("bianhao"));
				
				goods.setMingcheng(rs.getString("mingcheng"));
				goods.setJieshao(rs.getString("jieshao"));
				goods.setYanse(rs.getString("yanse"));
				goods.setFujian(rs.getString("fujian"));
				
				goods.setShichangjia(rs.getInt("shichangjia"));
				goods.setChicun(rs.getString("chicun"));
				goods.setKucun(rs.getInt("kucun"));
				goods.setName(rs.getString("name"));
				goodsList.add(goods);
		    }
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		mydb.closed();
		
		req.setAttribute("goodsList", goodsList);
		req.getRequestDispatcher("qiantai/goods/goodsList.jsp").forward(req, res);
	}
	
	public void goodsByCatelog(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		int catelog_id=Integer.parseInt(req.getParameter("catelog_id"));
		
		req.setAttribute("goodsList", liuService.goodsByCatelog(catelog_id));
		req.getRequestDispatcher("qiantai/goods/goodsList.jsp").forward(req, res);
	}
	public void goodsBymingcheng(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		String mingcheng=req.getParameter("mingcheng");
		
		req.setAttribute("goodsList", liuService.goodsBymingcheng(mingcheng));
		req.getRequestDispatcher("qiantai/goods/goodsList.jsp").forward(req, res);
	}
	public void goodsDetailQian(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		int id=Integer.parseInt(req.getParameter("id"));
		
		req.setAttribute("goods", liuService.getGoods(id));
		req.getRequestDispatcher("qiantai/goods/goodsDetailQian.jsp").forward(req, res);
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

}
