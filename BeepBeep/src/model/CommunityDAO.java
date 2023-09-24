package model;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Request;

public class CommunityDAO {
	
	ResultSet rs = null;
	Connection conn = null;
	PreparedStatement pst = null;
	ArrayList<CommunityDTO> al = new ArrayList<CommunityDTO>();
	ArrayList<CommentDTO> al2 = new ArrayList<CommentDTO>();
	CommunityDTO commudto = null;
	memberDTO dto =null;
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

			
			//커뮤니티 글작성
			public int CommuWrite(CommunityDTO commudto) {

				// 런타임오류 : 실행했을 때 발생하는 오류 -> 예외처리
				try {
					conn();
					
					String sql = "insert into community values(community_num.nextval, ?,?,?,?, sysdate )";
					// 3. sql문 실행객체(Prepared Statement)생성
					pst = conn.prepareStatement(sql);
					
					
					// 4. 바인드 변수 채우기
					pst.setString(1, commudto.getTitle());
					pst.setString(2, commudto.getId());
					pst.setString(3, commudto.getFilename());
					pst.setString(4, commudto.getContent());
					
					System.out.println(commudto.getTitle());
					System.out.println(commudto.getId());
					System.out.println(commudto.getFilename());
					System.out.println(commudto.getContent());
					
					// 5. sql문 실행하여 결과처리
					cnt = pst.executeUpdate();

				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("커뮤니티 작성 오류ㅠ");
				} finally {
					close();
				}
				return cnt;
			}
			
			
			
			// 언제쓸까아아아?
			public ArrayList<CommunityDTO> select() {
				try {
					conn();
					
					String sql = "select * from Community order by num";
					
					pst = conn.prepareStatement(sql);
					
					rs = pst.executeQuery();
					
					while(rs.next()){
						int num = rs.getInt("num");
						String title = rs.getString("title");
						String id = rs.getString("id");
						String filename = rs.getString("filename");
						String content = rs.getString("content");
						String day = rs.getString("day");
						
						CommunityDTO dto = new CommunityDTO(num, title, id, filename, content, day);
						
						al.add(dto);
						
					}		
				}catch(Exception e){
					e.printStackTrace();
				}finally {
					close();
				}
				return al;
			}	

			
			
			public CommunityDTO oneSelect(int num) {

				try {
					conn();

					String sql = "select * from community where num=?";

					pst = conn.prepareStatement(sql);

					pst.setInt(1, num);

					rs = pst.executeQuery();

					if (rs.next()) {
						int get_num = rs.getInt("num");
						String title = rs.getString("title");
						String id = rs.getString("id");
						String fileName = rs.getString("fileName");
						String content = rs.getString("content");
						String day = rs.getString("day");
						
						commudto = new CommunityDTO(get_num, title, id, fileName, content, day);
						
						System.out.println("커뮤니티 글 불러오기 성공");
					} else {
						System.out.println("커뮤니티 글 불러오기 실패");
					}

				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					close();
				}
				return commudto;
			}
			
			
			//댓글 select
			public ArrayList<CommentDTO> comment_select(int num) {
				try {
					conn();
					
					String sql = "select * from comment_board where community_num = ? order by comment_date";
					
					pst = conn.prepareStatement(sql);
					pst.setInt(1, num);
					rs = pst.executeQuery();
					
					while(rs.next()){
						int community_num = rs.getInt("community_num");
						int comment_num = rs.getInt("comment_num");
						String comment_id = rs.getString("comment_id");
						String comment_content = rs.getString("comment_content");
						String comment_date = rs.getString("comment_date");
						
						CommentDTO dto = new CommentDTO(community_num, comment_num, comment_id, comment_content, comment_date);
						
						al2.add(dto);
						
					}		
				}catch(Exception e){
					e.printStackTrace();
				}finally {
					close();
				}
				return al2;
			}	
			
			
			
			//댓글입력
			public int CommentWrite(CommentDTO commentdto) {

				// 런타임오류 : 실행했을 때 발생하는 오류 -> 예외처리
				try {
					conn();
					
					String sql = "insert into comment_board values(?, comment_num.nextval, ?, ?, sysdate )";
					// 3. sql문 실행객체(Prepared Statement)생성
					pst = conn.prepareStatement(sql);
					
					
					// 4. 바인드 변수 채우기
					pst.setInt(1, commentdto.getCommunity_num());
					pst.setString(2, commentdto.getComment_id());
					pst.setString(3, commentdto.getComment_content());
					
					
					// 5. sql문 실행하여 결과처리
					cnt = pst.executeUpdate();

					
				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("댓글작성오류");
				} finally {
					close();
				}
				return cnt;
			}
			
			
			
			public int updateProfile(int num, String fileName) {
				try {
					conn();
					
					String sql = "update community set filename = ? where num = ?";
					pst = conn.prepareStatement(sql);
					pst.setString(1, fileName);
					pst.setInt(2, num);
					cnt = pst.executeUpdate();
				} catch (Exception e) {
					e.printStackTrace();
				}finally {
					close();
				}
				
				return cnt;
			}
			
			
			
			public void copyFilename(String beforePath, String afterPath) {
				
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
			
			public int delCommunity(int boardNum) {
				try {
					conn();
					
					String sql = "delete from community where num = ?";
					pst = conn.prepareStatement(sql);
					pst.setInt(1, boardNum);
					
					cnt = pst.executeUpdate();
				} catch (Exception e) {
					e.printStackTrace();
				} finally {
					close();
				}
				
				
				return cnt;
			}
			public int deleteComment(int comment_num) {
				try {
					conn();
					
					String sql = "delete from comment_board where comment_num = ?";
					// 3. sql문 실행객체(Prepared Statement)생성
					pst = conn.prepareStatement(sql);
					
					
					// 4. 바인드 변수 채우기
					pst.setInt(1, comment_num);

					// 5. sql문 실행하여 결과처리
					cnt = pst.executeUpdate();

				} catch (Exception e) {
					e.printStackTrace();
					System.out.println("댓글삭제안됨");
				} finally {
					close();
				}
				return cnt;
			
			}
			
			
}
