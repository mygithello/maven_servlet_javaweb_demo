<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <script type="text/javascript">

        //知识点2========================start=========================================
        //点击“看不清换一张”的实现方法
        function changeImg() {
            var a = document.getElementById("mySpan");
            a.innerHTML = '<img align="middle" src="verificationCodeServlet?t='
                + new Date()
                + '" /><a href="#" onclick="changeImg();">看不清？换一张</a> ';
        }

        //验证非空验证验证码
        function checkVerifiCode() {
            //alert("*******");

            var code = document.getElementById("verification").value;
            if (code == "") {
                //alert("验证码不能为空");
                return false;
            } else {
                return true;
            }

        }

        //提交表单验证
        function check() {
            //alert("abc");
            if (checkVerifiCode()) {
                //alert("true");
                return true;
            } else {
                //alert("false");
                return false;
            }

        }
        //知识点2========================end=========================================



    </script>


  </head>
  
  <body>

    //知识点1
    <a href="ExportExlServlet">导出数据</a>
    <br/>

    //知识点2
    <form action="LoginServlet" onSubmit="return check()" method="post">
        用户名：<input type="text" name="username" /><br>
        密码：<input type="password" name="password" /><br>
        验证码：<input type="text" name="verification" id="verification" onBlur="checkVerifiCode()" />
        <span id="mySpan">
  			<img align="middle" src="verificationCodeServlet" />
            <a href="#" onClick="changeImg();">看不清？换一张</a>
        </span> </br>
        <c:if test="${codeMessage!=null }">
            <span style="color:#F00">${codeMessage }</span><br>
        </c:if>
        <input type="submit" value="提交"/>
    </form>
    <br/>

  </body>
</html>
