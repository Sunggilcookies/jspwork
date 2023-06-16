// 43행 오타
// 	}else if(command.equals("loginProcess.do")){ //로그인 체크요쳥 주소에 슬래시 안붙이면 오류
package controller;
// 서블릿 -메인컨트롤러
//1. url 매핑 2. 제어함수(DAO,VO) 

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import board.Board;
import board.BoardDAO;
import member.Member;
import member.MemberDAO;

@WebServlet("*.do") //경로를 .do로 끝나도록 설정
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 4L;

	MemberDAO memberDAO; //MemberDAO 객체 선언
	BoardDAO boardDAO; //MemberDAO 객체 선언
	
	
	public void init(ServletConfig config) throws ServletException {
	
		memberDAO = new MemberDAO(); //객체 생성
		boardDAO = new BoardDAO(); //객체 생성
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//한글 인코딩
		request.setCharacterEncoding("utf-8");
		//한글 컨텐츠 유형 응답
		response.setContentType("text/html; charset=utf-8");
		
		//command 패턴으로 url 설정하기
		String uri = request.getRequestURI();
	
		String command = uri.substring(uri.lastIndexOf('/'));
		
		System.out.println(uri);
		System.out.println();
		System.out.println(uri.lastIndexOf('/'));
		System.out.println("command: "+ command);
		
		String nextPage = null;
		
		//출력 스트림 객체 생성
		PrintWriter out = response.getWriter();
		
		//세선 객체 생성
		HttpSession session = request.getSession();
		
		//회원 목록 조회
		if(command.equals("/memberList.do")){
			ArrayList<Member> memberList = memberDAO.getMemberList();
		
			
			//모델생성 보내기
			request.setAttribute("memberList", memberList);
			
			nextPage = "/member/memberList.jsp";
		}else if(command.equals("/memberForm.do")) {
			nextPage = "/member/memberForm.jsp";
		}else if(command.equals("/addMember.do")) {
			//폼에 입력된 데이터 받기
			String memberId = request.getParameter("memberId");
			String Passwd = request.getParameter("passwd1");
			String name = request.getParameter("name");
			String gender = request.getParameter("gender");
			
			Member newMember = new Member();
			newMember.setMemberId(memberId);
			newMember.setPasswd(Passwd);
			newMember.setName(name);
			newMember.setGender(gender);
			
				
			memberDAO.addMember(newMember); //회원 매개로 DB에 저장
			
			
		
			session.setAttribute("sessionId", memberId);
			
			nextPage = "/index.jsp";
			
		}else if(command.equals("/memberView.do")){
			
			//MemberId 받기
			
			
			String memberId = request.getParameter("memberId");
			Member member = memberDAO.getMember(memberId);
			request.setAttribute("member", member); //member 모델 생성
			
			nextPage = "/member/memberView.jsp";
		}else if(command.equals("/loginForm.do")){//로그인페이지 요청
			nextPage = "/member/loginForm.jsp";
		}else if(command.equals("/loginProcess.do")){ //로그인 체크요쳥
			
			//로그인 폼에 입된 데이터 받아오기
			String memberId = request.getParameter("memberId");
			String passwd = request.getParameter("passwd");
			
			Member loginMember = new Member();
			loginMember.setMemberId(memberId);
			loginMember.setPasswd(passwd);
			
			//로그인 체크처리
			boolean result = memberDAO.checkLogin(loginMember);
			if(result) {
				nextPage= "/index.jsp";
				//세션 발급 -아이디에 발급
				session.setAttribute("sessionId", memberId);
				
			}else {
				//2가지 방법 : alert(), errorMsg 보내기 (모델)
				out.println("<script>");
				out.println("alert('아이디와 비밀번호를 확인해주세요')");
				out.println("history.go(-1)");
				out.println("</script>");
			}
	
		}else if(command.equals("/logout.do")) { //로그아웃 요청
			//세션 모두삭제(해제)
			session.invalidate();
			nextPage = "/index.jsp";
		}else if(command.equals("/deleteMember.do")) { //회원삭제 요청
			String memberId=request.getParameter("memberId");
			memberDAO.deletMember(memberId);
			nextPage = "/memberList.do";
		}
			
		//게시판 관리
		if(command.equals("/boardList.do")) {
			ArrayList<Board> boardList = boardDAO.getBoardList();
			
			//모델 생성
			request.setAttribute("boardList", boardList);
			
			nextPage = "/board/boardList.jsp";
		}else if(command.equals("/boardForm.do")) {
			nextPage="/board/boardForm.jsp";
		}else if(command.equals("/addBoard.do")) {
			
			String realFolder = "C://green_project//jspworks//Members//src//main//webapp//upload";
			
			MultipartRequest multi = new MultipartRequest(request, realFolder, 5*1024*1024, "utf-8", new DefaultFileRenamePolicy());
			
			//글쓰기 폼에 입력된 데이터 받아오기
			String title = multi.getParameter("title");
			String content = multi.getParameter("content");
			//memberId 세션을 가져오기
			String memberId = (String)session.getAttribute("sessionId");
			
			//fileName 속성 가져오기
			Enumeration<String> files = multi.getFileNames();
			String name = "";
			String filename ="";
			if(files.hasMoreElements()) {
				name = (String)files.nextElement();
				filename = multi.getFilesystemName(name);
				
			}
			
			Board newBoard = new Board();
			newBoard.setTitle(title);
			newBoard.setContent(content);
			newBoard.setMemberId(memberId);
			newBoard.setMemberId(memberId);
			newBoard.setFileUpload(filename);
			
			//글쓰기 처리 메서드 호출
			boardDAO.addBoard(newBoard);
						
		}else if(command.equals("/boardView.do")) {
			int bnum = Integer.parseInt(request.getParameter("bnum"));
			Board board = boardDAO.getBoard(bnum);
			//
			//모델생성
			request.setAttribute("board",board);
			nextPage = "/board/boardView.jsp";
		
		}else if (command.equals("/deleteBoard.do")) {
			int bnum = Integer.parseInt(request.getParameter("bnum"));
			boardDAO.deleteBoard(bnum);
			nextPage = "/boardList.do"; 
			
		}else if (command.equals("/updateBoard.do")) { //삭제 후 게시물 목록 이동
			int bnum = Integer.parseInt(request.getParameter("bnum"));
			
			Board board = boardDAO.getBoard(bnum); //게시글 상세보기
			request.setAttribute("board", board);
			nextPage="/board/updateBoard.jsp";
		
		}else if (command.equals("/updateProcess.do")) {
			//수정 페이지에서 입력된 폼 내용 받기\
			int bnum= Integer.parseInt(request.getParameter("bnum"));	
			String title= request.getParameter("title");	
			String content= request.getParameter("content");
			
			Board updateBoard = new Board();
			updateBoard.setTitle(title);
			updateBoard.setContent(content);//제목과 내용 값 수정
			updateBoard.setBnum(bnum);
			
			boardDAO.updateBoard(updateBoard); //수정처리
			nextPage = "/boardList.do";
			
		}

			
		//포워딩 - 새로고침 자동저ㄷ장 오류 해결 :  response.sendRedirect
		if(command.equals("/addBoard.do")) {
			response.sendRedirect("/boardList.do");
		}else {
			RequestDispatcher dispatcher = 
					request.getRequestDispatcher(nextPage);
			dispatcher.forward(request, response);
		}
		
		
	}

}
