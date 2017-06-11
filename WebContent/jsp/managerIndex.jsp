<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>在线考试系统-后台首页</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath }/easyui/themes/icon.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/easyui/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/easyui/locale/easyui-lang-zh_CN.js"></script>
	
<script type="text/javascript">
	$(function(){
		var spanText = $("#sp").text();
		if(spanText==""){
			$("#ft").hide();
		}
		$("#a1").click(function(){
			if($("#managerAuthority").val()!="super"){
				alert("对不起！您没有权限访问此模块！");
				return false;
			}
		})
	})
</script>
</head>
<body class="easyui-layout">
<input id="managerAuthority" type="hidden" value="${sessionScope.managerAuthority }">
	<div data-options="region:'north'" style="height:100px">
		<div style="line-height:100px;height:98px;background-image:url('${pageContext.request.contextPath}/image/signinback.jpg');background-size:cover">
			<font color="white" size="12px" face="仿宋" style="font-weight:bold;margin-left:5%">营 养 在 线 考 试 网<font size="5px" color="black"> -- 后 台 管 理 </font></font>
			<font id="ft" style="margin-left:25%">当 前 管 理 员：<span id="sp">${sessionScope.managerName }</span></font>
		</div>
	</div>
	
	<div data-options="region:'south'" style="height:60px">
		<center style="margin-top:1%">
			<font>CopyRight : www.xiaowu.com<br>使用技术：springmvc、spring、mybatis</font>
		</center>
	</div>
	
	<div data-options="region:'west'" style="width:260px">
		<div style="height:50px;background:#CECEFF;line-height:50px;text-align:center;font-weight:bold">
			<font face="仿宋" size="5px">网 站 后 台 管 理</font>
		</div>
		<div style="margin-left:25%;margin-top:15%">
			<a id="a1" href="${pageContext.request.contextPath }/managerToList.action" style="text-decoration:none;"><font size="4px">管理员信息管理</font></a><br><br>
			<a href="${pageContext.request.contextPath }/managerToStudentList.action" style="text-decoration:none"><font size="4px">考生信息管理</font></a><br><br>
			<a href="${pageContext.request.contextPath }/managerToQueryResult.action" style="text-decoration:none"><font size="4px">考生成绩查询</font></a><br><br>
			<a href="${pageContext.request.contextPath }/managerToLessonList.action" style="text-decoration:none"><font size="4px">课程信息管理</font></a><br><br>
			<a href="${pageContext.request.contextPath }/managerToTaotiList.action" style="text-decoration:none"><font size="4px">套题信息管理</font></a><br><br>
			<a href="${pageContext.request.contextPath }/managerToQuestionsList.action" style="text-decoration:none"><font size="4px">考试题目管理</font></a><br><br>
			<a href="${pageContext.request.contextPath }/managerLogout.action" style="text-decoration:none"><font size="4px">退出后台管理</font></a>
		</div>
	</div>
	
	<div data-options="region:'center',href:'${requestScope.myurl }'" style="padding:5px;background:#eee"></div>
</body>
</html>