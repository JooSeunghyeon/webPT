package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.connector.Response;


public class youtubeDAO {
	
	ResultSet rs = null;
	Connection conn = null;
	PreparedStatement pst = null;
	int cnt=0;
	youtubeDTO dto =null;
	ArrayList<youtubeDTO> al = new ArrayList<youtubeDTO>();
	HttpServletRequest request;
	
	
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
		
		public void close() {
			
			try {
				if(rs !=null) {rs.close();}
				pst.close();
				conn.close();
				
				}catch(Exception e) {
					e.printStackTrace();
				}
		}
		
		
			

		public ArrayList<youtubeDTO> select(String gender, String part) {
			// 런타임오류 : 실행했을 때 발생하는 오류 > 예외처리
			try{
				conn();
				
			    String sql = "select * from youtube where gender=? and part = ?" ;
			                                             // ? : 바인드 변수
			    // 3. sql문 실행객체 ( PreparedStatement ) 생성
			    pst = conn.prepareStatement(sql);
			    
			    pst.setString(1, gender);
			    pst.setString(2, part);
			   
			    // 4. sql문 실행하기
			    rs = pst.executeQuery();
			    
			    while ( rs.next() ) {
			    	String category = rs.getString("category");
			    	String link = rs.getString("link");
			    	String get_part = rs.getString("part");
			    	String get_gender = rs.getString("gender");
			    	String youtuber = rs.getString("youtuber");
			    	
			    	dto =new youtubeDTO(category, link, get_part, get_gender, youtuber);
			    	
			    	// 배열(범위 지정해야함) and Arraylist(범위지정 필요없음)
			    	al.add(dto); // 어레이리스트에 계속 담아줌
			    	
			    }
			}catch(Exception e) {
				e.printStackTrace();
				System.out.println("fail");
			}finally {
				// 열려있으면 닫아줄 수 없으므로 예외문 한번더
					close();
		}
			return al;
		}
		
		
	
		
		
		
		
		
		
		
		
}
