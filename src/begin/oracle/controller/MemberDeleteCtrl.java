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

@WebServlet("/memberDelete.do")
public class MemberDeleteCtrl extends HttpServlet {
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
		
		String userides = request.getParameter("userides");
		// System.out.println("~~~~~~~ 확인용 userides : " + userides + "~~~~~~~");
		// ~~~~~~~ 확인용 userides : ZXCVB~~~~~~~
		
		String[] useridArr = userides.split(","); // string 타입의 배열에 콤마를 넣어,,~!
		
		MemberDAO mdao = new MemberDAO();
		
		int sum=0;
		
		for(int i=0; i<useridArr.length; i++) {
			try {
				int n = mdao.memberDelete(useridArr[i]); // 오류가 발생되어진다면 catch를 해온다.
				sum += n;
			} catch (SQLException e) {	//exception처리를 해주겠다~! 근데 for문을 못빠져나가기에 다시 올라가서 실행// 트라이캐치가 없으면 그냥 멈춰서 for문일 안돎.
				e.printStackTrace();
				
				// Exception이 발생되어지면 에러페이지를 보여줄 View단으로 가야한다.
				request.setAttribute("errMsg", e.getMessage());
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/beginOracle/error.jsp");
			    dispatcher.forward(request, response);       
			    
				break; //for문을 빠져나가기 위해 break;를 해줘야함. break안하면 계속 돌아요
			}
		}
		
		//for문을 빠지고 나서 만약에 (삭제가 확실히 됐따면 / 선택한 userid 만큼 다 지웠다면)
		if(sum == useridArr.length) {
			// System.out.println("~~~ 확인용 : 선택한 회원 모두 삭제함 ~~~");
			
			// 삭제하고 다시 남은 회원정보를 보여주기 위해, 데이터를 넘겨주는 것이 아니라 단순하게 "URL 페이지 이동(response)"만 시키자.
			response.sendRedirect("selectAllMember.do"); // 페이지 이동.   맨 앞에 /슬래시가 없으니 상대경로    즉, 맨 마지막 / 뒤에 값을 지우고 적어준게 들어옴
		}
		
	  
	}

}
