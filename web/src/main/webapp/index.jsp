<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <!-- Bootstrap框架必需配置 -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>TL-CODE-GENERATOR</title>
    <!-- Bootstrap 样式 -->
    <link href="${ctx}/libs/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="all">
</head>
<body>
<!-- 顶部固定导航 -->
<nav class="navbar navbar-default navbar-fixed-top navbar-inverse">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand">TL-CODE-GENERATOR</a>
            <span class="icon-bar"></span>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a>代码生成</a></li>
            </ul>
        </div>
    </div>
</nav>
<!-- 主体内容 -->
<div style="margin-top:50px">
    <iframe id="icontent" width="100%" height="100%" src="${ctx}/view/generator.jsp"></iframe>
</div>
<!-- jquery core -->
<script src="${ctx}/libs/jquery/jquery-1.11.3.min.js"></script>
<!-- Bootstrap core -->
<script src="${ctx}/libs/bootstrap/js/bootstrap.min.js"></script>
<!-- javascript functions -->
<script type="text/javascript">

    /*文档初始化完成*/
    $(document).ready(function () {
    });

</script>
</body>
</html>