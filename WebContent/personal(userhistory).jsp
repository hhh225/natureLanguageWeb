<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="DBbean.Database" %>
<%
	String id=(String)session.getAttribute("id");
	Statement stm=Database.getStm();
	String sql="select LSJL_LJ,LSJL_SJ from LSJL where LSJL_XH in"
			+"(select LSJL_XH from LSJL_YHXXB where YHXXB_ID="+id+");"
			+"" 
			+"";
	ResultSet rs=stm.executeQuery(sql);
	
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>历史记录</title>
<style>
body{
	background:url(images/4030/40301140/v2_pzenxj.jpg);
	width:100%;
}
.div1 {
	font-family: Arial, Helvetica, sans-serif;
	width: 100%;
	font-size: 35px;
	margin-top: 30px;
	margin-left: 30px;
	color:white;
}
#div1label{
	font-size:14px;
	color:white;
	position: absolute;
	right: 10px;
	margin-top:10px;
	font-family: Arial, Helvetica, sans-serif;
}
#logo{
	margin-top:5px;
	position:absolute;
	right:120px;
}
.p1{
	text-align:center;
	height:70px;
}
.p2{
	text-align:center;
	width:100%;
}
.div2{
	width:100%;
	background-color:rgba(255,255,255,0.3);
}
#div2t1{
	width:100%;
	text-align:center;
	font-weight:600;
	border:hidden;
	font-family:"幼圆";
}
#div2l1{

	color:black;
	
}
</style>
</head>

<body>
<div class="div1">
	<strong>RDF | 个人中心</strong>	
    <img  id="logo"/>
	<label id="div1label"><strong>| 搜索引擎首页</strong></label>
</div>

<p class="p1"></p>

<table id="div2t1" style="background-color:rgba(255,255,255,0.3); border-bottom-left-radius:10px; border-bottom-right-radius:10px; border-top-left-radius:10px; border-top-right-radius:10px">
<tr>
<td><label id="div2l1" style=" cursor:pointer" onclick="userJump()">首页</label></td>
<td><label id="div2l2" style="font-size:24px; cursor:pointer; color:rgba(255,255,255,1)">历史记录</label></td>
<td><label id="div2l3" style="cursor:pointer" onclick="cpJump()">修改密码</label></td>
<td><label id="div2l4" style="cursor:pointer" onclick="phoneJump()">修改手机号</label></td>
</tr>
</table>

<p style="height:25px"></p>

<div style=" position:absolute; left:0; right:0; margin:auto; width:80%; height:290px; overflow:auto; color:#FFF; background-color:rgba(255,255,255,0.6)">
<table border="1" width="100%" cellpadding="0" cellspacing="0" style="color:#FFF">
<%
	while(rs.next()){
%>
<tr display="none" style="height:60px;">
	<td ><% out.print(rs.getString("LSJL_SJ")); %></td>
	<td><% out.print(rs.getString("LSJL_LJ")); %></td>
</tr>
<%} %>
</table>
</div>

<script type="text/javascript">
function phoneJump(){
	window.location.href="personal(changephone).html";
}
function hisJump(){
	window.location.href="personal(userhistory).jsp";
}
function cpJump(){
	window.location.href="personal(changepass).html";
}
function userJump(){
	window.location.href="personal(user).jsp";
}

</script>

</body>
</html>