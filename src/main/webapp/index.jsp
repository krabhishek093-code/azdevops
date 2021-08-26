<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>   Demo application 26-08-2021 </title>
</head>
<body>
<center>
<h1>GOogle is everywhere</h1>
<img alt="" src="zippy.png">
<h3>

This is a Java App deployed by AzureDevops on <%out.println(System.getProperty("os.name"));%> at <%= (new java.util.Date()).toLocaleString()%> for ZippyOPS Testing
</h3>
</center>
</body>
</html>