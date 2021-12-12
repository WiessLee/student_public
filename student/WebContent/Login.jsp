<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>首页</title>
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
		<legend>教务系统</legend>
			<div>
			<p>编&nbsp;号:<input class="input1" type="text" name="num" ></p>
			<p>密&nbsp;码:<input class="input1" type="password" name="pass"></p>
			<p><input type="radio" name="ID" value="stu" checked="checked">学生
			<input type="radio" name="ID" value="tea">教师
			<input type="radio" name="ID" value="adm">管理员</p>
			<p>
			<input type="hidden" value="select" name="key">
			<input class="input2" type="submit" value="登录">&nbsp;
			<a href=""><input class="input2" type="button" value="重置"></a>
			</p>
			</div>
		</fieldset>
	</form>
  </body>
</html>
