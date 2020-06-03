package begin.oracle.model;

import java.sql.*;
import java.util.*;

import javax.naming.*;
import javax.sql.DataSource;

public class MemberDAO {

	private DataSource ds;	//	DataSource ds는 아파치톰캣이 제공하는 DBCP(DB Connection Pool)이다.
	private Connection conn;	// =null 객체의 초기치는 null!! 생략가능! 
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public MemberDAO() {
		try {
			Context initContext = new InitialContext();
		    Context envContext  = (Context)initContext.lookup("java:/comp/env");
		    ds = (DataSource)envContext.lookup("jdbc/myoracle");
		}catch(NamingException e) {
			e.printStackTrace();
		}
	} 
	private void close() {
		try{
			if(rs != null) {rs.close(); rs=null;}
			if(pstmt != null) {pstmt.close(); pstmt=null;}
			if(conn != null) {conn.close(); conn=null;}
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	// === 회원가입(insert) 메소드 생성하기 === 
	public int memberRegister(MemberVO mvo) throws SQLException {
		int result = 0;
		try {
		conn = ds.getConnection(); // 풀장에서 빈 튜브를 받아오겠다. 
		String sql = " insert into mymvc_member(userid, passwd, name, email, gender, interest, introduce) "
					+" values(?, ?, ?, ?, ?, ?, ?) ";
		
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1,  mvo.getUserid());
		pstmt.setString(2,  mvo.getPasswd());
		pstmt.setString(3,  mvo.getName());
		pstmt.setString(4,  mvo.getEmail());
		pstmt.setString(5,  mvo.getGender());
		
		String interest = null;
		if(mvo.getInterest() != null){
			interest = String.join(",", mvo.getInterest()); //  mvo.getInterest()자체가 String 타입의 배열
		}
		pstmt.setString(6, interest);
		pstmt.setString(7, mvo.getIntroduce());
		
		result = pstmt.executeUpdate();
		
		}finally {
			close(); // 성공하든 실패하든 자원 반납해라
		}
		return result;
	}
	
	// ===== 특정한 한명의 회원 정보 조회해주는 메소드 생성하기 ===== //
	 public MemberVO memberOneInfoView(String userid) throws SQLException{      
	      MemberVO mvo = null;     
	      try {   
	    	 conn = ds.getConnection();
	         String sql = " select userid, name, email, gender, interest," + 
	                  "    to_char(registerday,'yyyy-mm-dd hh24:mi:ss')as registerday, " + 
	        		  " 	introduce " +
	                  " from mymvc_member " + 
	                  " where userid=?";   
	         
	         pstmt = conn.prepareStatement(sql);         
	         pstmt.setString(1, userid);
	         
	         rs=pstmt.executeQuery();
	         
	         if(rs.next()) {
	        	 mvo = new MemberVO();
	        	 mvo.setUserid(rs.getString(1));
	        	 mvo.setName(rs.getString(2));
	        	 mvo.setEmail(rs.getString(3));
	        	 mvo.setGender(rs.getString(4));
	        	 
	        	 String[] interest = null;
	        	 String str = rs.getString(5);
	        	 if(str != null) {
	        		 interest = str.split(",");
	        	 }	 
	        	 mvo.setInterest(interest);
	        	 mvo.setRegisterday(rs.getString(6));
	        	 mvo.setIntroduce(rs.getString(7));
	         }
	         
	      } finally {
	    	  close();
	      }
      
	      return mvo;
	      
	   }
	 
	// ===== 모든 회원 정보 조회해주는 메소드 생성하기 ===== //
	public List<MemberVO> selectAllMember() throws SQLException {
		
		List<MemberVO> memberList = new ArrayList<MemberVO>();
		
		try {
			conn = ds.getConnection();
			
			String selectSQL = " select userid, name, email, gender, interest "+
					"      ,to_char(registerday, 'yyyy-mm-dd hh24:mi:ss') AS registerday "+
					" from mymvc_member "+
					" order by registerday desc ";			
			
		    pstmt = conn.prepareStatement(selectSQL);
	         
	        rs = pstmt.executeQuery();
	        
	        while(rs.next()) {
	        	MemberVO mvo = new MemberVO();
	        	
	        	mvo.setUserid(rs.getString(1));
	        	mvo.setName(rs.getString(2));
	        	mvo.setEmail(rs.getString(3));
	        	mvo.setGender(rs.getString(4));
	        	
	        	String[] interestArr = null;
	        	String str = rs.getString(5);
	        	
	        	if(str != null) {
	        		interestArr = str.split(",");
	        	}
	        	
	        	mvo.setInterest(interestArr);
	        	mvo.setRegisterday(rs.getString(6));
	        
	        	memberList.add(mvo);
	
	         }
	         
	      } finally {
	    	  close();
	      }
	 
	      return memberList;
	      
		}
	
	// ===== 회원을 삭제하는 메소드 생성하기 ===== //
	public int memberDelete(String userid) throws SQLException {	//	memberDelete의 파라미터에는 userid?????
		
		int result = 0;
		
		try {
			conn = ds.getConnection(); // 풀장에서 빈 튜브를 받아오겠다. 
			String sql = " delete from mymvc_member "
						+" where userid = ? ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userid);	// where/ userid의 위치홀더가 들어와야한다. 
			
			result = pstmt.executeUpdate();
			
			}finally {
				close(); // 성공하든 실패하든 자원 반납해라
			}
		
		return result;
	}
	
	// == 회원의 정보를 수정하는 메소드 생성하기 == //
	public int memberUadate(MemberVO mvo) throws SQLException {	// MemberVO만 들어온다면!
		int result = 0;
		
		try {
			conn = ds.getConnection(); // 풀장에서 빈 튜브를 받아오겠다. 
			String sql = " update mymvc_member set name = ? "
						+" 			             , passwd = ? "
						+" 						 , email = ? "
						+" 						 , interest = ? "
						+" where userid = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mvo.getName());
			pstmt.setString(2, mvo.getPasswd());
			pstmt.setString(3, mvo.getEmail());
			pstmt.setString(4, mvo.getAttention());	// Interest은 배열이라 위에처럼 하면 안됨. 하나의 문자열이 와야함. geetAttention.
			pstmt.setString(5, mvo.getUserid());
		
			result = pstmt.executeUpdate();
			
			}finally {
				close(); // 성공하든 실패하든 자원 반납해라
			}
		
		return result;
	}
}	





























