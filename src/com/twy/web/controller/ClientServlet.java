package com.twy.web.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.twy.domain.Book;
import com.twy.domain.Category;
import com.twy.domain.Orders;
import com.twy.domain.OrdersItem;
import com.twy.domain.User;
import com.twy.service.BusinessService;
import com.twy.service.impl.BusinessServiceImpl;
import com.twy.util.IdGenerator;
import com.twy.util.PaymentUtil;
import com.twy.util.PropertyUtil;
import com.twy.util.WebUtil;
import com.twy.web.bean.Cart;
import com.twy.web.bean.CartItem;
import com.twy.web.bean.Page;

public class ClientServlet extends HttpServlet {
	private BusinessService s = new BusinessServiceImpl();
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String operation = request.getParameter("operation");
		if("showAllBooks".equals(operation)){
			showAllBooks(request,response);
		}else if("showCategoryBooks".equals(operation)){
			showCategoryBooks(request,response);
		}else if("buy".equals(operation)){
			buy(request,response);
		}else if("genOrders".equals(operation)){
			genOrders(request,response);
		}else if("regist".equals(operation)){
			regist(request,response);
		}else if("login".equals(operation)){
			login(request,response);
		}else if("active".equals(operation)){
			active(request,response);
		}else if("logout".equals(operation)){
			logout(request,response);
		}else if("showSelfOrders".equals(operation)){
			showSelfOrders(request,response);
		}else if("paySuccess".equals(operation)){
			paySuccess(request,response);
		}else if("showOrdersDetail".equals(operation)){
			showOrdersDetail(request,response);
		}
	}
	//?????????id?????????
	private void showOrdersDetail(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String ordersId = request.getParameter("ordersId");
		//?鶩????
		List<OrdersItem> items = s.findOrdersItemByOrdersId(ordersId);
		request.setAttribute("items", items);
		request.getRequestDispatcher("/showOrdersDetail.jsp").forward(request, response);
	}
	private void paySuccess(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String p1_MerId = request.getParameter("p1_MerId");
		String r0_Cmd = request.getParameter("r0_Cmd");
		String r1_Code = request.getParameter("r1_Code");//????????1??????
		String r2_TrxId = request.getParameter("r2_TrxId");
		String r3_Amt = request.getParameter("r3_Amt");
		String r4_Cur = request.getParameter("r4_Cur");
		String r5_Pid = request.getParameter("r5_Pid");
		String r6_Order = request.getParameter("r6_Order");
		String r7_Uid = request.getParameter("r7_Uid");
		String r8_MP = request.getParameter("r8_MP");
		String r9_BType = request.getParameter("r9_BType");
		String  hmac= request.getParameter("hmac");
		
		boolean b = PaymentUtil.verifyCallback(hmac, p1_MerId, r0_Cmd, r1_Code, r2_TrxId, r3_Amt, r4_Cur, r5_Pid, r6_Order, r7_Uid, r8_MP, r9_BType, PropertyUtil.getValue("keyValue"));
		if(!b){
			response.getWriter().write("???????????????????");
			return;
		}
		if("1".equals(r1_Code)){

			s.paiedOrders(r6_Order);
			response.getWriter().write("????????2??????????????????");
			response.setHeader("Refresh", "2;url="+request.getContextPath());
		}
	}
	private void showSelfOrders(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		User user = (User) request.getSession().getAttribute("user");
		if(user==null){
			response.sendRedirect(request.getContextPath()+"/login.jsp");
		}else{
			List<Orders> orders = s.findOrdersByUserId(user.getId());
			request.setAttribute("os", orders);
			request.getRequestDispatcher("/showOrders.jsp").forward(request, response);
		}
	}
	private void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.getSession().removeAttribute("user");
		response.getWriter().write("退出成功");
		response.setHeader("Refresh", "2;url="+request.getContextPath());
	}

	private void active(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String code = request.getParameter("code");
		if(code!=null){
			User user = s.findUserByCode(code);
			if(user==null){
				request.setAttribute("message", "<script type='text/javascript'>alert('账户不存在')</script>");
				request.getRequestDispatcher("/").forward(request, response);
			}else{
				s.active(user);
				response.getWriter().write("激活成功");
				response.setHeader("Refresh", "2;url="+request.getContextPath());
			}
		}
	}
	private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		User user = s.login(username,password);
		if(user==null){
			request.setAttribute("message", "<script type='text/javascript'>alert('账户或密码错误')</script>");
		}else{
			request.getSession().setAttribute("user", user);
		}
		request.getRequestDispatcher("/").forward(request, response);
	}
	//????????
	private void regist(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = WebUtil.findFormData(User.class, request);
		String code = IdGenerator.genPK();
		user.setCode(code);
		
		//SendMail sm = new SendMail(user,request.getContextPath());
		//sm.start();
		user.setActived(true);
		
		s.regist(user);
		request.setAttribute("message", "<script type='text/javascript'>alert('注册成功')</script>");
		request.getRequestDispatcher("/").forward(request, response);
		
	}
	private void genOrders(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		User user = (User) request.getSession().getAttribute("user");
		if(user!=null){
				Cart cart = (Cart)request.getSession().getAttribute("cart");
				if(cart!=null){
					Orders o = new Orders();
					o.setNum(cart.getTotalNum());
					o.setMoney(cart.getTotalPrice());
					o.setUser(user);
					for(Map.Entry<String, CartItem> me:cart.getItems().entrySet()){
						OrdersItem item = new OrdersItem();
						item.setNum(me.getValue().getNum());
						item.setPrice(me.getValue().getPrice());
						item.setBook(me.getValue().getBook());
						o.getItems().add(item);
					}
					s.genOrders(o);
					
				}else{
					throw new RuntimeException("出问题了");
				}
				request.setAttribute("message", "<script type='text/javascript'>alert('订单生成成功')</script>");
				request.getRequestDispatcher("/").forward(request, response);
		}else{
			response.sendRedirect(request.getContextPath()+"/login.jsp");
		}
	}
	private void buy(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bookId = request.getParameter("bookId");
		Book book = s.findBookById(bookId);
		HttpSession session = request.getSession();
		Cart cart = (Cart)session.getAttribute("cart");
		if(cart==null){
			cart = new Cart();
			session.setAttribute("cart", cart);
		}
		cart.addBook(book);
		request.setAttribute("message", "<script type='text/javascript'>alert('成功')</script>");
		request.getRequestDispatcher("/").forward(request, response);
	}
	private void showCategoryBooks(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String pagenum = request.getParameter("pagenum");
		String categoryId = request.getParameter("categoryId");
		Page page = s.findAllBooksByCategory(pagenum,categoryId);
		page.setUrl("/client/ClientServlet?operation=showCategoryBooks&categoryId="+categoryId);
		request.setAttribute("page", page);
		request.getRequestDispatcher("/listBooks.jsp").forward(request, response);
	}
	private void showAllBooks(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String pagenum = request.getParameter("pagenum");
		Page page = s.findAllBooks(pagenum);
		page.setUrl("/client/ClientServlet?operation=showAllBooks");
		request.setAttribute("page", page);
		//??????з??????
		List<Category> cs = (List<Category>) getServletContext().getAttribute("cs");
//		if(cs==null||cs.size()<1){
			cs = s.findAllCategories();
			getServletContext().setAttribute("cs", cs);
//		}
		request.getRequestDispatcher("/listBooks.jsp").forward(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
