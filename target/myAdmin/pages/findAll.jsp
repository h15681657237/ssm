<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <link rel="stylesheet"
          href="${pageContext.servletContext.contextPath}/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/iCheck/square/blue.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/morris/morris.css">
    <link rel="stylesheet"
          href="${pageContext.servletContext.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/datepicker/datepicker3.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/daterangepicker/daterangepicker.css">
    <link rel="stylesheet"
          href="${pageContext.servletContext.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/treeTable/jquery.treetable.css">
    <link rel="stylesheet"
          href="${pageContext.servletContext.contextPath}/plugins/treeTable/jquery.treetable.theme.default.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/select2/select2.css">
    <link rel="stylesheet"
          href="${pageContext.servletContext.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.css">
    <link rel="stylesheet"
          href="${pageContext.servletContext.contextPath}/plugins/bootstrap-markdown/css/bootstrap-markdown.min.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet"
          href="${pageContext.servletContext.contextPath}/plugins/adminLTE/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/ionslider/ion.rangeSlider.css">
    <link rel="stylesheet"
          href="${pageContext.servletContext.contextPath}/plugins/ionslider/ion.rangeSlider.skinNice.css">
    <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/plugins/bootstrap-slider/slider.css">
    <link rel="stylesheet"
          href="${pageContext.servletContext.contextPath}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.css">
</head>
<%String path = request.getContextPath(); %>
<script src="<%=path %>/js/jquery-3.4.1.js"></script>
<script>
    path = '${pageContext.request.contextPath}';

    function del(id) {
        //alert(id)
        //alert($(this).attr('value'))
        $.ajax({
            url: path + '/user/deleteById?id=' + id,
            method: 'POST',
            //dataType:'text',
            success: function (data) {
                alert(data.msg + ":" + data.code + ":" + data.info['msg']);
                window.history.go(0);
            },
            error: function () {
                alert('删除失败')
            }
        })
    };

    var user_up;
    $(document).on("click", ".update", function () {
        //先查出部门信息
        // getDept("#empUpdateModal select");
        //查出empname
        //alert($(this).val())
        $("#updateMail").parent().removeClass("has-error");
        $("#updateAddress").parent().removeClass("has-error");
        getUser($(this).val());
        //弹出模态框
        $("#empUpdateModal").modal({
            backdrop: "static"
        });
    });

    function getUser(id) {
        $.ajax({
            url: path + '/user/findById_ajax',
            data: {"id": id},
            method: "post",
            success: function (user) {
                $("#updateMail").val(user.email);
                $("#updateAddress").val(user.address);
                user_up = user;
            },
            error: function () {
                alert("编辑失败");
            }
        })
    };

    $(document).on("click", "#updateButton", function () {
        //alert("#updateButton")

        var email = $("#updateMail").val();
        var address = $("#updateAddress").val();
        if (email.trim() == "" || address.trim() == "") {
            alert("信息不能为空")
            return false;
        }
        if (email == user_up.email && address == user_up.address) {
            $("#updateMail").parent().addClass("has-error");
            $("#updateAddress").parent().addClass("has-error");
            alert("用户名不能与原来相同")
        }
        /*不与原数据相同*/
        else {
            $.ajax({
                url: path + '/user/updateUser',
                data: {"id": user_up.id, "username": name, "address": address},
                method: "post",
                success: function (data) {
                    alert(data.info.msg)
                    window.history.go(0)
                },
                error: function () {
                    alert("修改失败")
                }
            })
        }

    });
    $(document).on("input", "#updateMail", function () {
        var email = $("#updateMail").val();
        var address = $("#updateAddress").val();
        if (email == user_up.email && address == user_up.address) {
            $("#updateMail").parent().addClass("has-error");
            $("#updateAddress").parent().addClass("has-error");
            //alert("用户名不能与原来相同")
        }
        if ($(this).val() != user_up.username) {
            $("#updateMail").parent().removeClass("has-error");
            $("#updateAddress").parent().removeClass("has-error");
        }
    });
    $(document).on("input", "#updateAddress", function () {
        var email = $("#updateMail").val();
        var address = $("#updateAddress").val();
        if (email == user_up.email && address == user_up.address) {
            $("#updateMail").parent().addClass("has-error");
            $("#updateAddress").parent().addClass("has-error");
            //alert("用户名不能与原来相同")
        }
        if ($(this).val() != user_up.email) {
            $("#updateMail").parent().removeClass("has-error");
            $("#updateAddress").parent().removeClass("has-error");
        }
    });

</script>
<body class="hold-transition skin-purple sidebar-mini">

