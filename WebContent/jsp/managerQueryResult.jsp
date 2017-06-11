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
		$("#doqueryresult").click(function(){
			var queryoption=$("#queryoption").val();
			var optionvalue=$("#optionvalue").val();
			if(queryoption == "createtime"){
				var reg=/^\d{4}\-\d{2}\-\d{2}$/;
				if(!reg.test(optionvalue)){
					alert("日期格式错误！请输入正确格式的日期，如：1990-09-06");
					return false;
				}
			}
			$("#tt").datagrid({
				url:'${pageContext.request.contextPath}/managerGetQueryResult.action',
				width:902,
				singleSelect:true,
				pagination:true,
				pageList:[10],
				pageSize:10,
				queryParams:{
					option:queryoption,
					value:optionvalue
				},
				columns:[[
					{
						field:'id',
						title:'编号',
						width:100,
						align:'center',
					},
					{
						field:'examnumber',
						title:'准考证号',
						width:200,
						align:'center',
					},
					{
						field:'lessonname',
						title:'考试课程',
						width:100,
						align:'center',
					},
					{
						field:'resingle',
						title:'单选题得分',
						width:100,
						align:'center',
					},
					{
						field:'resmore',
						title:'多选题得分',
						width:100,
						align:'center',
					},
					{
						field:'restotal',
						title:'总分',
						width:100,
						align:'center',
					},
					{
						field:'createtime',
						title:'考试时间',
						width:200,
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
				]]
			})
		})
	})
</script>
<div style="margin-top:2%;margin-left:2%">
	<font color="black">当前位置 ： 修改管理员信息</font>
</div>
<br>
<br>
<center>
<div style="margin-left:4%">
	<font>查询条件：</font>
	<select id="queryoption">
		<option value="examnumber">准考证号</option>
		<option value="lessonname">考试课程</option>
		<option value="createtime">考试日期</option>
	</select>
	<font style="margin-left:4%">关键字：</font><input id="optionvalue" type="text">
	<a id="doqueryresult" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
</div>
<br>
<br>
<table id="tt"></table>
</center>
</body>
</html>