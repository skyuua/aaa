<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="<%=request.getContextPath()%>/LoginTestServlet" method="post">
<!--name属性要和实体类的属性一致，不然BeanUtil生成不了-->
姓名：<input name="name" type="text" /><br>
邮箱：<input name="email" type="text"/><br>
年龄：<input name="age" type="text"/><b></b>
<input type="submit" value="提交"/>
</form>
</body>
</html>
