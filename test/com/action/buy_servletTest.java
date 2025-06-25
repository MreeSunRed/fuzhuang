package com.action;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static org.easymock.EasyMock.*;
import static org.junit.Assert.assertTrue;

public class buy_servletTest  {
    private static buy_servlet bs;
    private HttpServletRequest mockRequest;
    private HttpServletResponse mockResponse;

    @Before
    public void setUp() throws Exception {
        bs = new buy_servlet();

        mockRequest = createMock(HttpServletRequest.class);                          //加载

        mockResponse = createMock(HttpServletResponse.class);
    }

    @After
    public void tearDown() throws Exception {
        verify(mockRequest);                //验证

        verify(mockResponse);
    }

    @Test
    public void service()throws ServletException, IOException
    {
        mockRequest.getParameter("type");
        expectLastCall().andReturn("addToCart");
        mockRequest.getParameter("goods_id");
        expectLastCall().andReturn("addToCart");

        replay(mockRequest);                                           //回放

        replay(mockResponse);
        bs.service(mockRequest, mockResponse);
        assertTrue(true);
    }

    @Test
    public void addToCart() {
    }

    @Test
    public void orderSubmit() {
    }

    @Test
    public void myorder() {
    }

    @Test
    public void orderDetail() {
    }

    @Test
    public void orderDetail1() {
    }

    @Test
    public void dispatch() {
    }

    @Test
    public void init() {
    }

    @Test
    public void destroy() {
    }
}