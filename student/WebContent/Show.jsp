<%@ page language="java" contentType="text/html;charset=gbk"%>
<%request.setCharacterEncoding("gbk");%>
<jsp:useBean id="student" scope="page" class="lr.bean.Student"></jsp:useBean>
<jsp:useBean id="um" scope="application" class="lr.bean.UserManager"></jsp:useBean>
<%
String Mnum_cnum=request.getParameter("Mnum_cnum");
java.util.List result=um.ShowGrade(Mnum_cnum);
java.util.Iterator it=result.iterator();
out.print("<table border=1 align=center bordercolor=#ccccff>");
out.print("<tr bdcolor=#317D5F><th colspan=4>"+Mnum_cnum+"_core��&nbsp;״̬��");
if(um.Cure_stateSelect(Mnum_cnum)==0){
	out.print("����</th>");
	out.print("<th colspan=2><a href='AdminServlet?key=jie&Mnum_cnum="+Mnum_cnum+"'>����</a></th>");
}else{
	out.print("δ����</th>");
	out.print("<th colspan=2><a href='AdminServlet?key=suo&Mnum_cnum="+Mnum_cnum+"'>����</a></th>");
}
out.println("<tr>");
out.println("<th width=50 align=center>ѧ�����</th><th width=100 align=center>����</th><th width=100 align=center>�ɼ�һ</th><th width=100 align=center>�ɼ���</th><th width=100 align=center>�ɼ���</th><th width=100 align=center>��ע</th>");
out.println("</tr>");
while(it.hasNext()){
student=(lr.bean.Student)it.next();
out.println("<tr>");
out.println("<td align=center>"+student.getStunum()+"</td>");
out.println("<td align=center>"+student.getName()+"</td>");
out.println("<td align=center>"+student.getCore1()+"</td>");
out.println("<td align=center>"+student.getCore2()+"</td>");
out.println("<td align=center>"+student.getCore3()+"</td>");
out.println("<td align=center>"+student.getRemarks()+"</td>");
out.println("</tr>");
}
out.println("</table>");
%>