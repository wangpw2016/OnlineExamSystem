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
		var questionId=$("#questionId").val();
		$("#ff").form('load','${pageContext.request.contextPath}/managerGetQuestionInfo.action?id='+questionId);
		$("#cc2").combobox({
			url:'${pageContext.request.contextPath}/managerGetTaotis.action',
			textField:'name',
			valueField:'id',
			limitToList:true,
		})
		$("#sbm").click(function(){
			if($("#subject").val()==""){
				alert("考试题目不能为空！");
				return false;
			}
			if($("#subject").val().length>200){
				alert("考试题目长度超过了200！");
				return false;
			}
			var flag=true;
			$(":text").each(function(){
				if($(this).val()==""){
					if($(this).attr("id")!="remark"){
						alert($(this).parent().prev().text()+"不能为空！");
						flag=false;
						return false;
					}
				}
			})
			if($("input:checkbox:checked").size()==0){
				alert("正确答案不能为空！");
				return false;
			}
			if(!flag){
				return false;
			}
			return true;
		})
	})
</script>
<div style="margin-top:2%;margin-left:2%">
	<font color="black">当前位置 ： 修改试题信息</font>
</div>
<br>
<br>
<center>
<form id="ff" action="${pageContext.request.contextPath }/managerUpdateQuestion.action" method="post"> 
	<input type="hidden" id="questionId" name="id" value="${param.id }">
	<table cellpadding="15px">
		<tr>
			<td>所属套题</td>
			<td><input id="cc2" type="text" name="taotiid"></td>
			<td>试题类型</td>
			<td>
				<select name="type">
					<option value="单选">单选</option>
					<option value="多选">多选</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>考试题目</td>
			<td><textarea id="subject" name="subject" cols="20" rows="4"></textarea></td>
			<td colspan="2"><font color="red">题目类容必须少于200个字</font></td>
		</tr>
		<tr>
			<td>选项A</td>
			<td><input type="text" name="optiona"></td>
			<td>选项B</td>
			<td><input type="text" name="optionb"></td>
		</tr>
		<tr>
			<td>选项C</td>
			<td><input type="text" name="optionc"></td>
			<td>选项D</td>
			<td><input type="text" name="optiond"></td>
		</tr>
		<tr>
			<td>正确答案</td>
			<td>
				A<input type="checkbox" name="answer" checked="checked" value="A">&nbsp;&nbsp;&nbsp;&nbsp;
				B<input type="checkbox" name="answer" value="B">&nbsp;&nbsp;&nbsp;&nbsp;
				C<input type="checkbox" name="answer" value="C">&nbsp;&nbsp;&nbsp;&nbsp;
				D<input type="checkbox" name="answer" value="D">
			</td>
			<td>备注</td>
			<td><input id="remark" type="text" name="note"></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="reset" value="重置"></td>
			<td colspan="2" align="center"><input id="sbm" type="submit" value="修改"></td>
		</tr>
	</table>
</form>
<br>
<font color="red">温馨提示：可以通过刷新来获取初始数据哦</font>
</center>
</body>
</html>