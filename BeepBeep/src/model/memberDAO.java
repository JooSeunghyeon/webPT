package model;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class memberDAO {
	
	ResultSet rs = null;
	Connection conn = null;
	PreparedStatement pst = null;
	int cnt=0;
	memberDTO dto =null;
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
		
		public void close() {
			
			try {
				if(rs !=null) {rs.close();}
				pst.close();
				conn.close();
				
				}catch(Exception e) {
					e.printStackTrace();
				}
		}

		
		
		
		public memberDTO login(String id, String pw) {
			try{
				conn();
			    String sql = "select * from member where id = ? and pw = ?";
			    pst = conn.prepareStatement(sql);
			    pst.setString(1, id);  
			    pst.setString(2, pw);
			    rs = pst.executeQuery();
			    if ( rs.next() ) {
			    	String category = rs.getString("category");
			    	String get_id = rs.getString("id");
			    	String get_pw = rs.getString("pw");
			    	String name = rs.getString("name");
			    	int age = rs.getInt("age");
			    	String gender = rs.getString("gender");
			    	String target = rs.getString("target");
			    	String tel = rs.getString("tel");
			    	float height = rs.getFloat("height");
			    	float weight = rs.getFloat("weight");
			    	String profile = rs.getString("profile");
			    	
			    	//1.���� �� ������ ���� ���� ���� �ִٸ� rs.getString(���̸�)
			    	dto = new memberDTO(category, get_id, get_pw, name, age, gender, target, tel, height, weight, profile);
			    	
			    	System.out.println("�α��� ����");
			    }
			}catch(Exception e) {
				e.printStackTrace();
				System.out.println("�α��� ����");
			}finally {
				// ���������� �ݾ��� �� �����Ƿ� ���ܹ� �ѹ���
				close();
			}
			return dto;
		}

		
		// ȸ������
		public int join(String id, String pw, String name, int age, int gender, String target, String tel, float height, float weight) {

			// ��Ÿ�ӿ��� : �������� �� �߻��ϴ� ���� -> ����ó��
			try {
				conn();
				
				String sql = "insert into member values('b',?,?,?,?,?,?,?,?,?)";
				// 3. sql�� ���ఴü(Prepared Statement)����
				pst = conn.prepareStatement(sql);

				// 4. ���ε� ���� ä���
				pst.setString(1, id);
				pst.setString(2, pw);
				pst.setString(3, name);
				pst.setInt(4, age);
				pst.setInt(5, gender);
				pst.setString(6, target);
				pst.setString(7, tel);
				pst.setFloat(8, height);
				pst.setFloat(9, weight);

				// 5. sql�� �����Ͽ� ���ó��
				cnt = pst.executeUpdate();

			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("memberDAO ����");
			} finally {
				close();
			}
			return cnt;
		}
		
		public int update(String id, String pw, float weight, float height, String target) {
			try {
				conn();
				
				String sql = "update member set pw = ?, weight = ?, height = ?, target = ? where id = ?";
				pst = conn.prepareStatement(sql);
				pst.setString(1, pw);
				pst.setFloat(2, height);
				pst.setFloat(3, weight);
				pst.setString(4, target);
				pst.setString(5, id);
				
				cnt = pst.executeUpdate();
			} catch (Exception e) {
				System.out.println("�������� ����");
				e.printStackTrace();
			} finally {
				close();
			}
			
			
			return cnt;
		}
		
		public int updateProfile(String id, String fileName) {
			try {
				conn();
				
				String sql = "update member set profile = ? where id = ?";
				pst = conn.prepareStatement(sql);
				pst.setString(1, fileName);
				pst.setString(2, id);
				cnt = pst.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}
			
			return cnt;
		}
		
		public void copyProfile(String beforePath, String afterPath) {
			
			File oriFile = new File(beforePath);
			File copyfile = new File(afterPath);
			
			try {
				FileInputStream fis = new FileInputStream(oriFile);
				FileOutputStream fos = new FileOutputStream(copyfile);
				
				int fileByte = 0;
				while((fileByte = fis.read()) != -1) {
					fos.write(fileByte);
				}
				fis.close();
				fos.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		
		
		}
		
		
		
		
		
		
		
		
		


