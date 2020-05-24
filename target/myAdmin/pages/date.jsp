<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<script src="../js/jquery-3.4.1.js"></script>
<script>
    $(function () {
        $("#submit").click(function () {
            alert($("#date").val());
            $("#text").attr("src","${pageContext.servletContext.contextPath}/user/date")
        });

        $("#button").click(function () {
            $.ajax({
                url:'${pageContext.servletContext.contextPath}'+"/user/date",
                method:"post",
                success:function (data) {
                    //alert(data)
                    $("#text").val(data)
                },
                error:function (data) {
                    alert(data)
                }
            })
        })
    })
</script>
<body>

<form action="${pageContext.servletContext.contextPath}/user/date">
    <input id="date" type="date" name="birthday">

    <input id="submit" type="submit" value="提交">
</form>
<input id="text" type="text" readonly="true"/>
<button id="button" type="button">接受数据</button>
</body>
</html>
