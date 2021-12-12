<%@page import="lr.bean.User"%>
<%@ page language="java" contentType="text/html;charset=gbk"%>
<%request.setCharacterEncoding("gbk");%>
<jsp:useBean id="tcm" scope="page" class="lr.bean.Tea_cou_maj"></jsp:useBean>
<jsp:useBean id="um" scope="application" class="lr.bean.UserManager"></jsp:useBean>
<% 
User u=(User)request.getSession().getAttribute("user");
String Tnum=u.getNum();
java.util.List result=um.TcmSelect(Tnum);
java.util.Iterator it=result.iterator();
%>
<table width="500" border="1" align="center" bordercolor="#317D5F">
<tr bgcolor="#317D5F"><th colspan=5 height="37">课程安排</th></tr>
<% 
out.println("<tr>");
out.println("<th width=100 align=center>专业</th><th width=100 align=center>课程</th><th width=100 align=center>操作</th>");
out.println("</tr>");
while(it.hasNext()){
tcm=(lr.bean.Tea_cou_maj)it.next();
out.println("<tr>");
out.println("<td align=center>"+um.MajorSelect(tcm.getMnum()).getMname()+"</td>");
out.println("<td align=center>"+um.CourseSelect(tcm.getCnum()).getCname()+"</td>");
String Mnum_cnum=tcm.getMnum()+"_"+tcm.getCnum();
int x=um.Cure_stateSelect(Mnum_cnum);
if(x<2){
out.println("<td align=center><a href='TeaServlet?key=show&Mnum_cnum="+Mnum_cnum+"'><img src='images/button_select.png' width='14' height='13' border='0'></a>");
}else{
out.println("<td align=center>管理员尚未生成成绩表！</td>");
}
out.println("</tr>");
}
%>
</table>