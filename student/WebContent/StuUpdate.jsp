<%@ page language="java" contentType="text/html;charset=gbk"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <script type="text/javascript" src="js/jquery-1.7.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$("form").submit(function() {
				if($(":password:eq(0)").val()===""||$(":password:eq(1)").val()===""){
					alert("���벻��Ϊ��!");
					return false;
				}
				return true;
			});
			f();
		});
	</script>
	<title>ѧ���޸�����ҳ��</title>
  </head>
  <body background="images/left_bg.gif">
  <center>
	<br/>
	<div align="center">
	<form action="StuServlet" method="post">
	<table width="440" border="1" align="center" cellpadding="0" cellpadding="0" bordercolor="#317D5F">
	<tr bgcolor="#317D5F">
	<th height="37" colspan="2">
	<div align="center">�޸�����</div>
	</th>
	</tr>
	<tr>
	<td height="31" align="center">ԭ����:</td>
	<td align="center">
		<input type="password" name="pass">
	</td>
	</tr>
	
	<tr>
	<td height="31" align="center">������:</td>
	<td align="center">
		<input type="password" name="newpass">
	</td>
	</tr>
	
	<tr>
	<td height="47" colspan="2">
	<div align="center">
	<input type="hidden" value="update" name="key">
	<input type="submit" name="submit" value="�޸�"/>
	<input type="reset" name="reset" value="����"/>
	</div>
	</td>
	</tr>
	</table>
	</form>
	</div>
	</center>
  </body>
</html>
