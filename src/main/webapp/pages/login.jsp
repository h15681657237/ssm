<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">


    <title></title>


    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.6 -->
    <!-- Font Awesome -->
    <!-- Ionicons -->
    <!-- Theme style -->
    <!-- iCheck -->
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <link rel="icon" href="${pageContext.servletContext.contextPath}/img/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/iCheck/square/blue.css">
    <script src="${pageContext.servletContext.contextPath}/js/jquery-3.4.1.js"></script>
</head>

<script>
    var code;
    path='${pageContext.request.contextPath}';
    $(function () {

        //登录
        $("#button").click(function () {
            var username=$("#username").val();
            var password=$("#password").val();
            var verifycode=$("#verifycode").val();
            if(username.trim()==null||username.trim()==""){
                alert("用户名不能为空")
                return
            }
            if(password.trim()==null||password.trim()==""){
                alert("密码不能为空")
                return
            }
            if(verifycode.trim()==null||verifycode.trim()==""){
                alert("验证码不能为空")
                return
            }
            /*if(verifycode.trim()!='${sessionScope.verifyCode}'){
                alert("验证码错误")
                return
            }*/
            //验证验证码
            $.ajax({
                url:path+'/util/getcode',
                method:'post',
                success:function (data) {
                    //alert(code);
                    code=data;
                },
                //type:"text"
            })

            if(verifycode.trim()!=code){
                alert("验证码错误")
                return
            }
            $.ajax({
                url:path+'/login',
                method:'post',
                data:{"username":username,"password":password},
                success:function (data) {
                    //alert(JSON.stringify(data));
                    if(data.code==1){
                        window.location.href=path+data.info['url']
                    }
                    else {
                        alert(data.info["msg"])
                    }
                },
                error:function () {
                    alert("登陆失败！");
                }
            })
        });
        $("#username").blur(function () {
            var username=$(this).val();
            if(username.trim()==null||username.trim()==""){
                alert("用户名不能为空")
            }
        });
        $("#password").blur(function () {
            var password=$(this).val();
            if(password.trim()==null||password.trim()==""){
                alert("密码不能为空")
            }
        });
    });
    function code() {
        $("#code").attr("src","${pageContext.servletContext.contextPath}/util/verifycode"+"?time="+new Date().getTime())
    }
</script>

<body class="hold-transition login-page">
<div class="login-box">
    <div class="login-logo">


        <a href="all-admin-index.html"><b>数据</b>后台管理系统</a>


    </div>
    <!-- /.login-logo -->
    <div class="login-box-body">
        <p class="login-box-msg">登录系统</p>

        <form action="main.jsp" method="get" class="form">
            <div class="form-group has-feedback">
                <input type="text" id="username" class="form-control" placeholder="用户名">
                <span class="glyphicon glyphicon-user form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="password" id="password" class="form-control" placeholder="密码">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="form-group">
                <input type="text" id="verifycode" class="form-control" placeholder="密码" style="width: 120px;display: inline">
                <span style="margin-left: 65px"><img id="code" onclick="code()" src="${pageContext.servletContext.contextPath}/util/verifycode"></span>
            </div>
            <div class="row">
                <%--<div class="col-xs-8">
                    <div class="checkbox icheck">
                        <label><input type="checkbox"> 记住 下次自动登录</label>
                    </div>
                </div>--%>
                <!-- /.col -->
                <div class="col-xs-4 col-xs-offset-8">
                    <button id="button" type="button" class="btn btn-primary btn-block btn-flat">登录</button>
                </div>
                <!-- /.col -->
            </div>
        </form>


        <!-- /.social-auth-links -->

        <a href="#">忘记密码</a><br>
        <a href="${pageContext.request.contextPath}/pages/register.jsp" class="text-center">新用户注册</a>

    </div>
    <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<!-- jQuery 2.2.3 -->
<!-- Bootstrap 3.3.6 -->
<!-- iCheck -->
<script src="${pageContext.servletContext.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/iCheck/icheck.min.js"></script>
<script>
    $(function() {
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' // optional
        });
    });
</script>
</body>

</html>
