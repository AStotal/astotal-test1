<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Database</title>

    <%-- Webjars --%>
    <link rel='stylesheet' href='<c:url value="/webjars/bootstrap/3.1.0/css/bootstrap.min.css"/>'/>
    <link rel='stylesheet' href='<c:url value="/webjars/bootstrap-select/1.12.0/css/bootstrap-select.min.css"/>'/>
    <script type='text/javascript' src='<c:url value="/webjars/jquery/2.2.4/jquery.min.js"/>'></script>
    <script type='text/javascript' src='<c:url value="/webjars/bootstrap/3.1.0/js/bootstrap.min.js"/>'></script>
    <script type='text/javascript'
            src='<c:url value="/webjars/bootstrap-select/1.12.0/js/bootstrap-select.min.js"/>'></script>

    <%-- Local styles and scripts --%>
    <script type='text/javascript' src='/resources/js/index.js'></script>
    <link rel='stylesheet' href='/resources/css/index.css'/>

    <%-- Delete when finish --%>
    <link rel='stylesheet' href='/resources/css/bootstrap.css'/>

</head>
<body>

<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="/users">User database</a>
        </div>
        <c:url value="/users/search" var="actionSearch"/>
        <form action="${actionSearch}" method="get" class="navbar-form navbar-left" role="search">
            <c:url value="/users/add" var="actionAdd"/>
            <a class="btn btn-default" href="${actionAdd}" id="addUserButton">Add user</a>
            <div class="form-group">
                <select class="selectpicker" name="searchBy">
                    <optgroup label="Search parameter">
                        <option ${searchBy == 'id' ? 'selected' : ''} value="id">By ID</option>
                        <option ${searchBy == 'name' ? 'selected' : ''} value="name">By name</option>
                        <option ${searchBy == 'age' ? 'selected' : ''} value="age">By age</option>
                        <option ${searchBy == 'older' ? 'selected' : ''} value="older">Older than</option>
                        <option ${searchBy == 'younger' ? 'selected' : ''} value="younger">Younger than</option>
                    </optgroup>
                </select>

            </div>
            <div class="form-group">
                <input name="searchString" type="text" size="50" class="form-control" placeholder="Search" value="${!empty searchString ? searchString : ''}"/>
            </div>
            <button type="submit" class="btn btn-default">Search</button>
        </form>
        <ul class="nav navbar-nav navbar-right">
            <c:choose>
                <c:when test="${!empty currentPage}">
                    <c:url value="/users/page/${currentPage-1}-10" var="prevPage"/>
                    <li class="${currentPage == 1 ? 'disabled':''}"><a
                            href="${currentPage == 1 ? '#': prevPage}"><span
                            class="glyphicon glyphicon-chevron-left"></span></a></li>

                    <c:url value="/users" var="usersPage"/>
                    <li><a href="${usersPage}" title="Show full list"><b>${currentPage}</b></a></li>

                    <c:url value="/users/page/${currentPage+1}-10" var="nextPage"/>
                    <li class="${!hasUsers ? 'disabled':''}"><a href="${!hasUsers ? '#' : nextPage}"><span
                            class="glyphicon glyphicon-chevron-right"></span></a></li>
                </c:when>
                <c:otherwise>
                    <c:url value="/users/page/1-10" var="showPages"/>
                    <li><a href="${showPages}"><b>Show by page</b></a></li>
                </c:otherwise>
            </c:choose>
        </ul>
    </div>
</nav>

<c:if test="${!empty listUsers}">
    <c:url value="/users/add" var="actionAdd"/>
    <form:form action="${actionAdd}" modelAttribute="user">
        <table class="table table-stripped">
            <tr>
                <th class="col-md-1">ID</th>
                <th class="col-md-4">Username</th>
                <th class="col-md-1">Age</th>
                <th class="col-md-1 text-center">Is admin</th>
                <th class="col-md-2">Created</th>
                <th class="col-md-2 text-center">Action</th>
            </tr>

            <c:forEach items="${listUsers}" var="user">
                <tr>
                    <td>${user.id}</td>
                    <td>${user.name}</td>
                    <td>${user.age}</td>
                    <td class="text-center">
                        <span class="glyphicon glyphicon-${user.admin ? 'ok' : 'remove'}"></span>
                    </td>
                    <td><fmt:formatDate value="${user.createdDate}" type="both"/></td>
                    <td class="text-center">
                        <a class="btn btn-info" href="<c:url value='/userdata/${user.id}'/>" >
                            <span class="glyphicon glyphicon-info-sign"></span>
                        </a>
                        <a class="btn btn-warning" href="<c:url value='/edit/${user.id}'/>">
                            <span class="glyphicon glyphicon-pencil"></span>
                        </a>
                        <a class="btn btn-danger" href="<c:url value='/remove/${user.id}'/>">
                            <span class="glyphicon glyphicon-remove"></span>
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </form:form>
</c:if>
</body>
</html>
