<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>注册</title>
<style>
.line1{
	padding-bottom:10px;
	padding-top:10px;
	text-align:right;
	width:30%
}
.line1 img{
	width:25px;
}
.line2{
	
}
.line2 input{
	width:70%;
	height:20px;
	background-color:rgba(255,255,255,0.6)
}
</style>
</head>

<body style="background-image:url(loginImage/index/bg.jpg); width:100%; ">
	<h1 style="margin-left:60px; margin-top:60px; color:white; font-size:55px; font-family:Arial, Helvetica, sans-serif">RDF</h1>
<div style=" width:500px;position:fixed; left:0; right:0; margin:auto">
<form style="width:100%" action="register">
	<table style="width:100%; background-color:rgba(255,255,255,0.3)">
    	<tr>
        	<th colspan="2" style="font-family:'幼圆'; font-size:26px; color:#FFF; background-color:rgba(153,153,255,0.5)">用户注册</th>
        </tr>
        <tr>
        	<td class="line1"><img src="loginImage/index/u27.png" /></td>
            <td class="line2"><input name="account" type="text" placeholder="请输入用户名"  /></td>
        </tr>
        <tr>
        	<td class="line1"><img src="loginImage/index/u28.png" /></td>
            <td class="line2"><input name="password" type="password"  placeholder="请输入密码"  /></td>
        </tr>
        <tr>
        	<td class="line1"><img src="loginImage/index/u29.png" /></td>
            <td class="line2"><input name="confirm" type="password" placeholder="请再次输入密码"  /></td>
        </tr><tr>
        	<td class="line1"><img src="loginImage/index/u30.png" /></td>
            <td class="line2"><input name="email" type="email" placeholder="请输入邮箱"  /></td>
        </tr><tr>
        	<td class="line1"><img src="loginImage/index/u31.png" /></td>
            <td class="line2"><input name="phonenumber" type="number" placeholder="请输入手机号"  /></td>
        </tr>
        <tr>
        	<td class="line1"><img src="loginImage/index/u32.png" /></td>
            <td style="height:20px"><input name="text" type="text" placeholder="请输入验证码" style="width:40%; background-color:rgba(255,255,255,0.6); height:20px"  /><input type="button" style="width:30%; height:100%; mar" value="发送验证码" /></td>
        </tr>
	</table>
    </form>
</div>
</body>
</html>