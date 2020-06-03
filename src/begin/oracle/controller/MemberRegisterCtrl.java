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

@WebServlet("/memberRegister.do")
public class MemberRegisterCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {
		execute(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
		throws ServletException, IOException {
		execute(request, response);
	}
	
	// == !!!!!!!!!!!! 크로스 사이트 스크립트 공격에 대응하는 안전한 코드(시큐어 코드) 작성해주는 메소드 생성하기 !!!!!!!!!!!! == //
	private String replaceParameter(String param) { // 1원본대신에 
		String result = param;
		if(param != null) {
			result = result.replaceAll("<", "&lt;"); // 부등호 모양으로 바꾼다. 2바꾼값을
			result = result.replaceAll(">", "&gt;");
			result = result.replaceAll("&", "&amp;");
			result = result.replaceAll("\"", "&quot;");
			
		}
		return result;	//3넘겨주겠다.
	}
	
	private void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		/* http://localhost:9090/MyMVC/memberRegister.do 들어가면 확인할 수 있음 */
  
		/* ☆★ WEB-INF 밑에 있는 .jsp파일은 직접적으로 볼 수 없기 때문에 서블릿을 사용해서 보여줘야한다 !! -> 보안도 좋음  */
		
	/*	
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/test2/test2.jsp"); 
		dispatcher.forward(request, response);
	*/	
		String method = request.getMethod(); // "GET" 또는 "POST" 
		// System.out.println("~~~~~ 확인용 method : "+ method + "~~~~~");
		
		request.setAttribute("method", method);
		
		String path= "";
		if("GET".equalsIgnoreCase(method)) {	// get일때만 띄운다
			// GET 방식인 경우
			path= "/WEB-INF/beginOracle/memberRegister.jsp";

		}
		else {
			// POST 방식인 경우
			String userid = request.getParameter("userid");
			String passwd = request.getParameter("passwd");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String gender = request.getParameter("gender");
			
			String[] interestArr = request.getParameterValues("interest");
			
			// == !!!!!!!!!!!! 크로스 사이트 스크립트 공격에 대응하는 안전한 코드(시큐어 코드) 작성해주는 메소드 생성하기 !!!!!!!!!!!! == //
			String introduce = request.getParameter("introduce");
			
			introduce = this.replaceParameter(introduce);
			
			introduce = introduce.replaceAll("\r\n", "<br/>"); // replaceAll 바꿔주겠다~! 
			// 가입인사의 내용물에서 \r\n(엔터)가 있으면 줄 바꿈인 <br/>로 변경한다.
			
			
		/*	
			String interest = "";
			if(interestArr != null) {	// interestArr.length는 안됨. interestArr자체가 null이라서
				interest = String.join(",", interestArr);
				 // null이 아니기 때문에 문자열을 배열로 바꿀 수 있음 
			}
					
			System.out.println("~~~ 1 userid : "+userid+"\n"+
								"~~~ 2 passwd : "+passwd+"\n"+
								"~~~ 3 name : "+name+"\n"+
								"~~~ 4 email : "+email+"\n"+
								"~~~ 5 gender : "+gender+"\n"+
								"~~~ 6 interestArr : "+interest+"\n"
								);
		*/	
			
			MemberVO mvo = new MemberVO(userid, passwd, name, email, gender, interestArr, introduce);
			
			MemberDAO mdao = new MemberDAO();
			
			try {
				int n = mdao.memberRegister(mvo);
				
				if(n==1) {
					//정상적으로 회원이 가입되었으므로 가입되었다는 정보를 보여줄 View단으로 가야한다.
					request.setAttribute("result", "success");
					request.setAttribute("name", name);
					request.setAttribute("userid", userid);
				}
				else {
					//회원가입이 안되었으므로 회원가입이 안되었다는 정보를 보여줄 View단으로 가야한다.
					request.setAttribute("result", "fail");
				}
				
				path ="/WEB-INF/beginOracle/memberRegister_Result.jsp";
				
			}catch(Exception e) {
				e.printStackTrace();
				
				// Exception이 발생되어지면 에러페이지를 보여줄 View단으로 가야한다.
				request.setAttribute("errMsg", e.getMessage());
				
				path = "/WEB-INF/beginOracle/error.jsp";
			}
		}
	  RequestDispatcher dispatcher = request.getRequestDispatcher(path);
      dispatcher.forward(request, response);         

	}
}