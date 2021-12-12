<%@ page language="java" contentType="text/html;charset=gbk"%>
<%request.setCharacterEncoding("gbk");%>
<jsp:useBean id="tcm" scope="page" class="lr.bean.Tea_cou_maj"></jsp:useBean>
<jsp:useBean id="um" scope="application" class="lr.bean.UserManager"></jsp:useBean>
<% 
java.util.List result=um.TcmList();
java.util.Iterator it=result.iterator();
%>
<table width="500" border="1" align="center" bordercolor="#317D5F">
<tr bgcolor="#317D5F"><th colspan=5 height="37">授课安排</th></tr>
<% 
out.println("<tr>");
out.println("<th width=100 align=center>专业</th><th width=100 align=center>课程</th><th width=100 align=center>教师</th><th colspan=2 align=center>操作</th>");
out.println("</tr>");
while(it.hasNext()){
tcm=(lr.bean.Tea_cou_maj)it.next();
out.println("<tr>");
out.println("<td align=center>"+um.MajorSelect(tcm.getMnum()).getMname()+"</td>");
out.println("<td align=center>"+um.CourseSelect(tcm.getCnum()).getCname()+"</td>");
out.println("<td align=center>"+tcm.getTnum()+um.TeacherSelect(tcm.getTnum()).getName()+"</td>");
out.println("<td align=center><a href='AdminServlet?key=delete&Mnum="+tcm.getMnum()+"&Cnum="+tcm.getCnum()+"'><img src='images/button_drop.png' width='14' height='13' border='0'></a>");
out.println("</td>");
String Mnum_cnum=tcm.getMnum()+"_"+tcm.getCnum();
if(um.Cure_stateSelect(Mnum_cnum)<2){
out.println("<td align=center><a href='AdminServlet?key=show&Mnum_cnum="+Mnum_cnum+"'><img src='images/button_select.png' width='14' height='13' border='0'></a>");
}else{
out.println("<td align=center><p style='color:red'>未生成成绩表！</p></td>");
}
out.println("</tr>");
}
%>
</table>