<div class="wrapper">

    <!-- 页面头部 -->
    <jsp:include page="head.jsp"></jsp:include>
    <!-- 页面头部 /-->

    <!-- 导航侧栏 -->
    <jsp:include page="nav.jsp"></jsp:include>
    <!-- 导航侧栏 /-->

    <!-- 内容区域 -->
    <div class="content-wrapper">

        <!-- 内容头部 -->
        <section class="content-header">
            <h1>
                控制面板
                <small>首页</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="main.jsp"><i class="fa fa-dashboard"></i> 查看</a></li>
                <li class="active">查询所有</li>
            </ol>
        </section>
        <!-- 内容头部 /-->

        <!-- 正文区域 -->
        <section class="content">

            <%--修改模态框--%>
            <div id="empUpdateModal" class="modal fade" id="myModal" tabindex="-1" role="dialog"
                 aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                    aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">Modal title</h4>
                        </div>
                        <!-- 内容 -->
                        <form style="margin-left: 10px;">
                            <div class="form-group">
                                <label for="updateMail">邮箱</label>
                                <input type="text" class="form-control" id="updateMail" placeholder="Email">
                            </div>

                            <div class="form-group">
                                <label for="updateAddress">地址</label>
                                <input type="text" class="form-control" id="updateAddress" placeholder="Password">
                            </div>

                        </form>
                        <!-- 内容 -->
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                            <button id="updateButton" type="button" class="btn btn-primary">确定</button>
                        </div>
                    </div>
                </div>
            </div>

            <%--修改模态框--%>
            <!-- 待处理订单 -->

            <div class="box box-primary">
                <div class="box-header with-border">
                    <i class="fa fa-cube"></i>
                    <h3 class="box-title">人员信息</h3>
                </div>


                <div class="box-body">

                    <!-- 数据表格 -->
                    <div class="table-box">
                        <div class="table-responsive">
                            <!--数据列表-->
                            <table id="dataList" class="table table-bordered table-striped table-hover dataTable">
                                <thead>
                                <tr>
                                    <th>用户名</th>
                                    <th>年龄</th>
                                    <th>性别</th>
                                    <th>邮箱</th>
                                    <th>出生日期</th>
                                    <th>地址</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${pageInfo.list}" var="user">
                                    <tr>
                                        <td>${user.username}</td>
                                        <td>${user.age==null?"无":user.age}</td>
                                        <td>${user.sex==null?"无":user.sex}</td>
                                        <td>${user.email==null?"无":user.email}</td>
                                        <td>${user.birthday==null?"无":user.birthday}<%--<fmt:formatDate value="${user.birthday}" type="date" />--%> </td>
                                        <td>${user.address==null?"无":user.address}</td>
                                        <td>
                                            <c:if test="${sessionScope.user.username=='admin'}">
                                                <button class="btn btn-primary btn-sm update" value="${user.id}"
                                                        type="button">编辑
                                                </button>
                                                <button class="btn btn-danger btn-sm del" value="${user.id}"
                                                        type="button" onclick="del(${user.id})">
                                                    删除${user.id}</button>
                                            </c:if>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                            <!--数据列表/-->

                        </div>
                        <div class="col-md-3" STYLE="margin-top: 20PX">
                            <span>一共</span><a><span>${pageInfo.total}</span></a><span>记录，</span>
                            <span>共</span><a><span>${pageInfo.pages}</span></a><span>页</span>
                        </div>
                        <!-- 分页条 /-->
                        <div class="col-md-offset-6">
                            <nav aria-label="Page navigation">
                                <ul class="pagination">
                                    <c:if test="${!(pageInfo.hasPreviousPage)}">
                                        <li class="disabled">
                                            <a href="#">
                                                <span aria-hidden="true">&laquo</span>
                                            </a>
                                        </li>
                                    </c:if>
                                    <c:if test="${pageInfo.hasPreviousPage}">
                                        <li>
                                            <a href="${pageContext.request.contextPath}/user/findAll?pageNum=${pageInfo.pageNum-1}"
                                               aria-label="Previous">
                                                <span aria-hidden="true">&laquo;</span>
                                            </a>
                                        </li>
                                    </c:if>
                                    <c:forEach items="${pageInfo.navigatepageNums}" var="pageNum">
                                        <c:if test="${pageInfo.pageNum==pageNum}">
                                            <li class="active"><a href="#">${pageNum}</a></li>
                                        </c:if>
                                        <c:if test="${pageInfo.pageNum!=pageNum}">
                                            <li>
                                                <a href="${pageContext.request.contextPath}/user/findAll?pageNum=${pageNum}">${pageNum}</a>
                                            </li>
                                        </c:if>
                                    </c:forEach>
                                    <c:if test="${pageInfo.hasNextPage}">
                                        <li>
                                            <a href="${pageContext.request.contextPath}/user/findAll?pageNum=${pageInfo.pageNum+1}"
                                               aria-label="Next">
                                                <span aria-hidden="true">&raquo;</span>
                                            </a>
                                        </li>
                                    </c:if>
                                    <c:if test="${!pageInfo.hasNextPage}">
                                        <li class="disabled">
                                            <a href="#" aria-label="Next">
                                                <span aria-hidden="true">&raquo;</span>
                                            </a>
                                        </li>
                                    </c:if>
                                </ul>
                            </nav>
                        </div>

                    </div>
                </div>
                <!-- /.box-body -->

            </div>


        </section>
        <!-- 正文区域 /-->

    </div>
    <!-- 内容区域 /-->

    <!-- 底部导航 -->
    <jsp:include page="foot.jsp"></jsp:include>
    <!-- 底部导航 /-->

</div>


</body>
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
    $(document).ready(function () {
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


    $(document).ready(function () {
        // 激活导航位置
        setSidebarActive("admin-index");
    });
</script>
</html>
