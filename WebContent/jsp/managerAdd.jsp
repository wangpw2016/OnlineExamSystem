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
	<font color="black">当前位置 ： 添加管理员信息</font>
</div>
<br>
<br>
<center>
<form action="${pageContext.request.contextPath }/managerAdd.action" method="post"> 
	<table cellpadding="15px">
		<tr>
			<td>帐号</td>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<td>密码</td>
			<td><input type="text" name="password"></td>
		</tr>
		<tr>
			<td>权限</td>
			<td>
				<select name="authority">
					<option value="simple">simple</option>
					<option value="super">super</option>
				</select>
			</td>
		</tr>
		<tr>
			<td><input type="reset" value="重置"></td>
			<td align="right"><input id="sbm" type="submit" value="添加"></td>
		</tr>
	</table>
</form>
</center>
</body>
</html>