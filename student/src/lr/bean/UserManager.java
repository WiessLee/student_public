package lr.bean;

import java.sql.*;
import java.util.ArrayList;
import java.util.Iterator;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;

public class UserManager {
	private String driver="com.mysql.jdbc.Driver";
	private String url="jdbc:mysql://192.168.111.128:3306/student";
	private String user="root";
	private String password="root";
	public UserManager(){}
	
	public int GradeUpdate(String table,String Stunum,int Core1,int Core2,int Core3,String Remarks){
		int result=0;
		if(GradeSelect(table, Stunum).getStunum()!=""){
			try{
				Class.forName(driver);
				Connection conn=DriverManager.getConnection(url,user,password);
				String sql="update "+table+" set Core1=?,Core2=?,Core3=?,Remarks=? where Stunum=?";
				PreparedStatement ps=conn.prepareStatement(sql);
				ps.setInt(1, Core1);
				ps.setInt(2, Core2);
				ps.setInt(3, Core3);
				ps.setString(4, Remarks);
				ps.setString(5, Stunum);
				result=ps.executeUpdate();
				conn.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	public Student GradeSelect(String table,String Stunum){
		Student stu=new Student();
		try{
			Class.forName(driver);
			Connection conn=DriverManager.getConnection(url,user,password);
			String sql="select * from "+table+" where Stunum=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, Stunum);
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
				stu.setName(rs.getString("name"));
				stu.setStunum(rs.getString("Stunum"));
				stu.setCore1(rs.getInt("Core1"));
				stu.setCore2(rs.getInt("Core2"));
				stu.setCore3(rs.getInt("Core3"));
				stu.setRemarks(rs.getString("Remarks"));
			}
			rs.close();
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return stu;
	}
	
	public ArrayList<Student> ShowGrade(String Mnum_cnum){
		ArrayList<Student> lis=new ArrayList<Student>();
		try{
			Class.forName(driver);
			Connection conn=DriverManager.getConnection(url,user,password);
			Statement stat=conn.createStatement();
			String table=Mnum_cnum+"_core";
			String sql="select * from "+table;
			ResultSet rs=stat.executeQuery(sql);
			while(rs.next()){
				Student stu=new Student();
				stu.setName(rs.getString("name"));
				stu.setStunum(rs.getString("Stunum"));
				stu.setCore1(rs.getInt("Core1"));
				stu.setCore2(rs.getInt("Core2"));
				stu.setCore3(rs.getInt("Core3"));
				stu.setRemarks(rs.getString("Remarks"));
				lis.add(stu);
			}
			rs.close();
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return lis;
	}
	
	public int Cure_stateSelect(String Mnum_cnum){
		int result=2;
		String sql="select * from core_state where Mnum_cnum=?";
		try{
			Class.forName(driver);
			Connection conn=DriverManager.getConnection(url,user,password);
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, Mnum_cnum);
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
				result=rs.getInt("state");
			}
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int Cure_stateLock(String Mnum_cnum,int state){
		int result=0;
		String sql="update core_state set state=? where Mnum_cnum=?";
		try{
			Class.forName(driver);
			Connection conn=DriverManager.getConnection(url,user,password);
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, state);
			ps.setString(2, Mnum_cnum);
			result=ps.executeUpdate();
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	public ArrayList<Student> StuSelect(String Mnum){
		ArrayList<Student> lis=new ArrayList<Student>();
		String sql="select * from student where Stunum like ?";
		try{
			Class.forName(driver);
			Connection conn=DriverManager.getConnection(url,user,password);
			PreparedStatement ps=conn.prepareStatement(sql);
			String str=Mnum+"___";
			ps.setString(1, str);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				Student stu=new Student();
				stu.setName(rs.getString("name"));
				stu.setStunum(rs.getString("Stunum"));
				lis.add(stu);
			}
			rs.close();
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return lis;
	}
	
	public ArrayList<Major> MajorList(){
		ArrayList<Major> lis=new ArrayList<Major>();
		String sql="select * from major";
		try{
			Class.forName(driver);
			Connection conn=DriverManager.getConnection(url,user,password);
			Statement stat=conn.createStatement();
			ResultSet rs=stat.executeQuery(sql);
			while(rs.next()){
				Major mj=new Major();
				mj.setMname(rs.getString("Mname"));
				mj.setMnum(rs.getString("Mnum"));
				lis.add(mj);
			}
			rs.close();
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return lis;
	}
	
	public int TcmDelete(String Cnum,String Mnum){
		int result=0;
		PreparedStatement ps=null;
		String sql="delete from tcm where Cnum=? and Mnum=?";
		try{
			Class.forName(driver);
			Connection conn=DriverManager.getConnection(url,user,password);
			Statement stmt=conn.createStatement();
			ps=conn.prepareStatement(sql);
			ps.setString(1, Cnum);
			ps.setString(2, Mnum);
			result=ps.executeUpdate();
			String table=Mnum+"_"+Cnum+"_core";
			String Mnum_Cnum=Mnum+"_"+Cnum;
			stmt.execute("DROP TABLE IF EXISTS `"+table+"`");
			stmt.execute("delete from core_state where Mnum_cnum='"+Mnum_Cnum+"'");
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int CerateGrade(){
		int result=0;
		ArrayList<Tea_cou_maj> lis=TcmList();
		Tea_cou_maj tcm=new Tea_cou_maj();
		try{
			Class.forName(driver);
			Connection conn=DriverManager.getConnection(url,user,password);
			Iterator<Tea_cou_maj> it=lis.iterator();
			while(it.hasNext()){
				tcm=(lr.bean.Tea_cou_maj)it.next();
				Statement stmt=conn.createStatement();
				String table=tcm.getMnum()+"_"+tcm.getCnum()+"_core";
				String Mnum_Cnum=tcm.getMnum()+"_"+tcm.getCnum();
				String sql="CREATE TABLE if not exists "+table+"(Stunum VARCHAR(11) PRIMARY KEY,name VARCHAR(20),Core1 INT(3),Core2 INT(3),Core3 INT(3),Remarks VARCHAR(10));";
				stmt.execute(sql);
				if(Cure_stateSelect(Mnum_Cnum)==2){
					stmt.execute("insert into core_state values('"+Mnum_Cnum+"','1')");
				}
				ArrayList<Student> lis1=StuSelect(tcm.getMnum());
				Student stu=new Student();
				Iterator<Student> it1=lis1.iterator();
				while(it1.hasNext()){
					stu=(lr.bean.Student)it1.next();
					String str=GradeSelect(table,stu.getStunum()).getStunum();
					if(str==null){
						String sql1="insert into "+table+"(Stunum,name) values('"+stu.getStunum()+"','"+stu.getName()+"')";
						stmt.execute(sql1);
						result++;
					}
				}
				result++;
			}
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public boolean TcmSelect(String Cnum,String Mnum){
		boolean result=false;
		String sql="select * from tcm where Cnum=? and Mnum=?";
		try{
			Class.forName(driver);
			Connection conn=DriverManager.getConnection(url,user,password);
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, Cnum);
			ps.setString(2, Mnum);
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
				result=true;
			}
			rs.close();
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public Teacher TeacherSelect(String Tnum){
		Teacher ter=new Teacher();
		String sql="select * from teacher where Tnum=?";
		try{
			Class.forName(driver);
			Connection conn=DriverManager.getConnection(url,user,password);
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, Tnum);
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
				ter.setTnum(rs.getString("Tnum"));
				ter.setName(rs.getString("name"));
			}
			rs.close();
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return ter;
	}
	
	public Major MajorSelect(String Mnum){
		Major mj=new Major();
		String sql="select * from major where Mnum=?";
		try{
			Class.forName(driver);
			Connection conn=DriverManager.getConnection(url,user,password);
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, Mnum);
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
				mj.setMnum(rs.getString("Mnum"));
				mj.setMname(rs.getString("Mname"));
			}
			rs.close();
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return mj;
	}
	
	public Course CourseSelect(String Cnum){
		Course cou=new Course();
		String sql="select * from course where Cnum=?";
		try{
			Class.forName(driver);
			Connection conn=DriverManager.getConnection(url,user,password);
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, Cnum);
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
				cou.setCnum(rs.getString("Cnum"));
				cou.setCname(rs.getString("Cname"));
			}
			rs.close();
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return cou;
	}
	
	public int TcmAdd(String Tnum,String Cnum,String Mnum){
		int result=0;
		if(!TcmSelect(Cnum, Mnum)){
			PreparedStatement ps=null;
			String sql="insert into tcm values(?,?,?)";
			try{
				Class.forName(driver);
				Connection conn=DriverManager.getConnection(url,user,password);
				ps=conn.prepareStatement(sql);
				ps.setString(1, Tnum);
				ps.setString(2, Cnum);
				ps.setString(3, Mnum);
				result=ps.executeUpdate();
				conn.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	public ArrayList<Tea_cou_maj> TcmList(){
		ArrayList<Tea_cou_maj> lis=new ArrayList<Tea_cou_maj>();
		String sql="select * from tcm";
		try{
			Class.forName(driver);
			Connection conn=DriverManager.getConnection(url,user,password);
			Statement stat=conn.createStatement();
			ResultSet rs=stat.executeQuery(sql);
			while(rs.next()){
				Tea_cou_maj tcm=new Tea_cou_maj();
				tcm.setTnum(rs.getString("Tnum"));
				tcm.setMnum(rs.getString("Mnum"));
				tcm.setCnum(rs.getString("Cnum"));
				lis.add(tcm);
			}
			rs.close();
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return lis;
	}
	
	public ArrayList<Tea_cou_maj> TcmSelect(String Tnum){
		ArrayList<Tea_cou_maj> lis=new ArrayList<Tea_cou_maj>();
		String sql="select * from tcm where Tnum=?";
		try{
			Class.forName(driver);
			Connection conn=DriverManager.getConnection(url,user,password);
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, Tnum);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				Tea_cou_maj tcm=new Tea_cou_maj();
				tcm.setMnum(rs.getString("Mnum"));
				tcm.setCnum(rs.getString("Cnum"));
				lis.add(tcm);
			}
			rs.close();
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return lis;
	}
	
	public ArrayList<Tea_cou_maj> MajorSelectTcm(String Mnum){
		ArrayList<Tea_cou_maj> lis=new ArrayList<Tea_cou_maj>();
		String sql="select * from tcm where Mnum=?";
		try{
			Class.forName(driver);
			Connection conn=DriverManager.getConnection(url,user,password);
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, Mnum);
			ResultSet rs=ps.executeQuery();
			while(rs.next()){
				Tea_cou_maj tcm=new Tea_cou_maj();
				tcm.setTnum(rs.getString("Tnum"));
				tcm.setMnum(rs.getString("Mnum"));
				tcm.setCnum(rs.getString("Cnum"));
				lis.add(tcm);
			}
			rs.close();
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return lis;
	}
	
	public ArrayList<Course> CourseList(){
		ArrayList<Course> lis=new ArrayList<Course>();
		String sql="select * from course";
		try{
			Class.forName(driver);
			Connection conn=DriverManager.getConnection(url,user,password);
			Statement stat=conn.createStatement();
			ResultSet rs=stat.executeQuery(sql);
			while(rs.next()){
				Course cou=new Course();
				cou.setCname(rs.getString("Cname"));
				cou.setCnum(rs.getString("Cnum"));
				lis.add(cou);
			}
			rs.close();
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return lis;
	}
	
	public ArrayList<Teacher> TercerList(){
		ArrayList<Teacher> lis=new ArrayList<Teacher>();
		String sql="select * from teacher";
		try{
			Class.forName(driver);
			Connection conn=DriverManager.getConnection(url,user,password);
			Statement stat=conn.createStatement();
			ResultSet rs=stat.executeQuery(sql);
			while(rs.next()){
				Teacher ter=new Teacher();
				ter.setName(rs.getString("name"));
				ter.setTnum(rs.getString("Tnum"));
				ter.setRemarks(rs.getString("Remarks"));
				lis.add(ter);
			}
			rs.close();
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return lis;
	}
	
	public int PassUpdate(String num,String pass,String newpass,String id){
		int result=0;
		if(login(num, pass, id).getId()!=0){
			String sql="";
			if(id.equals("stu")){
				sql="update student set pwd=? where Stunum=?";
			}
			if(id.equals("tea")){
				sql="update teacher set pwd=? where Tnum=?";
			}
			try{
				Class.forName(driver);
				Connection conn=DriverManager.getConnection(url,user,password);
				PreparedStatement ps=conn.prepareStatement(sql);
				ps.setString(1, newpass);
				ps.setString(2, num);
				result=ps.executeUpdate();
				conn.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		return result;
	}
	
	public User login(String num,String pass,String id){
		User u=new User();
		String sql="";
		int x=0;
		if(id.equals("stu")){
			sql="select * from student where Stunum=? and pwd=?";
			x=1;
		}
		if(id.equals("tea")){
			sql="select * from teacher where Tnum=? and pwd=?";
			x=2;
		}
		if(id.equals("adm")){
			sql="select * from admin where Anum=? and pwd=?";
			x=3;
		}
		try{
			Class.forName(driver);
			Connection conn=DriverManager.getConnection(url,user,password);
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, num);
			ps.setString(2, pass);
			ResultSet rs=ps.executeQuery();
			if(rs.next()){
				u.setId(x);
				u.setName(rs.getString("name"));
				if(x==1){
					u.setNum(rs.getString("Stunum"));
				}
				if(x==2){
					u.setNum(rs.getString("Tnum"));
				}
				if(x==3){
					u.setNum(rs.getString("Anum"));
				}
			}
			rs.close();
			ps.close();
			conn.close();
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return u;
	}
}
