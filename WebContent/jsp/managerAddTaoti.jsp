<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	$(function(){
		$("#cc").combobox({
			url:'${pageContext.request.contextPath}/managerGetLessons.action',
			valueField:'id',
			textField:'name',
			limitToList:true
		})
		$("#sbm").click(function(){
			var flag=true;
			$(":text").each(function(){
				if($(this).val()==""){
					alert($(this).parent().prev().text()+"不能为空！");
					flag=false;
					return false;
				}
			})
			if(!flag){
				return false;
			}
			return true;
		})
	})
</script>
<div style="margin-top:2%;margin-left:2%">
	<font color="black">当前位置 ： 添加套题信息</font>
</div>
<br>
<br>
<center>
<form action="${pageContext.request.contextPath }/managerAddTaoti.action" method="post"> 
	<table cellpadding="15px">
		<tr>
			<td>套题名称</td>
			<td><input class="easyui-textbox" type="text" name="name"></td>
		</tr>
		<tr>
			<td>所属课程</td>
			<td><input id="cc" name="lessonid" type="text"></td>
		</tr>
		<tr>
			<td colspan="2" align="right"><input id="sbm" type="submit" value="添加"></td>
		</tr>
	</table>
</form>
</center>
</body>
</html>