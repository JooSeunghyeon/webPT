package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;





public class calendarDAO {
	
	
	ResultSet rs = null;
	Connection conn = null;
	PreparedStatement pst = null;
	int cnt=0;
	calendarDTO dto = null;
	ArrayList<calendarDTO> al = new ArrayList<calendarDTO>();
	//memberDTO dto = (memberDTO)session.getAttribute("info");
	
	// 데이터페이스와 연결
	public void conn() {
		try {
		// 1. JDBC 드라이버 동적로딩
				Class.forName("oracle.jdbc.driver.OracleDriver");
					
				String url = "jdbc:oracle:thin:@221.156.142.70:1521:xe";
				String user = "hr";
				String password = "hr";
					
				// 2. 데이터베이스 연결객체(Connection)생성
			    conn = DriverManager.getConnection(url, user, password);
		}catch(Exception e) {
			e.printStackTrace();
			
		}
	}

	//닫기
	public void close() {
		
		try {
			if(rs !=null) {rs.close();}
			pst.close();
			conn.close();
			
			}catch(Exception e) {
				e.printStackTrace();
			}
	}

	
	public ArrayList<calendarDTO> select(String userId) {
		
		// 런타임오류 : 실행했을 때 발생하는 오류 > 예외처리
		try{
			conn();
			
		    String sql = "select * from calendar where calendar_userid = ?";
		                                             // ? : 바인드 변수
		    // 3. sql문 실행객체 ( PreparedStatement ) 생성
		    pst = conn.prepareStatement(sql);
		    pst.setString(1, userId);
			
		    // 4. 바인드 변수 채워주기
		    
		    // 5. sql문 실행하기
		    rs = pst.executeQuery();
		    
		    while ( rs.next() ) {
		    	String id = rs.getString(1);
		    	String title = rs.getString(2);
		    	String start = rs.getString(3);
		    	String end = rs.getString(4);
		    	String description = rs.getString(5);
		    	String type = rs.getString(6);
		    	String user = rs.getString(7);
		    	String color = rs.getString(8);
		    	String textColor = rs.getString(9);
		    	
		    	
		    	
		    	calendarDTO dto = new calendarDTO(id, title, start, end, description, type, user, color, textColor);
		    	
		    	
		    	al.add(dto);
		    	
		    	System.out.println("우왕굳");
		    }
		    
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("에라이");
		}finally {
			// 열려있으면 닫아줄 수 없으므로 예외문 한번더
			close();
			
		}
		return al;
	}
	
	
	public int add(calendarDTO dto) {
		// 런타임오류 : 실행했을 때 발생하는 오류 > 예외처리
		try{
			
			conn();
			
		    String sql = "insert into calendar values ('아이디', ?, ?, ?, ?, ?, ?, ?, '텍스트컬러')";
		                                             // ? : 바인드 변수
		    // 3. sql문 실행객체 ( PreparedStatement ) 생성
		    pst = conn.prepareStatement(sql);
			
		    // 4. 바인드 변수 채워주기
		    pst.setString(1, dto.getCal_title());
		    pst.setString(2, dto.getCal_start());
		    pst.setString(3, dto.getCal_end());
		    pst.setString(4, dto.getCal_description());
		    pst.setString(5, dto.getCal_type());
		    pst.setString(6, dto.getCal_user());
		    pst.setString(7, dto.getCal_color());
		    
		    // 5. sql문 실행하기
		    cnt = pst.executeUpdate();
		    
		  
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("FAIL");
		}finally {
			// 열려있으면 닫아줄 수 없으므로 예외문 한번더
			close();
			
		}
		return cnt;
	
	}
	
	// 켈린더 출력 해주기 
public ArrayList<calendarDTO> calendar_select(String user) {
		// 런타임오류 : 실행했을 때 발생하는 오류 > 예외처리
		try{
			conn();
			
		    String sql = "select * from calendar where calendar_userid =?" ;
		                                             // ? : 바인드 변수
		    // 3. sql문 실행객체 ( PreparedStatement ) 생성
		    pst = conn.prepareStatement(sql);
		    
		    pst.setString(1, user);
			
		    // 4. 바인드 변수 채워주기
		    
		    // 5. sql문 실행하기
		    rs = pst.executeQuery();
		    
		    while ( rs.next() ) {
		    	String title = rs.getString(2);
		    	String start = rs.getString(3);
		    	String end = rs.getString(4);
		    	String desc = rs.getString(5);
		    	String type = rs.getString(6);
		    	String get_user = rs.getString(7);
		    	String color = rs.getString(8);
		    	
		    	dto = new calendarDTO(title, start, end, desc, type, get_user, color);
		    	
		    	al.add(dto);
		    }
		    System.out.println("유저별 정보");
		    
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("fail..");
		}finally {
			// 열려있으면 닫아줄 수 없으므로 예외문 한번더
			close();
			
		}
		return al;
	}
	
	
}
