<%@page import="lr.bean.User"%>
<%@ page language="java" contentType="text/html;charset=gbk"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>学生主页</title>
<link rel="stylesheet" type="text/css" href="css/font.css">
</head>
<body topmargin="0" leftmargin="0" bottommargin="0" class="scrollbar" background="images/left_bg.gif">
<table width="1003" align="center" cellpadding="1" cellspacing="0" bordercolor="#317D5F" >
  <tr>
    <td><table width="1003" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="52" bgcolor="#FFFFFF"><div align="center">
            <IFRAME frameBorder=0 id=top name=top scrolling=no src="top.jsp" 
     			style="HEIGHT: 85px; VISIBILITY: inherit; WIDTH: 1003px; Z-INDEX: 3"> </IFRAME>
        </div></td>
      </tr>
    </table>
      <table width="1003" height="620" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td width="212" height="220" valign="top"  id="lt" style="display:"><div align="center">
              <IFRAME frameBorder=0 id=left name=left src="StuLeft.jsp" 
      style="HEIGHT: 500px; VISIBILITY: inherit; WIDTH: 212px; Z-INDEX: 2"> </IFRAME>
      		<%
      		User u=(User)request.getSession().getAttribute("user");
      		out.println("<h3>姓名："+u.getName()+"</h3><br>");
      		out.println("<h3><a href='UserServlet?key=exit'>注销</a></h3>");
      		 %>
          </div></td>
          <td width="13" height="584" background="images/left_bg.gif"><div align="center"></div></td>
          <td width="778" bgcolor="#FFFFFF" id="mn"><div align="center">
              <IFRAME frameBorder=0 id=main name=main scrolling=yes src="ShowStuCourse.jsp" 
      style="HEIGHT: 620px; VISIBILITY: inherit; WIDTH: 778px; Z-INDEX: 1"> </IFRAME>
          </div></td>
        </tr>
      </table></td>
  </tr>
</table>
</body>
</html>
