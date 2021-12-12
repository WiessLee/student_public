<%@ page language="java" contentType="text/html;charset=gbk"%>
<%request.setCharacterEncoding("gbk");%>
<jsp:useBean id="course" scope="page" class="lr.bean.Course"></jsp:useBean>
<jsp:useBean id="um" scope="application" class="lr.bean.UserManager"></jsp:useBean>
<% 
java.util.List result=um.CourseList();
java.util.Iterator it=result.iterator();
%>
<body background="images/left_bg.gif">
<br/>
<div align="center">
<table width="440" border="1" align="center" bordercolor="#317D5F">
<tr bgcolor="#317D5F"><th colspan=2 height="37">课程信息</th></tr>
<%
out.println("<tr>");
out.println("<th width=100 align=center>课程编号</th><th width=100 align=center>课程名</th>");
out.println("</tr>");
while(it.hasNext()){
course=(lr.bean.Course)it.next();
out.println("<tr>");
out.println("<td align=center>"+course.getCnum()+"</td>");
out.println("<td align=center>"+course.getCname()+"</td>");
out.println("</tr>");
}
%>
</table>
</div>

</body>