package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class foodDAO {

	
	
	ResultSet rs = null;
	Connection conn = null;
	PreparedStatement pst = null;
	int cnt=0;
	
	
	
	
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
		
		public ArrayList<foodDTO> getFood_info(String category) {
            ArrayList<foodDTO> arr = new ArrayList<foodDTO>();
             try {
                conn();
                
                String sql = "select * from food order by product_cal "+category;
                pst = conn.prepareStatement(sql);
             
                rs = pst.executeQuery();
                
                while(rs.next()) {
                   String product_name = rs.getString("product_name");
                   int product_cal = rs.getInt("product_cal");
                   int product_carb = rs.getInt("product_carb");
                   int product_prot = rs.getInt("product_prot");
                   int product_fat = rs.getInt("produc_fat");
                   
                   arr.add(new foodDTO(product_name, product_cal, product_carb, product_prot, product_fat));
                }
                
             } catch (Exception e) {
                e.printStackTrace();
             } finally {
                close();
             }
             return arr;
          }
	
	
	
	
	
	
	
	
}
