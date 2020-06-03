package begin.oracle.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import begin.oracle.model.MemberDAO;
import begin.oracle.model.MemberVO;

@WebServlet("/updateMember.do")
public class MemberUpdateCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		execute(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		execute(request, response);
	}

	private void execute(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {

		String path="";
		try {
			MemberDAO mdao = new MemberDAO();
			
			String userid = request.getParameter("userid");
			MemberVO mvo = mdao.memberOneInfoView(userid);
			// mvo가 변경하려는 회원이다.
			
			String method = request.getMethod();
			
			// GET방식이라면 (회원정보 변경하기 면을 띄워주기 용도)
			if("GET".equalsIgnoreCase(method)) { // 회원정보 변경하기 화면을 띄워주겠다.
				
				request.setAttribute("mvo", mvo);
					
				path="/WEB-INF/beginOracle/memberUpdate.jsp";	// get 은 path 있어서 아래 (path)에 넣어준다.		
				
				RequestDispatcher dispatcher = request.getRequestDispatcher(path);
				dispatcher.forward(request, response);         
			}
			
			// POST방식라면 (회원 바꿔주면 끝)  path가 없어서 디폴트값으로 나옴.
			else {
				// 회원정보 변경하기 화면에서 '회원변경' 버튼을 클릭한 경우
				String passwd = request.getParameter("passwd");
				String name = request.getParameter("name");
				String email = request.getParameter("email");
				String[] arrInterest = request.getParameterValues("interest"); // 배열
				
				mvo.setPasswd(passwd);
				mvo.setName(name);
				mvo.setEmail(email);
				mvo.setInterest(arrInterest);
				
				int n = mdao.memberUadate(mvo);
				// 회원의 정보를 수정하는 메소드를 호출한다.
				
				// 회원의 정보를 변경한 다음에는 변경 된 회원의 정보를 보여주는 URL 페이지로 이동시키자.
				response.sendRedirect("myInfoView.do?userid="+userid);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			
			// Exception 이 발생되어지면 에러페이지를 보여줄 View단으로 가야한다.
			request.setAttribute("errMsg", e.getMessage());
			path = "/WEB-INF/beginOracle/error.jsp";
	        
	        RequestDispatcher dispatcher = request.getRequestDispatcher(path); 
			dispatcher.forward(request, response);
		}  
	}
}
