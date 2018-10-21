package member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Iterator;

public class DataManager {

	// 서버접속정보를 저장한다.
	Connection con = null;
	String url = "jdbc:mysql://localhost:3306/my_site";
	String user = "jsp_user";
	String pass = "qwer1234";

	private Connection openConnection() { // 서버에 접속한다
		//
		try {
			Class.forName("org.mariadb.jdbc.Driver");// 드라이브 로드
			con = DriverManager.getConnection(url, user, pass);// 접속정보저장
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;

	}

	private void closeConnection() { // 서버 접속 종료
		try {
			if (con != null) {
				con.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			con = null;

		}
	}

	//// 회원정보 삽입
	public int insertMember(MemberInfo member) {
		PreparedStatement pstmt = null;
		String query = "INSERT INTO member VALUES(?,?,?,?,?,?)";
		int res = 0;
		openConnection(); // 서버접속
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPass());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getPhone());
			pstmt.setString(5, member.getEmail());
			Timestamp ts = new Timestamp(System.currentTimeMillis()); // 시스템에서 시간 불러오기
			pstmt.setTimestamp(6, ts);

			res = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection();// 서버접속 종료

		}
		return res;
	}

	//// 기존 회원정보 삭제
	public int removeMember(String id) {
		PreparedStatement pstmt = null;
		String query = "DELETE FROM member WHERE id?";
		int res = 0;
		openConnection();
		try {
			pstmt = con.prepareCall(query);
			pstmt.setString(1, id);

			res = pstmt.executeUpdate();
		} catch (Exception e) {

		} finally {
			closeConnection();

		}
		return res;
	}

	//// 기존 회원정보 수정
	public int updateMember(MemberInfo member) {
		PreparedStatement pstmt = null;
		String query = "UPDATE member SET pass=?, name=?, phone=?, email=? WHERE id=?";
		int res = 0;
		openConnection();
		try {
			pstmt = con.prepareStatement(query);
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, member.getPass());
			pstmt.setString(2, member.getName());
			pstmt.setString(3, member.getPhone());
			pstmt.setString(4, member.getEmail());
			pstmt.setString(5, member.getId());
			res = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection();
		}
		return res;
	}

	//// 회원가입 여부 확인
	public boolean isMember(String id, String pass) {
		PreparedStatement pstmt = null;
		String query = "SELECT *FROM member WHERE id =? and pass=?";
		boolean res = false;
		openConnection();
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			ResultSet rs = pstmt.executeQuery();
			res = rs.next();
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection();
		}
		return res;
	}

	//// 기존 회원정보 확인
	public MemberInfo getMember(String id) {
		PreparedStatement pstmt = null;
		MemberInfo member = new MemberInfo();
		String query = "SELECT * FROM member WHERE id=?";
		openConnection();
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			rs.next();

			member.setId(rs.getString("id"));
			member.setPass(rs.getString("pass"));
			member.setName(rs.getString("name"));
			member.setPhone(rs.getString("phone"));
			member.setEmail(rs.getString("email"));
			member.setReg_date(rs.getTimestamp("reg_date"));
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection();
		}
		return member;
	}

	//// 게시글 목록 불러오기
	public PostInfo getPost(int num) {
		PreparedStatement pstmt = null;
		PostInfo post = new PostInfo();

		String query = "SELECT * FROM board WHERE post_num=?";
		openConnection();
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			ResultSet rs = pstmt.executeQuery();
			rs.next();
			post.setPost_num(rs.getInt("post_num"));
			post.setTitle(rs.getString("title"));
			post.setId(rs.getString("id"));
			post.setText(rs.getString("text"));
			post.setCreated_date(rs.getTimestamp("created_date"));
			rs.close();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection();
		}

		return post;
	}

	// 게시글 전체의 갯수 구하기
	public int getPostlen() {
		int num = 0;
		PreparedStatement pstmt = null;
		//PostInfo post = new PostInfo();

		String query = "SELECT * FROM board";
		openConnection();
		try {
			pstmt = con.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			rs.last();
			num = rs.getRow();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection();
		}

		return num;

	}

	////새글쓰기 
	public int insertPost(PostInfo post) {
		PreparedStatement pstmt = null;
		//String query = "INSERT INTO board VALUES(\"id\",\"제목\",\"내용\",null,null,null) ";
		String query = "INSERT INTO board VALUES(?,?,?,now(),null,null) ";
		int res = 0;
		openConnection();
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, post.getId());
			pstmt.setString(2, post.getTitle());
			pstmt.setString(3, post.getText());
			
			res = pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeConnection();
		}
		return res;
	}
	
	
	////수정하기
	public int updatePost(PostInfo post) {
		PreparedStatement pstmt = null;
		
		String query = "UPDATE board SET title=?, text=? WHERE post_num=?";
		int res = 0;
		openConnection();
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, post.getTitle());
			pstmt.setString(2, post.getText());
			pstmt.setInt(3, post.getPost_num());
			res = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeConnection();
		}
		return res;
	}
	
	
	////글 삭제하기
	public int removePost(int num) {
		PreparedStatement pstmt = null;
		String query = "DELETE FROM board WHERE post_num=?";
		int res = 0;
		openConnection();
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);

			res = pstmt.executeUpdate();
		} catch (Exception e) {

		} finally {
			closeConnection();

		}
		return res;
	}
	
	
}
