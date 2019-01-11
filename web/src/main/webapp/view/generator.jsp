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
<!-- 主体内容 -->
<div>
    <form action="${ctx}/core/generate.do">
        <table>
            <tr>
                <td>包名：</td>
                <td><input type="text" name="packageName"></td>
            </tr>
            <tr>
                <td>实体类名：</td>
                <td><input type="text" name="className"/></td>
            </tr>
            <tr>
                <td>数据库表名：</td>
                <td><input type="text" name="tableName"/></td>
            </tr>
            <tr>
                <td>字段类型：</td>
                <td><input type="text" name="fieldType"/></td>
            </tr>
            <tr>
                <td>字段名称：</td>
                <td><input type="text" name="fieldName"/></td>
            </tr>
            <tr>
                <td>字段类型：</td>
                <td><input type="text" name="fieldType"/></td>
            </tr>
            <tr>
                <td>字段名称：</td>
                <td><input type="text" name="fieldName"/></td>
            </tr>
        </table>
        <button type="submit">提交</button>
    </form>
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