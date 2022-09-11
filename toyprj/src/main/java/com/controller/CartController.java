package com.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;

import com.shopping.toyprj.CartLogic;
import com.shopping.toyprj.Controller;
import com.util.HashMapBinder;
import com.util.ModelAndView;
import com.vo.CartVO;
public class CartController implements Controller {
	Logger logger = Logger.getLogger(CartController.class);
	CartLogic cartLogic = new CartLogic();
	
	@Override
	public Object cartList(HttpServletRequest req, HttpServletResponse res) {
		logger.info("CartController => cart/cartList.do 호출 ");
		List<CartVO> cartList = null;
		ModelAndView mv = new ModelAndView(req); // req넘겨줘야 mv.addObject 사용가능
		mv.setViewName("cart");
		HttpSession session = req.getSession();
		String mem_id = (String)session.getAttribute("mem_id");
		// 회원일 경우 db에서 카트조회
		if(mem_id != null) {
			cartList = cartLogic.cartList(mem_id);
			mv.addObject("cartList", cartList);
		}
		return mv;
	}
	
	@Override
	public Object cartInsert(HttpServletRequest req, HttpServletResponse res) {
		logger.info("CartController => cart/carInsert 호출 ");
		String select = null;
		int result = 0;
		HttpSession session = req.getSession();
		String mem_id = (String)session.getAttribute("mem_id");
		Map<String,Object> pMap = new HashMap<>();
		HashMapBinder hmb = new HashMapBinder(req); //product_no=${cart.getProduct_no()}
		hmb.bind(pMap);
		pMap.put("mem_id", mem_id);
		if(mem_id != null) {
			select = cartLogic.cartSearch(pMap);
			if(select != null) {
				pMap.put("btn", "plus");
				result = cartLogic.cartUpdate(pMap);
			} else {
				result = cartLogic.cartInsert(pMap);
			}	
		}
		else if(mem_id == null) {
			
		}
		String prNo = (String) pMap.get("product_no");
		String category = (String) pMap.get("product_category");
		String path = "product/productDetail.do?product_no=" + prNo + "&product_category=" + category;
		return path;
	}
	
	@Override
	public Object cartUpdate(HttpServletRequest req, HttpServletResponse res) {
		logger.info("CartController => cart/cartUpdate.do 호출 ");
		int result = 0;
		String path = "cart/cartList.do";
		HttpSession session = req.getSession();
		String mem_id = (String)session.getAttribute("mem_id");
		Map<String,Object> pMap = new HashMap<>();
		HashMapBinder hmb = new HashMapBinder(req); //product_no=${cart.getProduct_no()}&btn=plus
		hmb.bind(pMap);
		int product_no = Integer.valueOf((String) pMap.get("product_no"));
		pMap.put("product_no", product_no);
		pMap.put("mem_id", mem_id);
		if(mem_id != null) {
			result = cartLogic.cartUpdate(pMap);
		}
		return path;
	}
	
	@Override
	public Object cartDelete(HttpServletRequest req, HttpServletResponse res) {
		logger.info("CartController => cart/cartDelete.do 호출 ");
		int result = 0;
		String path = "cart/cartList.do";
		Map<String,Object> pMap = new HashMap<>();
		HashMapBinder hmb = new HashMapBinder(req);
		hmb.bind(pMap);
		HttpSession session = req.getSession();
		String mem_id = (String)session.getAttribute("mem_id");
		int product_no = Integer.valueOf((String) pMap.get("product_no"));
		pMap.put("product_no", product_no);
		pMap.put("mem_id", mem_id);
		if(mem_id != null) {
			result = cartLogic.cartDelete(pMap);
		}
		return path;
	}
	@Override
	public ModelAndView execute(HttpServletRequest req, HttpServletResponse res, Map<String, Object> pMap) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse res) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object loginForm(HttpServletRequest req, HttpServletResponse res) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object login(HttpServletRequest req, HttpServletResponse res) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object productList(HttpServletRequest req, HttpServletResponse res) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object productDetail(HttpServletRequest req, HttpServletResponse res) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object productSearch(HttpServletRequest req, HttpServletResponse res) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object productInsertReview(HttpServletRequest req, HttpServletResponse res) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object productUpdateReview(HttpServletRequest req, HttpServletResponse res) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object productUpdateCount(HttpServletRequest req, HttpServletResponse res) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object productInsertLike(HttpServletRequest req, HttpServletResponse res) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object productDeleteLike(HttpServletRequest req, HttpServletResponse res) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object registerForm(HttpServletRequest req, HttpServletResponse res) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object registerSelect(HttpServletRequest req, HttpServletResponse res) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object registerInsert(HttpServletRequest req, HttpServletResponse res) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object memberListPayment(HttpServletRequest req, HttpServletResponse res) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object memberListLike(HttpServletRequest req, HttpServletResponse res) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object memberListReview(HttpServletRequest req, HttpServletResponse res) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object memberListCoupon(HttpServletRequest req, HttpServletResponse res) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object memberListP(HttpServletRequest req, HttpServletResponse res) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object memberInsertCoupon(HttpServletRequest req, HttpServletResponse res) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object memberInsertAddress(HttpServletRequest req, HttpServletResponse res) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object memberUpdateP(HttpServletRequest req, HttpServletResponse res) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object memberUpdateState(HttpServletRequest req, HttpServletResponse res) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object memberDelete(HttpServletRequest req, HttpServletResponse res) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object orderList(HttpServletRequest req, HttpServletResponse res) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object orderInsert(HttpServletRequest req, HttpServletResponse res) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object orderUpdateCoupon(HttpServletRequest req, HttpServletResponse res) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object orderUpdatePoint(HttpServletRequest req, HttpServletResponse res) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object orderDelete(HttpServletRequest req, HttpServletResponse res) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public Object logout(HttpServletRequest req, HttpServletResponse res) {
		// TODO Auto-generated method stub
		return null;
	}

}
