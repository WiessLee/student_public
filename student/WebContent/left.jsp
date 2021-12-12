<%@ page language="java" contentType="text/html;charset=gbk"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>管理员导航</title>
<link rel="stylesheet" type="text/css" href="css/font.css">
</head>
<script language="javascript">
  function openspgl(){
    if(document.all.spgl.style.display=="none"){
	   document.all.spgl.style.display="";
	   document.all.d1.src="images/point3.gif";
	 }
	 else{
	  document.all.spgl.style.display="none";
	  document.all.d1.src="images/point1.gif";
	 }  
  }
  function openyhgl(){
    if(document.all.yhgl.style.display=="none"){
	   document.all.yhgl.style.display="";
	   document.all.d2.src="images/point3.gif";
	 }
	 else{
	  document.all.yhgl.style.display="none";
	  document.all.d2.src="images/point1.gif";
	 }  
  }
  function openddgl(){
    if(document.all.ddgl.style.display=="none"){
	   document.all.ddgl.style.display="";
	   document.all.d3.src="images/point3.gif";
	 }
	 else{
	  document.all.ddgl.style.display="none";
	  document.all.d3.src="images/point1.gif";
	 }  
  }
  function opengggl(){
    if(document.all.gggl.style.display=="none"){
	   document.all.gggl.style.display="";
	   document.all.d4.src="images/point3.gif";
	 }
	 else{
	  document.all.gggl.style.display="none";
	  document.all.d4.src="images/point1.gif";
	 }  
  }
</script>
<body topmargin="0" leftmargin="0" bottommargin="0">
<table width="212" border="0" cellpadding="0" cellspacing="0" >
  <tr>
    <td height="425" valign="top" background="images/left_bg.gif"><div align="center">
      <table width="212" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><table width="212" height="20" border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td width="212" height="32" background="images/default_09.gif" onClick="javascript:openspgl()"><div align="center"><img id="d1" border="0"src="images/point1.gif" width="10" height="10"><a href="#">教务信息</a></div></td>
            </tr>
          </table>
            <table width="212" border="0" cellpadding="0" cellspacing="0" id="spgl" style="display:">
              <tr>
                <td height="20" background="images/default_10.gif"><div align="center"><a href="ShowTeacher.jsp" target="main">教师信息</a></div></td>
              </tr>
              <tr>
                <td height="22" background="images/default_10.gif"><div align="center"><a href="ShowCourse.jsp" target="main">课程信息</a></div></td>
              </tr>
              <tr>
                <td height="22" background="images/default_10.gif"><div align="center"><a href="ShowMajor.jsp" target="main">专业信息</a></div></td>
              </tr>
            </table>
			</td>
        </tr>
        <tr>
        <td>
         <table width="212" height="20" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td height="32" background="images/default_09.gif" onClick="javascript:openyhgl()"><div align="center"><a href="#"><img id="d2" border="0"src="images/point1.gif" width="10" height="10"> 教务管理</a></div></td>
              </tr>
            </table>
            <table width="212" border="0" cellpadding="0" cellspacing="0" id="yhgl" style="display:">
              <tr>
                <td height="26" background="images/default_10.gif"><div align="center"><a href="TcmAdd.jsp" target="main">课程安排</a></div></td>
              </tr>
            </table>
            </td>
            </tr>
      </table>
      </div></td>
  </tr>
</table>
</body>
</html>
