<%@ page language="java" contentType="text/html;charset=gbk" pageEncoding="gbk"%>
<%request.setCharacterEncoding("gbk");%>
<jsp:useBean id="student" scope="page" class="lr.bean.Student"></jsp:useBean>
<jsp:useBean id="um" scope="application" class="lr.bean.UserManager"></jsp:useBean>
<script type="text/javascript" src="js/jquery-1.7.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("form").submit(function() {
			if($(":text").val()>100||$(":text").val()<0 || isNaN($(":text").val())){
				alert("��������Ч�ɼ�!");
				return false;
			}
			return true;
		});
		f();
	});
	function f(){
		var x=new Date();
		$("#d1").html(x+"<span>����֧��:��Ϣ����ϵ����</span>");
		setTimeout("f()",1000);
	}
</script>
<%
String Mnum_cnum=request.getParameter("Mnum_cnum");
java.util.List result=um.ShowGrade(Mnum_cnum);
java.util.Iterator it=result.iterator();
java.util.Iterator it1=result.iterator();
out.print("<table border=1 align=center bordercolor=#317D5F>");
out.print("<tr><th colspan=4>"+Mnum_cnum+"_core��&nbsp;״̬��");
if(um.Cure_stateSelect(Mnum_cnum)==0){
	out.print("������</th>");
	out.print("<th colspan=2>�����޸�����ϵ����Ա��</th>");
}else{
	out.print("��¼��</th>");
	out.print("<th colspan=2><a href='TeaServlet?key=suo&Mnum_cnum="+Mnum_cnum+"'>����(����󲻿ɸ��ģ�)</a></th>");
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
if(um.Cure_stateSelect(Mnum_cnum)==1){
%>
	<center>
	<br/>
	<div align="center">
	<form action="TeaServlet" method="post">
	<table width="440" border="1" align="center" cellpadding="0" cellpadding="0" bordercolor="#317D5F">
	<tr bgcolor="#317D5F">
	<th height="37" colspan="2">
	<div align="center">�������</div>
	</th>
	</tr>
	<tr>
	<td height="31" align="center">ѧ��:</td>
	<td align="center">
		<select name="Stunum">
			<%
			while(it1.hasNext()){
				student=(lr.bean.Student)it1.next();
				out.println("<option value='"+student.getStunum()+"'>"+student.getStunum()+"</option>");
			}
			%>
		</select>
	</td>
	</tr>
	
	<tr>
	<td height="31" align="center">�ɼ�һ:</td>
	<td align="center">
		<input type="text" name="Core1" maxlength="3" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">
	</td>
	</tr>
	
	<tr>
	<td height="31" align="center">�ɼ���:</td>
	<td align="center">
		<input type="text" name="Core2" maxlength="3" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">
	</td>
	</tr>
	
	<tr>
	<td height="31" align="center">�ɼ���:</td>
	<td align="center">
		<input type="text" name="Core3" maxlength="3" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">
	</td>
	</tr>
	
	<tr>
	<td height="31" align="center">��ע</td>
	<td align="center">
		<select name="Remarks">
			<option value="null">null</option>
			<option value="����">����</option>
			<option value="����">����</option>
			<option value="ȱ��">ȱ��</option>
			<option value="����">����</option>
		</select>
	</td>
	</tr>
	
	<tr>
	<td height="47" colspan="2">
	<div align="center">
	<input type="hidden" value="Grade" name="key">
	<%
		out.println("<input type='hidden' value='"+Mnum_cnum+"' name='Mnum_cnum'>");
	 %>
	<input type="submit" name="submit" value="�޸�"/>
	<input type="reset" name="reset" value="����"/>
	</div>
	</td>
	</tr>
	</table>
	</form>
	</div>
	</center>
<%
}
%>