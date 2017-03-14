<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<div class="col-sm-offset-2 col-sm-8">
    <div class="modal-header">
        <h4 class="modal-title">${userForm['new'] ? 'Add new user' : 'Update user'}</h4>
    </div>
    <form:form action="/users" method="post" modelAttribute="userForm" commandName="userForm"
               class="form-horizontal">

        <div class="modal-body">
            <c:if test="${!userForm['new']}">
                <div class="form-group">
                    <label for="usrID" class="col-sm-3 control-label">ID</label>
                    <div class="col-sm-6">
                        <form:input type="text" cssClass="form-control" id="usrID" disabled="true" path="id"/>
                        <form:hidden path="id"/>
                    </div>
                </div>
            </c:if>
            <div class="form-group">
                <label for="usrName" class="col-sm-3 control-label">User name</label>
                <div class="col-sm-6">
                    <form:input type="text" path="name" cssClass="form-control" id="usrName"
                                placeholder="Username"/>
                    <span class="label label-danger"><form:errors path="name"/></span>
                </div>
            </div>
            <div class="form-group">
                <label for="usrAge" class="col-sm-3 control-label">Age</label>
                <div class="col-sm-6">
                    <form:input type="text" path="age" class="form-control" id="usrAge" placeholder="Age"/>
                    <span class="label label-danger"><form:errors path="age"/></span>
                </div>
            </div>
            <div class="form-group">
                <div id="usrAdmin" class="btn-group col-sm-offset-3 col-sm-6">
                    <div type="checkbox" class="btn ${userForm.admin ? 'btn-success' : 'btn-danger'}" id="isAdminLink"
                         onclick="toggleAdmin()">
                        <form:checkbox path="admin" id="adminCheckbox" cssClass="invisible"/>
                        <span class="glyphicon glyphicon-${userForm.admin ? 'ok' : 'remove'}" id="isAdminIcon"></span>
                        <b>Admin permissions</b>
                    </div>

                </div>
            </div>

        </div>
        <div class="modal-footer">
            <button type="submit" class="btn btn-default">${userForm['new'] ? 'Add' : 'Update'}</button>
            <a class="btn btn-default" href="/users">Cancel</a>
        </div>

    </form:form>
</div>
</body>
</html>
