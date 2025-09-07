<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Saved Materials</title>
</head>
<body>

<c:if test="${not empty medical}">
    <h3>Saved Materials:</h3>
    <table border="1" cellpadding="5">
        <tr>
            <th>Material Type</th>
            <th>Material</th>
            <th>Action</th>
        </tr>

        <!-- Loop over all Medicals objects -->
        <c:forEach var="med" items="${medical}">
            <!-- Loop over the map inside each Medicals -->
            <c:forEach var="entry" items="${med.entry}">
                <!-- Loop over the list of items for each type -->
                <c:forEach var="item" items="${entry.value}">
                    <tr>
                        <td>${entry.key}</td>
                        <td>${item}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/delete?type=${entry.key}&item=${item}"> Delete</a>
                                                    
                        </td>
                    </tr>
                </c:forEach>
            </c:forEach>
        </c:forEach>

    </table>
</c:if>

<c:if test="${not empty message}">
    <p style="color:green">${message}</p>
</c:if>

</body>
</html>
