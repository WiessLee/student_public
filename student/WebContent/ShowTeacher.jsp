<%@ page language="java" contentType="text/html;charset=gbk"%>
<%request.setCharacterEncoding("gbk");%>
<jsp:useBean id="tercher" scope="page" class="lr.bean.Teacher"></jsp:useBean>
<jsp:useBean id="um" scope="application" class="lr.bean.UserManager"></jsp:useBean>
<%
java.util.List result=um.TercerList();
java.util.Iterator it=result.iterator();
%>
<body background="images/left_bg.gif">
<br/>
<div align="center">
<table width="440" border="1" align="center" bordercolor="#317D5F">
<tr bgcolor="#317D5F"><th colspan="3" height="37">��ʦ��Ϣ</th></tr>
<%
out.println("<tr>");
out.println("<th width=100 align=center>��ʦ���</th><th width=100 align=center>����</th><th width=100 align=center>��ע</th>");
out.println("</tr>");
while(it.hasNext()){
tercher=(lr.bean.Teacher)it.next();
out.println("<tr>");
out.println("<td align=center>"+tercher.getTnum()+"</td>");
out.println("<td align=center>"+tercher.getName()+"</td>");
out.println("<td align=center>"+tercher.getRemarks()+"</td>");
out.println("</tr>");
}
%>
</table>
</div>
</body>
