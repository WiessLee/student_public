<%@page import="lr.bean.User"%>
<%@ page language="java" contentType="text/html;charset=gbk"%>
<%request.setCharacterEncoding("gbk");%>
<jsp:useBean id="student" scope="page" class="lr.bean.Student"></jsp:useBean>
<jsp:useBean id="um" scope="application" class="lr.bean.UserManager"></jsp:useBean>
<%
String Cnum=request.getParameter("Cnum");
String table=request.getParameter("table");
User u=(User)request.getSession().getAttribute("user");
String Stunum=u.getNum();
out.print("<table border=1 align=center bordercolor=#317D5F>");
out.print("<tr align=center><th colspan=6>��"+um.CourseSelect(Cnum).getCname()+"���ɼ�</th></tr>");
out.println("<tr>");
out.println("<th width=50 align=center>���</th><th width=100 align=center>����</th><th width=100 align=center>�ɼ�һ</th><th width=100 align=center>�ɼ���</th><th width=100 align=center>�ɼ���</th><th width=100 align=center>��ע</th>");
out.println("</tr>");
student=um.GradeSelect(table, Stunum);
out.println("<tr>");
out.println("<td align=center>"+student.getStunum()+"</td>");
out.println("<td align=center>"+student.getName()+"</td>");
out.println("<td align=center>"+student.getCore1()+"</td>");
out.println("<td align=center>"+student.getCore2()+"</td>");
out.println("<td align=center>"+student.getCore3()+"</td>");
out.println("<td align=center>"+student.getRemarks()+"</td>");
out.println("</tr>");
out.println("</table>");
%>