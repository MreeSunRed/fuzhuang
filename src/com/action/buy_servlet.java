package com.action;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;

import javax.jms.Session;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.orm.Tgoods;
import com.orm.Torder;
import com.orm.TorderItem;
import com.orm.Tyonghu;
import com.service.liuService;
import com.util.Cart;

public class buy_servlet extends HttpServlet
{
	public void service(HttpServletRequest req,HttpServletResponse res)throws ServletException, IOException 
	{
        String type=req.getParameter("type");
		
		
		if(type.endsWith("addToCart"))
		{
			addToCart(req, res);
		}
		if(type.endsWith("orderSubmit"))
		{
			orderSubmit(req, res);
		}
		if(type.endsWith("myorder"))
		{
			myorder(req, res);
		}
		if(type.endsWith("orderDetail"))
		{
			orderDetail(req, res);
		}
		if(type.endsWith("orderDetail1"))
		{
			orderDetail1(req, res);
		}
	}
	
	
	public void addToCart(HttpServletRequest req,HttpServletResponse res)
	{
		int goods_id=Integer.parseInt(req.getParameter("goods_id"));
		int quantity=Integer.parseInt(req.getParameter("quantity"));
		Tgoods goods=liuService.getGoods(goods_id);
		
		TorderItem orderItem=new TorderItem();
		orderItem.setGoods(goods);
		orderItem.setGoods_quantity(quantity);
		
		HttpSession session=req.getSession();
		Cart cart =(Cart)session.getAttribute("cart");
		cart.addGoods(goods_id, orderItem);
		
		session.setAttribute("cart", cart);
		
				
		req.setAttribute("message", "²Ù×÷³É¹¦");
		req.setAttribute("path", "qiantai/cart/mycart.jsp");
		
        String targetURL = "/common/success.jsp";
		dispatch(targetURL, req, res);
        
	}
	
	public void orderSubmit(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
	
		
		HttpSession session=req.getSession();
		Cart cart =(Cart)session.getAttribute("cart");
		Tyonghu user=(Tyonghu)session.getAttribute("user");
		
		Torder order=new Torder();
		order.setId(String.valueOf(new Date().getTime()));
		order.setBianhao(new SimpleDateFormat("yyyyMMddhhmmss").format(new Date()));
		order.setShijian(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date()));
		order.setZhuangtai("no");
		order.setSonghuodizhi(user.getAddress());
		order.setDianhua(user.getTel());
		order.setJine(cart.getTotalPrice());
		order.setUser_id(user.getId());
		liuService.saveOrder(order);
		
		for (Iterator it = cart.getItems().values().iterator(); it.hasNext();)
		{
			TorderItem orderItem = (TorderItem) it.next();			
			String id=String.valueOf(new Date().getTime());
			String order_id=order.getId();
			int goods_id=orderItem.getGoods().getId();
			int goods_quantity=orderItem.getGoods_quantity();
			liuService.saveOrderItem(id, order_id, goods_id, goods_quantity);			
			liuService.updateGoodsKucun(goods_id, goods_quantity);
		}		
		cart.getItems().clear();
		session.setAttribute("cart", cart);
		
		req.setAttribute("order", order);
		req.getRequestDispatcher("qiantai/cart/cartsuccess.jsp").forward(req, res);
	}
	public void myorder(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		HttpSession session=req.getSession();
		Tyonghu user=(Tyonghu)session.getAttribute("user");
		if(user==null){
			res.sendRedirect("index");
			return;

		}
		req.setAttribute("orderList", liuService.orderList(user.getId()));
		req.getRequestDispatcher("qiantai/order/myorder.jsp").forward(req, res);
        
	}
	
	public void orderDetail(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		String order_id=req.getParameter("order_id");	
		System.out.println(order_id+"DD");
		req.setAttribute("orderItemList", liuService.orderItemList(order_id));
		req.getRequestDispatcher("qiantai/order/orderDetail.jsp").forward(req, res);
        
	}
	public void orderDetail1(HttpServletRequest req,HttpServletResponse res) throws ServletException, IOException
	{
		String order_id=req.getParameter("order_id");	
		System.out.println(order_id+"DD");
		req.setAttribute("orderItemList", liuService.orderItemList(order_id));
		req.getRequestDispatcher("admin/order/orderDetail.jsp").forward(req, res);
        
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
