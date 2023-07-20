package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import product.Product;
import product.ProductDAO;

@WebServlet("*.do")
public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ProductDAO productDAO;

	public void init(ServletConfig config) throws ServletException {
		productDAO = new ProductDAO();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String uri = request.getRequestURI();
		String command = uri.substring(uri.lastIndexOf("/"));
		System.out.println(command);

		String nextPage = null;

		// 세션 객체 생성
		HttpSession session = request.getSession();

		if (command.equals("/productList.do")) { // 상품 목록 페이지 요청

			List<Product> productList = productDAO.getProductList();

			// 모델 생성
			request.setAttribute("productList", productList);

			nextPage = "/product/productList.jsp";
		} else if (command.equals("/productInfo.do")) {
			String id = request.getParameter("productId");
			// 상품 정보 메서드 호출
			Product product = productDAO.getProduct(id);

			// 모델 생성
			request.setAttribute("product", product);

			nextPage = "/product/productInfo.jsp";
		} else if (command.equals("/productForm.do")) {
			nextPage = "/product/productForm.jsp";
		} else if (command.equals("/addProduct.do")) {

			String realFolder = "C:/Users/Administrator/git/jspworks0/Market/src/main/webapp/upload";

			MultipartRequest multi = new MultipartRequest(request, realFolder, 5 * 1024 * 1024, "utf-8",
					new DefaultFileRenamePolicy());

			// name 속성 가져오기
			String id = multi.getParameter("productId");
			String pname = multi.getParameter("pname");
			int unitPrice = Integer.parseInt(multi.getParameter("unitPrice"));
			String description = multi.getParameter("description");
			String category = multi.getParameter("category");
			String manufacturer = multi.getParameter("manufacturer");
			long unitsInStock = Long.parseLong(multi.getParameter("unitsInStock"));
			String condition = multi.getParameter("condition");

			// productImage 속성 가져오기
			String name = "";
			String productImage = "";
			Enumeration<String> files = multi.getFileNames();
			if (files.hasMoreElements()) {
				name = files.nextElement(); // 파일이 있으면 이름을 저장
				productImage = multi.getFilesystemName(name); // 서버에 저장된 파일 이름을 저장
			}

			// Product 객체 생성
			Product product = new Product();
			product.setProductId(id);
			product.setPname(pname);
			product.setUnitPrice(unitPrice);
			product.setDescription(description);
			product.setCategory(category);
			product.setManufacturer(manufacturer);
			product.setUnitsInStock(unitsInStock);
			product.setCondition(condition);
			product.setProductImage(productImage);

			// DB 등록 처리
			productDAO.addProduct(product);

			nextPage = "/productList.do";
		} else if (command.equals("/editProduct.do")) {

			List<Product> productList = productDAO.getProductList();

			String edit = request.getParameter("edit");

			// 모델 생성
			request.setAttribute("productList", productList);
			request.setAttribute("edit", edit);

			nextPage = "/product/editProduct.jsp";
		} else if (command.equals("/deleteProduct.do")) {
			String id = request.getParameter("productId");
			String edit = request.getParameter("edit");

			productDAO.deleteProduct(id);

			// 삭제 후 삭제 페이지로 이동함
			nextPage = "/editProduct.do?edit=" + edit;
		} else if (command.equals("/addCart.do")) { // 상품주문 요청
				String id = request.getParameter("productId"); // 상품아이디 값 받아오기
	
				// 장바구니
				List<Product> goodsList = productDAO.getProductList(); // 장바구니 생성
				Product goods = new Product(); // 장바구니 상품 생성
	
				// 목록중에서 추가한 상품을 찾음
				for (int i = 0; i < goodsList.size(); i++) {
					goods = goodsList.get(i); // 장바구니 목록중에서 한개 불러오기
					if (goods.getProductId().equals(id)) { // 요청 아이디의 상품이 기존에 장바구니에 있다면 종류
						break;
					}
				}
	
				// 장바구니에 담기
				List<Product> list = (ArrayList) session.getAttribute("cartList"); // 형변환
				if (list == null) { // 첨에 널이였다가 가져옴
					list = new ArrayList<>();
					session.setAttribute("cartList", list); // 세션이름 - cartList
	
				}
	
				// 수량 증가 - 요청 아이디의 상품이 기존에 장바구니에 있다면
				int cnt = 0;
				Product goodsQnt = new Product(); // 장바구니상품 객체(개수를 가짐)
	
				for (int i = 0; i < list.size(); i++) { // 이전에
					goodsQnt = list.get(i); // 기존개수값 받아오기
					if (goods.getProductId().equals(id)) { // 요청 아이디의 상품이 기존에 장바구니에 있다면
						cnt++; // 추가한 횟수 1 증가 id요청을 몇번했는가 
						int orderQuantity = goodsQnt.getQuantity() + 1; // 주문수량
						goodsQnt.setQuantity(orderQuantity);
	
					}
	
				}
	
				// 장바구니에 이전에 담긴 품목이 아니면
				if (cnt == 0) { // 장바구니가 비어져있을때는
					goods.setQuantity(1);
					list.add(goods); // 수량을 1로 하고, 장바구니에 추가함
				}
			}else if (command.equals("/cart.do")) { // 장바구니 페이지 요청
				//장바군 ㅣ가져오기 및 세션 유지
				List<Product> cartList = (ArrayList) session.getAttribute("cartList"); // 형변환
				if (cartList == null) { // 첨에 널이였다가 가져옴
					cartList = new ArrayList<>();
				}
				//총합계 계산하기
				Product product = null;
				int total = 0, sum = 0; //소계, 총계
				for(int i=0; i<cartList.size();i++) {
					product= cartList.get(i);
					total = product.getUnitPrice() * product.getQuantity();
					sum += total;
				}
				
				
				
				
				//모델 생성
				request.setAttribute("cartList", cartList); // 장바구니 목록 보내주기 cart.jsp로
				request.setAttribute("sum", sum);
				nextPage = "/product/cart.jsp";
			}
		
		
			// 페이지 포워딩 따로 해준는거임 페이지처리
			if (command.equals("/addCart.do")) { // 상품 주문 요청
				String id = request.getParameter("productId"); // 상품아이디 값 받아오기

				response.sendRedirect("/productInfo.do?productId=" + id);
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(nextPage);
				dispatcher.forward(request, response);
			
			}	
			
			
		}
	
}

