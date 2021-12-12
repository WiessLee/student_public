<%@page import="lr.bean.User"%>
<%@ page language="java" contentType="text/html;charset=gbk"%>
<%request.setCharacterEncoding("gbk");%>
<jsp:useBean id="tcm" scope="page" class="lr.bean.Tea_cou_maj"></jsp:useBean>
<jsp:useBean id="um" scope="application" class="lr.bean.UserManager"></jsp:useBean>
<% 
User u=(User)request.getSession().getAttribute("user");
String Stunum=u.getNum();
String Mnum=Stunum.substring(0,7);
java.util.List result=um.MajorSelectTcm(Mnum);
java.util.Iterator it=result.iterator();
%>
<table width="500" border="1" align="center" bordercolor="#317D5F">
<tr bgcolor="#317D5F"><th colspan=5 height="37">课程表</th></tr>
<% 
out.println("<tr>");
out.println("<th width=100 align=center>课程</th><th width=100 align=center>教师</th><th width=100 align=center>查看成绩</th>");
out.println("</tr>");
while(it.hasNext()){
tcm=(lr.bean.Tea_cou_maj)it.next();
out.println("<tr>");
String Cnum=tcm.getCnum();
out.println("<td align=center>"+um.CourseSelect(tcm.getCnum()).getCname()+"</td>");
out.println("<td align=center>"+um.TeacherSelect(tcm.getTnum()).getName()+"</td>");
String Mnum_cnum=Mnum+"_"+tcm.getCnum();
int x=um.Cure_stateSelect(Mnum_cnum);
if(x==0){
out.println("<td align=center><a href='StuServlet?key=show&Mnum_cnum="+Mnum_cnum+"&Cnum="+Cnum+"'><img src='images/button_select.png' width='14' height='13' border='0'></a>");
}else{
out.println("<td align=center>暂无成绩</td>");
}
out.println("</tr>");
}
%>
</table>