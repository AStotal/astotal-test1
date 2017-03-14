<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%-- Webjars --%>
    <link rel='stylesheet' href='<c:url value="/webjars/bootstrap/3.1.0/css/bootstrap.min.css"/>'/>
    <link rel='stylesheet' href='<c:url value="/webjars/bootstrap-select/1.12.0/css/bootstrap-select.min.css"/>'/>
    <script type='text/javascript' src='<c:url value="/webjars/jquery/2.2.4/jquery.min.js"/>'></script>
    <script type='text/javascript' src='<c:url value="/webjars/bootstrap/3.1.0/js/bootstrap.min.js"/>'></script>
    <script type='text/javascript'
            src='<c:url value="/webjars/bootstrap-select/1.12.0/js/bootstrap-select.min.js"/>'></script>

    <%-- Local styles and scripts --%>
    <script type='text/javascript' src='../../resources/js/index.js'></script>
    <link rel='stylesheet' href='../../resources/css/index.css'/>

    <%-- Delete when finish --%>
    <link rel='stylesheet' href='../../resources/css/bootstrap.css'/>
</head>
<body>


<div class="col-sm-offset-3 col-sm-6">
    <div class="modal-header">
        <h4 class="modal-title">User data</h4>
    </div>
    <div class="modal-body">
        <table class="table table-stripped">
            <tr>
                <td class="col-md-2">ID</td>
                <td class="col-md-2">${user.id}</
            </tr>

            <tr>
                <td>Username</td>
                <td>${user.name}</td>
            </tr>
            <tr>
                <td>Age</td>
                <td>${user.age}</td>
            </tr>
            <tr>
                <td>Admin privileges</td>
                <td><span class="glyphicon glyphicon-${user.admin ? 'ok' : 'remove'}"></span></td>
            </tr>
            <tr>
                <td>Created</td>
                <td><fmt:formatDate value="${user.createdDate}" type="both"/></td>
            </tr>
        </table>
    </div>

    <div class="modal-footer">
        <a class="btn btn-default" href="/users">OK</a>
    </div>
</div>
</body>
</html>
