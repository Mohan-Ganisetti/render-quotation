<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<table border="1">
    <thead>
        <tr>
            <th>Material Type</th>
            <th>Items</th>
        </tr>
    </thead>
    <tbody>
    <c:forEach var="med" items="${FindAll}">
        <c:forEach var="entry" items="${med.entry}">
            <tr>
                <td>${entry.key}</td>
                <td>
                    <c:forEach var="item" items="${entry.value}">
                        ${item}<br/>
                    </c:forEach>
                </td>
            </tr>
        </c:forEach>
    </c:forEach>
    </tbody>
</table>
