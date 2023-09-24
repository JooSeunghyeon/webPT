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
	
	// ���������̽��� ����
	public void conn() {
		try {
		// 1. JDBC ����̹� �����ε�
				Class.forName("oracle.jdbc.driver.OracleDriver");
					
				String url = "jdbc:oracle:thin:@221.156.142.70:1521:xe";
				String user = "hr";
				String password = "hr";
					
				// 2. �����ͺ��̽� ���ᰴü(Connection)����
			    conn = DriverManager.getConnection(url, user, password);
		}catch(Exception e) {
			e.printStackTrace();
			
		}
	}

	//�ݱ�
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
		
		// ��Ÿ�ӿ��� : �������� �� �߻��ϴ� ���� > ����ó��
		try{
			conn();
			
		    String sql = "select * from calendar where calendar_userid = ?";
		                                             // ? : ���ε� ����
		    // 3. sql�� ���ఴü ( PreparedStatement ) ����
		    pst = conn.prepareStatement(sql);
		    pst.setString(1, userId);
			
		    // 4. ���ε� ���� ä���ֱ�
		    
		    // 5. sql�� �����ϱ�
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
		    	
		    	System.out.println("��ձ�");
		    }
		    
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("������");
		}finally {
			// ���������� �ݾ��� �� �����Ƿ� ���ܹ� �ѹ���
			close();
			
		}
		return al;
	}
	
	
	public int add(calendarDTO dto) {
		// ��Ÿ�ӿ��� : �������� �� �߻��ϴ� ���� > ����ó��
		try{
			
			conn();
			
		    String sql = "insert into calendar values ('���̵�', ?, ?, ?, ?, ?, ?, ?, '�ؽ�Ʈ�÷�')";
		                                             // ? : ���ε� ����
		    // 3. sql�� ���ఴü ( PreparedStatement ) ����
		    pst = conn.prepareStatement(sql);
			
		    // 4. ���ε� ���� ä���ֱ�
		    pst.setString(1, dto.getCal_title());
		    pst.setString(2, dto.getCal_start());
		    pst.setString(3, dto.getCal_end());
		    pst.setString(4, dto.getCal_description());
		    pst.setString(5, dto.getCal_type());
		    pst.setString(6, dto.getCal_user());
		    pst.setString(7, dto.getCal_color());
		    
		    // 5. sql�� �����ϱ�
		    cnt = pst.executeUpdate();
		    
		  
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("FAIL");
		}finally {
			// ���������� �ݾ��� �� �����Ƿ� ���ܹ� �ѹ���
			close();
			
		}
		return cnt;
	
	}
	
	// �̸��� ��� ���ֱ� 
public ArrayList<calendarDTO> calendar_select(String user) {
		// ��Ÿ�ӿ��� : �������� �� �߻��ϴ� ���� > ����ó��
		try{
			conn();
			
		    String sql = "select * from calendar where calendar_userid =?" ;
		                                             // ? : ���ε� ����
		    // 3. sql�� ���ఴü ( PreparedStatement ) ����
		    pst = conn.prepareStatement(sql);
		    
		    pst.setString(1, user);
			
		    // 4. ���ε� ���� ä���ֱ�
		    
		    // 5. sql�� �����ϱ�
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
		    System.out.println("������ ����");
		    
			
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("fail..");
		}finally {
			// ���������� �ݾ��� �� �����Ƿ� ���ܹ� �ѹ���
			close();
			
		}
		return al;
	}
	
	
}
