<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">


    <title>
       注册页面</title>


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

    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/iCheck/square/blue.css">
</head>
<script>
    path='${pageContext.request.contextPath}';
    function zhuce() {
        //判断是否注册成功
        var flag;
        //alert("aaa")
        var username=$("#username").val();
        var password=$("#password").val();
        var email=$("#email").val();
        var birthday=$("#birthday").val();
        if(username.trim()==""){
            alert("用户名不能为空");
            return false;
        }
        if(password.trim()==""){
            alert("密码不能为空");
            return false;
        }
        else{

            <%--查询用户名是否存在--%>
            $.ajax({
                method:'post',
                url:path+'/user/register_findByName',
                data:{"username":username},
                success:function (data) {
                    <%--用户名不存在--%>
                    //alert(JSON.stringify(data));
                    if(data.code==1){

                        //注册用户
                        $.ajax({
                            method:'post',
                            url:path+'/user/register_insertUser',
                            data:{"username":username,
                                    "password":password,
                                    "email":email,
                                    "birthda":birthday
                            },
                            success:function (data) {
                                //alert("insert---"+JSON.stringify(data))
                                if(data.code==1){
                                    flag=true;
                                    //alert("flag=true")
                                }
                                else{
                                    flag=false;
                                    alert("flag=false")
                                }

                               // alert("flag的值是："+flag)
                                if(flag==true){
                                    alert("注册成功！");
                                    window.location.href=path+"/pages/login.jsp";
                                }
                                else {
                                    alert('注册失败!');
                                    window.history.go(0);
                                }
                            },
                            error:function () {
                                alert("注册时出现错误！");
                            }
                        });

                    }
                        <%--用户名已存在--%>
                    else{
                        alert('用户名已存在');

                    }
                },
                error:function () {
                    alert("未能成功查询此用户名是否可用！");
                }
            });


        }
    }
</script>

<body class="hold-transition register-page">
<div class="register-box">
    <div class="register-logo">


        <a href="all-admin-index.html"><b>数据</b>管理系统</a>


    </div>

    <div class="register-box-body">
        <p class="login-box-msg">新用户注册</p>

        <form <%--method="post" onsubmit="return form_submit()"--%>>
            <div class="form-group has-feedback">
                <input id="username" type="text" class="form-control" name="username" placeholder="用户名">
                <span class="glyphicon glyphicon-user form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input id="email" type="email" class="form-control" placeholder="Email">
                <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input id="password" type="password" class="form-control" placeholder="密码">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                    <input id="birthday" type='date' class="form-control" />
                    <span class="glyphicon glyphicon-calendar form-control-feedback"></span>
            </div>
            <%--<div class="form-group has-feedback">
                <input type="password" class="form-control" placeholder="确认密码">
                <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
            </div>--%>
            <div class="row">
                <div class="col-xs-8">
                    <div class="checkbox icheck">
                        <label>
                            <input type="checkbox"> 我同意 <a href="#">协议</a>
                        </label>
                    </div>
                </div>
                <!-- /.col -->
                <div class="col-xs-4">
                    <button id="register" onclick="zhuce()" type="button" class="btn btn-primary btn-block btn-flat">注册</button>
                </div>
                <!-- /.col -->
            </div>
        </form>


        <a href="login.jsp" class="text-center">我有账号，现在就去登录</a>
    </div>
    <!-- /.form-box -->
</div>
<!-- /.register-box -->

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
