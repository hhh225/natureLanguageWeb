<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html>
<html>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*" %>
<%@ page import="DBbean.*" %>
<%
    String[] weekdays={"","日","一","二","三","四","五","六"};
    String[] days=new String[42];
    for(int i=0;i<42;i++)
        days[i]="";

    GregorianCalendar currentDay = new GregorianCalendar();
    //获取年月日
    int year= currentDay.get(Calendar.YEAR);
	System.out.println(year);
    int month=currentDay.get(Calendar.MONTH);
    System.out.println("month:"+month);
    int today=currentDay.get(Calendar.DAY_OF_MONTH); //这个月中的第几天
    int weekday=currentDay.get(Calendar.DAY_OF_WEEK);//这个月的第几天

   //修改日历字段值
    Calendar thisMonth=Calendar.getInstance(); ///Calendar类的静态方法getInstance()可以初始化一个日历对象
    thisMonth.set(Calendar.MONTH, month );
    thisMonth.set(Calendar.YEAR, year);
    thisMonth.setFirstDayOfWeek(Calendar.SUNDAY); //设置一星期的第一天是星期几，这里设置成星期天
    thisMonth.set(Calendar.DAY_OF_MONTH,1); //一个月中的某一天

    int firstIndex=thisMonth.get(Calendar.DAY_OF_WEEK)-1;
    int maxIndex=thisMonth.getActualMaximum(Calendar.DAY_OF_MONTH);

    //maxIndex这个月的最大值， firstIndex星期几
    for(int i=0;i<maxIndex;i++){
        days[firstIndex+i]=String.valueOf(i+1); //得到当月的表格
    }
    System.out.print(firstIndex+","+maxIndex);
//名称显示
    Statement stm=Database.getStm();
    System.out.println("Statement:"+stm);
    ResultSet rs=stm.executeQuery("select * from YHXXB where YHXXB_YHM='hzj';");
    String name=null;
    String phone=null;
    
    while(rs.next()){
    	name=rs.getString("YHXXB_YHM");
    	phone=rs.getString("YHXXB_SJH");
    }
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
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
	color:rgba(255,255,255,1);
	color:white;
	
}
</style>
</head>

<body onLoad="showTime(time)">
<div class="div1">
	<strong>RDF | 个人中心</strong>	
    <img  id="logo"/>
	<label id="div1label"><strong>| 搜索引擎首页</strong></label>
</div>

<p class="p1"></p>

<table id="div2t1" style="background-color:rgba(255,255,255,0.3); border-bottom-left-radius:10px; border-bottom-right-radius:10px; border-top-left-radius:10px; border-top-right-radius:10px">
<tr>
<td><label id="div2l1" style="font-size:24px; cursor:pointer">首页</label></td>
<td><label id="div2l2" style="cursor:pointer" onclick="hisJump()">历史记录</label></td>
<td><label id="div2l3" style="cursor:pointer" onclick="cpJump()">修改密码</label></td>
<td><label id="div2l4" style="cursor:pointer" onclick="phoneJump()">修改手机号</label></td>
</tr>
</table>

<p style="height:25px"></p>


<div style="width:70%; position:fixed; left:0; right:0; top:50%; bottom:0; margin:auto">
<table style=" font-family:幼圆;width:100%">
	
	<tr>
				<td rowspan="7">
						<table width="auto" border="0" align="center" cellspacing="1" style="background:rgba(255,255,255,0.6)">
		<tr height="25">
			<td colspan="4" align="center" style="border: 0 solid"><input
				type="text" style="border: 0; background-color: #F9F9F9"
				disable="true" id="time" size="9"></td>
		
        
							<td colspan="3" style="text-align:center"><%=year %><%out.print("/"); %><%=month+1 %></td>
					</tr>
		<tr height="25" bgcolor="#F0F0F0" align="center">
			<td style="border: 1 solid; ">Sun</td>
			<td style="border: 1 solid; ">Fir</td>
			<td style="border: 1 solid; ">Tues</td>
			<td style="border: 1 solid; ">Thir</td>
			<td style="border: 1 solid; ">Wednes</td>
			<td style="border: 1 solid; ">Fri</td>
			<td style="border: 1 solid; ">Satur</td>
		</tr>
		<tr height="4">
			<td colspan="7"></td>
		</tr>
		<% for(int j=0;j<6;j++) {//共5行 %>
		<tr>
			<% 
                  for(int i=j*7;i<(j+1)*7;i++) { //每行有7列
                      if((i-firstIndex+1)==today){//如果是这一天， 高亮显示 %>
			<td width="30" height="23" align="center" bgcolor="gray"
				style="border: 1 solid"><font color="#FFFFFF"><b><%=days[i]%></b></font>
			</td>
			<%    }else{ %>
			<td width="10" height="23" align="center" style="border: 1 solid"><%=days[i]%></td>
			<%    }
                  }%>
		</tr>
		<% } %>
	</table>
				</td>
				<th style=" width:10%;color:#FFF;text-align:center; font-size:8px">用户姓名：</th>
        <td style=" background-color:rgba(255,255,255,0.6); width:60%; font-weight:bold; color:#FFF"><%=name %></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
    	<th style="color:#FFF;text-align:center; font-size:8px">手机号码：</th>
        <td style="background-color:rgba(255,255,255,0.6); font-weight:bold; color:#FFF"><%=phone %></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
    	<th style="color:#FFF;text-align:center; font-size:8px">上次登录时间：</th>
        <td style="background-color:rgba(255,255,255,0.6); font-weight:bold; color:#FFF"></td>
    </tr>
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
	window.location.href="personal(user).html";
}
function showTime(showWhere){
    var now=new Date();
    var hour=now.getHours();
    var minu=now.getMinutes();
    var sec=now.getSeconds();

    if(hour<10) hour="0"+hour;
    if(minu<10) minu="0"+minu;
    if(sec<10) sec="0"+sec;

    //给id赋值
    showWhere.value=hour+":"+minu+":"+sec;
    setTimeout("showTime(time)",1000) //在1000ms后执行showTime函数
}
function refresh(){
	location.reload();
}
</script>
</body>
</html>