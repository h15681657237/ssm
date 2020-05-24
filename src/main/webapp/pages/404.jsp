<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">




    <title>数据 - AdminLTE2定制版</title>
    <meta name="description" content="AdminLTE2定制版">
    <meta name="keywords" content="AdminLTE2定制版">




    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">


    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/iCheck/square/blue.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/morris/morris.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/datepicker/datepicker3.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/daterangepicker/daterangepicker.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/treeTable/jquery.treetable.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/treeTable/jquery.treetable.theme.default.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/select2/select2.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/bootstrap-markdown/css/bootstrap-markdown.min.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/adminLTE/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/ionslider/ion.rangeSlider.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/ionslider/ion.rangeSlider.skinNice.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/bootstrap-slider/slider.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.css">
</head>

<body class="hold-transition skin-purple sidebar-mini">

<div class="wrapper">


    <jsp:include page="/pages/head.jsp"></jsp:include>

    <jsp:include page="/pages/nav.jsp"></jsp:include>

    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                404 错误页面
            </h1>

            <ol class="breadcrumb">
                <li><a href="main.jsp"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li class="active">404 错误</li>
            </ol>

        </section>

        <!-- Main content -->
        <section class="content">
            <div class="error-page">
                <h2 class="headline text-yellow"> 404</h2>

                <div class="error-content">
                    <h3><i class="fa fa-warning text-yellow"></i> Oops! 页面没有找到.</h3>

                    <p>
                        没有找到你请求的页面, 你可以 <a href="${pageContext.servletContext.contextPath}/pages/main.jsp">返回到后台首页</a> 或者通过搜索查询
                    </p>

                    <form class="search-form">
                        <div class="input-group">
                            <input type="text" name="search" class="form-control" placeholder="搜索">

                            <div class="input-group-btn">
                                <button type="submit" name="submit" class="btn btn-warning btn-flat"><i class="fa fa-search"></i>
                                </button>
                            </div>
                        </div>
                        <!-- /.input-group -->
                    </form>
                </div>
                <!-- /.error-content -->
            </div>
            <!-- /.error-page -->
        </section>
        <!-- /.content -->
    </div>

    <jsp:include page="/pages/foot.jsp"></jsp:include>

</div>


<script src="${pageContext.servletContext.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/jQueryUI/jquery-ui.min.js"></script>
<script>
    $.widget.bridge('uibutton', $.ui.button);
</script>
<script src="${pageContext.servletContext.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/raphael/raphael-min.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/morris/morris.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/sparkline/jquery.sparkline.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/knob/jquery.knob.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/daterangepicker/moment.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/daterangepicker/daterangepicker.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/daterangepicker/daterangepicker.zh-CN.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/datepicker/bootstrap-datepicker.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/fastclick/fastclick.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/iCheck/icheck.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/adminLTE/js/app.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/treeTable/jquery.treetable.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/select2/select2.full.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/bootstrap-markdown/js/bootstrap-markdown.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/bootstrap-markdown/locale/bootstrap-markdown.zh.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/bootstrap-markdown/js/markdown.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/bootstrap-markdown/js/to-markdown.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/ckeditor/ckeditor.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/input-mask/jquery.inputmask.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/input-mask/jquery.inputmask.extensions.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/datatables/dataTables.bootstrap.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/chartjs/Chart.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/flot/jquery.flot.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/flot/jquery.flot.resize.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/flot/jquery.flot.pie.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/flot/jquery.flot.categories.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/ionslider/ion.rangeSlider.min.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/bootstrap-slider/bootstrap-slider.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.js"></script>
<script src="${pageContext.servletContext.contextPath}/plugins/bootstrap-datetimepicker/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<script>
    $(document).ready(function() {
        // 选择框
        $(".select2").select2();

        // WYSIHTML5编辑器
        $(".textarea").wysihtml5({
            locale: 'zh-CN'
        });
    });


    // 设置激活菜单
    function setSidebarActive(tagUri) {
        var liObj = $("#" + tagUri);
        if (liObj.length > 0) {
            liObj.parent().parent().addClass("active");
            liObj.addClass("active");
        }
    }


    $(document).ready(function() {
        // 激活导航位置
        setSidebarActive("admin-index");
    });
</script>
</body>
</html>

