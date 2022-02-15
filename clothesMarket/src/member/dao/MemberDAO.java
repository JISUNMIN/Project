package member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.mysql.cj.x.protobuf.MysqlxDatatypes.Scalar.String;

import member.dto.MemberVO;
import work.crypt.BCrypt;
import work.crypt.SHA256;



public class MemberDAO {
	private static MemberDAO instance=null;
	public static MemberDAO getInstance() {
		if(instance==null){
			instance=new MemberDAO();
		}
		return instance;
	}
	private MemberDAO() { }

	//데이터베이스를 조작하는 메소드
	//conection pool에서 connection을가져오는 메소드를 정의
	public Connection getConnection()throws Exception {
		Connection conn=null;
		Context initContext=new InitialContext();
		Context envContext=(Context)initContext.lookup("java:/comp/env");
		DataSource ds=(DataSource)envContext.lookup("jdbc/clothesshop");
		conn=ds.getConnection();
		return conn;
	}
	//-1:없는아이디 0:잘돗묀 패스워드 1:로그인성공
	public int userCheck(String userid,String pwd) {
		int result=-1; //실패
		String sql="select pwd from member where userid=?";
		ResultSet rs=null;
		SHA256 sha=SHA256.getInsatnce();

		try(Connection conn=getConnection();
			PreparedStatement pstmt=conn.prepareStatement(sql);){
			pstmt.setString(1, userid);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				String orgPass=pwd;
				String shaPass=sha.getSha256(orgPass.getBytes());
				String dbpasswd=rs.getString("pwd");

				if(dbpasswd!=null&&BCrypt.checkpw(shaPass, dbpasswd)) {
					result=1;
				}else {
					result=0;
				}
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(rs!=null) {
				try {
					rs.close();
				}catch(Exception e) {

					}
				}
			}return result;
		}
	// 회원정보 변경을 위해 회원정보를 가져오는 메소드
	public MemberVO getMember(String userid) {
		MemberVO mVo = null;
		String sql = "select * from member where userid = ?";
		ResultSet rs = null;
		try (Connection conn = getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);) {
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			if(rs.next()) {	// 회원정보가 존재하면
				mVo = new MemberVO();
				mVo.setName(rs.getString("name"));
				mVo.setUserid(rs.getString("userid"));
				mVo.setPwd(rs.getString("pwd"));
				mVo.setEmail(rs.getString("email"));
				mVo.setAddress(rs.getString("address"));
				mVo.setPhone(rs.getString("phone"));
				mVo.setBirth(rs.getString("birth"));
				mVo.setGrade(rs.getInt("grade"));
			}

		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) {
				try {
					rs.close();
				} catch(Exception e) { }
			}
		}
		return mVo;
	}
	// 아이디 중복체크를 위한 메소드
		public int confirmID(String userid) {
			int result = -1;	// 없는 사용자
			String sql = "select userid from member where userid = ?";
			ResultSet rs = null;
			try (Connection conn = getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);) {
				pstmt.setString(1, userid);
				rs = pstmt.executeQuery();
				if(rs.next()) {	// 있는 사용자
					result = 1;	// 약속을 정하기 나름
				}
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				if(rs != null) {
					try {
						rs.close();
					} catch(Exception e) { }
				}
			}
			return result;
		}

//회원정보를 추가하는 메소드

	public int insertMember(MemberVO mVo) {
		int result = -1;// 없는 사용자
		String sql = "insert into member values(?, ?, ?, ?, ?, ?,?,?)";
		SHA256 sha = SHA256.getInsatnce();
		try (Connection conn = getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql); ) {
			pstmt.setString(1, mVo.getName());
			pstmt.setString(2, mVo.getUserid());
			String orgPass = mVo.getPwd();
         String shaPass = sha.getSha256(orgPass.getBytes());
     	String bcPass = BCrypt.hashpw(shaPass, BCrypt.gensalt());
			pstmt.setString(3, bcPass); //암호화된 비밀번호를 DB에저장
			pstmt.setString(4, mVo.getEmail());
			pstmt.setString(5,mVo.getAddress());
			pstmt.setString(6, mVo.getPhone());
			pstmt.setString(7,mVo.getBirth());
			pstmt.setInt(8, mVo.getGrade());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	//pwd,email,address,phone,birth
	//암호화된 아이디는 어떻게 변경하는가?
	public int updateMember(MemberVO mVo) {
		int result=-1;
		String sql="update member set pwd=?,email=?,address=?,phone=?,birth=? where userid=?";
		SHA256 sha=SHA256.getInsatnce();

		try(Connection conn=getConnection();
				PreparedStatement pstmt=conn.prepareStatement(sql);){

			String orgPass=mVo.getPwd();
			String shaPass=sha.getSha256(orgPass.getBytes());
			String bcpass=BCrypt.hashpw(shaPass, BCrypt.gensalt());
			pstmt.setString(1, bcpass);
			pstmt.setString(2, mVo.getEmail());
			pstmt.setString(3, mVo.getAddress());
			pstmt.setString(4, mVo.getPhone());
			pstmt.setString(5, mVo.getBirth());
			pstmt.setString(6, mVo.getUserid());
			result=pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
