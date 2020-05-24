<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="../img/user2-160x160.jpg" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
                <p>${sessionScope.user.username}</p>
                <a href="#"><i class="fa fa-circle text-success"></i> 在线</a>
            </div>
        </div>
        <!-- search form -->
        <form action="#" method="get" class="sidebar-form">
            <div class="input-group">
                <input type="text" name="q" class="form-control" placeholder="搜索...">
                <span class="input-group-btn">
								<button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
								</button>
							</span>
            </div>
        </form>
        <!-- /.search form -->


        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu">
            <li class="header">菜单</li>

            <li id="admin-index"><a href="${pageContext.servletContext.contextPath}/pages/main.jsp"><i class="fa fa-dashboard"></i> <span>首页</span></a></li>

            <!-- 菜单 -->



            <li class="treeview">
                <a href="#">
                    <i class="fa fa-folder"></i> <span>后台通用页面</span>
                    <span class="pull-right-container">
									<i class="fa fa-angle-left pull-right"></i>
								</span>
                </a>
                <ul class="treeview-menu">

                    <li id="admin-login">
                        <a href="${pageContext.servletContext.contextPath}/user/findAll">
                            <i class="fa fa-circle-o"></i> 查看所有
                        </a>
                    </li>

                    <li id="admin-register">
                        <a href="${pageContext.servletContext.contextPath}/pages/findById.jsp">
                            <i class="fa fa-circle-o"></i> 查询
                        </a>
                    </li>
                </ul>
            </li>



            <li class="treeview">
                <a href="#">
                    <i class="fa fa-pie-chart"></i> <span>图表Charts</span>
                    <span class="pull-right-container">
									<i class="fa fa-angle-left pull-right"></i>
								</span>
                </a>
                <ul class="treeview-menu">

                    <li id="charts-chartjs">
                        <a href="all-charts-chartjs.html">
                            <i class="fa fa-circle-o"></i> ChartJS
                        </a>
                    </li>

                    <li id="charts-morris">
                        <a href="all-charts-morris.html">
                            <i class="fa fa-circle-o"></i> Morris Charts
                        </a>
                    </li>

                    <li id="charts-flot">
                        <a href="all-charts-flot.html">
                            <i class="fa fa-circle-o"></i> Flot Charts
                        </a>
                    </li>

                    <li id="charts-inline">
                        <a href="all-charts-inline.html">
                            <i class="fa fa-circle-o"></i> Inline Charts
                        </a>
                    </li>

                </ul>
            </li>

            <li class="treeview">
                <a href="#">
                    <i class="fa fa-cogs"></i> <span>样例-系统管理</span>
                    <span class="pull-right-container">
									<i class="fa fa-angle-left pull-right"></i>
								</span>
                </a>
                <ul class="treeview-menu">

                    <li id="system-setting">
                        <a href="all-system-setting-edit.html">
                            <i class="fa fa-circle-o"></i> 系统设置
                        </a>
                    </li>

                </ul>
            </li>



            <!-- 菜单 /-->

            <!-- <li id="admin-documentation"><a href="documentation.html" target="_blank"><i class="fa fa-book"></i> <span>AdminLTE汉化文档</span></a></li> -->

        </ul>
    </section>
    <!-- /.sidebar -->
</aside>
