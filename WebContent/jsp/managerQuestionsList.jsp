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
		$("#tt").datagrid({
			url:'${pageContext.request.contextPath}/managerGetQuestionsList.action',
			pagination:true,
			pageList:[10],
			pageSize:10,
			singleSelect:true,
			width:1052,
			columns:[[
				{
					field:'lessonName',
					title:'所属课程',
					width:100,
					align:'center',
				},
				{
					field:'taotiName',
					title:'套题名称',
					width:150,
					align:'center',
				},
				{
					field:'subject',
					title:'考试题目',
					width:400,
					align:'center',
				},
				{
					field:'type',
					title:'试题类型',
					width:100,
					align:'center',
				},
				{
					field:'createtime',
					title:'创建时间',
					width:150,
					align:'center',
					formatter:function(value){
						var date=new Date(value);
						var y=date.getFullYear();
						var m=date.getMonth()+1;
						var d=date.getDate();
						var h=date.getHours();
						var min=date.getMinutes();
						var s=date.getSeconds();
						return y+"-"+m+"-"+d+"&nbsp;&nbsp;&nbsp;&nbsp;"+h+":"+min+":"+s;
					}
				},
				{
					field:'id',
					title:'操作',
					width:150,
					align:'center',
					formatter:function(value,row){
						var str="<a href='${pageContext.request.contextPath}/managerToUpdateQuestions.action?id="+row.id+"'>修改</a>"+
						"&nbsp;&nbsp;|&nbsp;&nbsp;<a href='${pageContext.request.contextPath}/managerDeleteQuestion.action?id="+row.id+"' onclick='return confirm(\"确定要删除吗？\")'>删除</a>";
						return str;
					}
				}
			]]
		})
	})
</script>
<div style="margin-top:2%;margin-left:2%">
	<font color="black">当前位置 ： 考试题目列表</font>
</div>
<br>
<div style="margin-left:80%">
	<a href="${pageContext.request.contextPath }/managerToAddQuestion.action" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加考试题目</a>
</div>
<br>
<center>
<table id="tt"></table>
</center>
</body>
</html>