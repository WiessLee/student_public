<%@ page language="java" contentType="text/html;charset=gbk"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  	<jsp:useBean id="course" scope="page" class="lr.bean.Course"></jsp:useBean>
	<jsp:useBean id="teacher" scope="page" class="lr.bean.Teacher"></jsp:useBean>
	<jsp:useBean id="major" scope="page" class="lr.bean.Major"></jsp:useBean>
	<jsp:useBean id="um" scope="application" class="lr.bean.UserManager"></jsp:useBean>
	<title>管理员主页</title>
  </head>
  <body background="images/left_bg.gif">
  <center>
	<br/>
	<div align="center">
	<form action="AdminServlet" method="post">
	<table width="440" border="1" align="center" cellpadding="0" cellpadding="0" bordercolor="#317D5F">
	<tr bgcolor="#317D5F">
	<th height="37" colspan="2">
	<div align="center">教务管理</div>
	</th>
	</tr>
	<%
		java.util.List resultT=um.TercerList();
		java.util.Iterator itT=resultT.iterator();
		java.util.List resultM=um.MajorList();
		java.util.Iterator itM=resultM.iterator();
		java.util.List resultC=um.CourseList();
		java.util.Iterator itC=resultC.iterator();
	%>
	<tr>
	<td height="31" align="center">专业:</td>
	<td align="center">
		<select name="Mnum">
			<%
			while(itM.hasNext()){
				major=(lr.bean.Major)itM.next();
				out.println("<option value='"+major.getMnum()+"'>"+major.getMname()+"</option>");
			}
			 %>
		</select>
	</td>
	</tr>
	
	<tr>
	<td height="31" align="center">课程:</td>
	<td align="center">
		<select name="Cnum">
			<%
			while(itC.hasNext()){
				course=(lr.bean.Course)itC.next();
				out.println("<option value='"+course.getCnum()+"'>"+course.getCname()+"</option>");
			}
			 %>
		</select>
	</td>
	</tr>
	
	<tr>
	<td width="220" height="31" align="center">教师:</td>
	<td width="220" align="center">
		<select name="Tnum">
			<%
				while(itT.hasNext()){
					teacher=(lr.bean.Teacher)itT.next();
					out.println("<option value='"+teacher.getTnum()+"'>"+teacher.getTnum()+teacher.getName()+"</option>");
				}
			%>
		</select>
	</td>
	</tr>
	
	<tr>
	<td height="47" colspan="2">
	<div align="center">
	<input type="hidden" value="tcmadd" name="key">
	<input type="submit" name="submit" value="添加"/>
	<input type="reset" name="reset" value="重置"/>
	</div>
	</td>
	</tr>
	</table>
	</form>
	</div>
	<iframe src="ShowTcm.jsp" frameborder="0" width="600" height="200"></iframe>
	<form action="AdminServlet" method="post">
	<input type="hidden" value="create" name="key">
	<input type="submit" name="submit" value="生成成绩表！"/>
	</form>
	</center>
  </body>
</html>
