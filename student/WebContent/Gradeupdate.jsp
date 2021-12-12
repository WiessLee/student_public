<%@ page language="java" contentType="text/html;charset=gbk" pageEncoding="gbk"%>
<%request.setCharacterEncoding("gbk");%>
<jsp:useBean id="student" scope="page" class="lr.bean.Student"></jsp:useBean>
<jsp:useBean id="um" scope="application" class="lr.bean.UserManager"></jsp:useBean>
<script type="text/javascript" src="js/jquery-1.7.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("form").submit(function() {
			if($(":text").val()>100||$(":text").val()<0 || isNaN($(":text").val())){
				alert("请输入有效成绩!");
				return false;
			}
			return true;
		});
		f();
	});
	function f(){
		var x=new Date();
		$("#d1").html(x+"<span>技术支持:信息工程系李芮</span>");
		setTimeout("f()",1000);
	}
</script>
<%
String Mnum_cnum=request.getParameter("Mnum_cnum");
java.util.List result=um.ShowGrade(Mnum_cnum);
java.util.Iterator it=result.iterator();
java.util.Iterator it1=result.iterator();
out.print("<table border=1 align=center bordercolor=#317D5F>");
out.print("<tr><th colspan=4>"+Mnum_cnum+"_core表&nbsp;状态：");
if(um.Cure_stateSelect(Mnum_cnum)==0){
	out.print("已锁定</th>");
	out.print("<th colspan=2>如需修改请联系管理员！</th>");
}else{
	out.print("可录入</th>");
	out.print("<th colspan=2><a href='TeaServlet?key=suo&Mnum_cnum="+Mnum_cnum+"'>保存(保存后不可更改！)</a></th>");
}
out.println("<tr>");
out.println("<th width=50 align=center>学生编号</th><th width=100 align=center>姓名</th><th width=100 align=center>成绩一</th><th width=100 align=center>成绩二</th><th width=100 align=center>成绩三</th><th width=100 align=center>备注</th>");
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
	<div align="center">教务管理</div>
	</th>
	</tr>
	<tr>
	<td height="31" align="center">学号:</td>
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
	<td height="31" align="center">成绩一:</td>
	<td align="center">
		<input type="text" name="Core1" maxlength="3" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">
	</td>
	</tr>
	
	<tr>
	<td height="31" align="center">成绩二:</td>
	<td align="center">
		<input type="text" name="Core2" maxlength="3" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">
	</td>
	</tr>
	
	<tr>
	<td height="31" align="center">成绩三:</td>
	<td align="center">
		<input type="text" name="Core3" maxlength="3" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')">
	</td>
	</tr>
	
	<tr>
	<td height="31" align="center">备注</td>
	<td align="center">
		<select name="Remarks">
			<option value="null">null</option>
			<option value="补考">补考</option>
			<option value="重修">重修</option>
			<option value="缺考">缺考</option>
			<option value="其他">其他</option>
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
	<input type="submit" name="submit" value="修改"/>
	<input type="reset" name="reset" value="重置"/>
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