<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>在线考试系统-选择课程</title>
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
		$("#examlesson").combobox({
			url:'${pageContext.request.contextPath}/getLessonList.action',
			valueField:'id',
			textField:'name',
			limitToList:true,
		})
		$("#subm").click(function(){
			if($("#examlesson").val()==""){
				alert("请选择考试科目！");
				return false;
			}
			var flag=confirm("确定要进行当前选择的考试吗？");
			if(flag){
				return true;
			}else{
				return false;
			}
		})
	})
</script>
</head>
<body>
<div style="line-height:120px;height:120px;background-image:url('${pageContext.request.contextPath}/image/signinback.jpg');background-size:cover">
	<font color="white" size="10" face="仿宋" style="font-weight:bold;margin-left:2%">营 养 在 线 考 试 网</font>
	<font id="ft" style="margin-left:40%">当 前 考 生：<span id="sp">${sessionScope.studentName }</span></font>
</div>
<div style="margin-top:2%;margin-left:2%">
	<font color="black">当前位置 ： 在线考试 >> 选择考试课程</font>
</div>
<br>
<br>
<center style="margin-top:2%">
	<form action="${pageContext.request.contextPath }/toExamPage.action" method="post" target="_blank">
		<table cellpadding="15px">
			<tr>
				<td>请选择考试课程</td>
				<td><input id="examlesson" name="lessonid"></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input id="subm" type="submit" value="确定"></td>
			</tr>
		</table>
		<br>
		<br>
		<br>
		<br>
		<a href="${pageContext.request.contextPath }/jsp/index.jsp">回 到 首 页</a>
	</form>
</center>
</body>
</html>