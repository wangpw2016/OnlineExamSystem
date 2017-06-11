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
			url:'${pageContext.request.contextPath}/managerGetTaotiList.action',
			pagination:true,
			pageList:[10],
			pageSize:10,
			singleSelect:true,
			width:1002,
			columns:[[
				{
					field:'id',
					title:'编号',
					width:200,
					align:'center',
				},
				{
					field:'name',
					title:'套题名称',
					width:200,
					align:'center',
				},
				{
					field:'lessonname',
					title:'所属课程',
					width:200,
					align:'center',
				},
				{
					field:'createtime',
					title:'创建日期',
					width:200,
					align:'center',
					formatter:function(value){
						var date=new Date(value);
						var y=date.getFullYear();
						var m=date.getMonth()+1;
						var d=date.getDate();
						return y+"-"+m+"-"+d;
					}
				},
				{
					field:'id2',
					title:'操作',
					width:200,
					align:'center',
					formatter:function(value,row){
						var str="<a href='${pageContext.request.contextPath}/managerToUpdateTaoti.action?id="+row.id+"'>修改</a>"+
						"&nbsp;&nbsp;|&nbsp;&nbsp;<a href='${pageContext.request.contextPath}/managerDeleteTaoti.action?id="+row.id+"' onclick='return confirm(\"确定要删除吗？\")'>删除</a>";
						return str;
					}
				}
			]]
		})
	})
</script>
<div style="margin-top:2%;margin-left:2%">
	<font color="black">当前位置 ： 套题列表</font>
</div>
<br>
<div style="margin-left:80%">
	<a href="${pageContext.request.contextPath }/managerToAddTaoti.action" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加套题</a>
</div>
<br>
<center>
<table id="tt"></table>
</center>
</body>
</html>