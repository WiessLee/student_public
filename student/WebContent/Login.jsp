<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>��ҳ</title>
    <style type="text/css">
		fieldset {
			width: 400px;
			margin: 150px auto 0px auto;
			border-radius:15px;
			border: 1px solid #960956;
		}
		p{
			text-align: center;
			margin: 30px 0px;
		}
		.input1{
			border: none;
			border-bottom: 1px dashed black;
		}
		.input2{
			background: black;
			color: white;
			font-weight: bold;
			padding: 5px 10px 5px 10px;
		}
	</style>
  </head>
  <body>
	<form action="UserServlet" method="post">
		<fieldset>
		<legend>����ϵͳ</legend>
			<div>
			<p>��&nbsp;��:<input class="input1" type="text" name="num" ></p>
			<p>��&nbsp;��:<input class="input1" type="password" name="pass"></p>
			<p><input type="radio" name="ID" value="stu" checked="checked">ѧ��
			<input type="radio" name="ID" value="tea">��ʦ
			<input type="radio" name="ID" value="adm">����Ա</p>
			<p>
			<input type="hidden" value="select" name="key">
			<input class="input2" type="submit" value="��¼">&nbsp;
			<a href=""><input class="input2" type="button" value="����"></a>
			</p>
			</div>
		</fieldset>
	</form>
  </body>
</html>
