<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>在线考试系统-考试成绩</title>
</head>
<body>
<div style="line-height:120px;height:120px;background-image:url('${pageContext.request.contextPath}/image/signinback.jpg');background-size:cover">
	<font color="white" size="10" face="仿宋" style="font-weight:bold;margin-left:2%">营 养 在 线 考 试 网</font>
	<font id="ft" style="margin-left:40%">当 前 考 生：<span id="sp">${sessionScope.studentName }</span></font>
</div>
<div style="margin-top:2%;margin-left:2%">
	<font color="black">当前位置 ： 在线考试 >> 考试成绩</font>
</div>
<br>
<center>
	<c:choose>
	<c:when test="${!empty resultList}">
	<table cellpadding="20px" cellspacing="0px" border="1px">
		<tr style="background:#A6FFFF">
			<td align="center">考试课程</td>
			<td align="center">准考证号</td>
			<td align="center">单选题成绩</td>
			<td align="center">多选题成绩</td>
			<td align="center">总成绩</td>
			<td align="center">考试时间</td>
		</tr>
		<c:forEach items="${resultList }" var="studentresult">
			<tr>
				<td align="center">${studentresult.lessonname }</td>
				<td align="center">${studentresult.examnumber }</td>
				<td align="center">${studentresult.resingle }</td>
				<td align="center">${studentresult.resmore }</td>
				<td align="center">${studentresult.restotal }</td>
				<td align="center">${studentresult.createtime }</td>
			</tr>
		</c:forEach>
	</table>
	</c:when>
	<c:otherwise>
		<div style="margin-top:10%">
			<font>对不起！没有找到您的成绩记录！</font>
		</div>
	</c:otherwise>
	</c:choose>
	<br>
	<a href="${pageContext.request.contextPath }/jsp/index.jsp">回 到 首 页</a>
	<br>
</center>
</body>
</html>