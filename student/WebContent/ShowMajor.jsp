<%@ page language="java" contentType="text/html;charset=gbk"%>
<%request.setCharacterEncoding("gbk");%>
<jsp:useBean id="major" scope="page" class="lr.bean.Major"></jsp:useBean>
<jsp:useBean id="um" scope="application" class="lr.bean.UserManager"></jsp:useBean>
<% 
java.util.List result=um.MajorList();
java.util.Iterator it=result.iterator();
%>
<body background="images/left_bg.gif">
<br/>
<div align="center">
<table width="440" border="1" align="center" bordercolor="#317D5F">
<tr bgcolor="#317D5F"><th colspan=2 height="37">רҵ��Ϣ</th></tr>
<%
out.println("<tr>");
out.println("<th width=100 align=center>רҵ���</th><th width=100 align=center>רҵ����</th>");
out.println("</tr>");
while(it.hasNext()){
major=(lr.bean.Major)it.next();
out.println("<tr>");
out.println("<td align=center>"+major.getMnum()+"</td>");
out.println("<td align=center>"+major.getMname()+"</td>");
out.println("</tr>");
}
%>
</table>
</div>
</body>