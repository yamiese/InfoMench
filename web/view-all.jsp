<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>View All Profiles</title>
    <link rel="stylesheet" href="view-all.css">
</head>

<body>

<div class="header">InfoMensch</div>

<div class="container">

    <h2>All Student Profiles</h2>
    
        <form action="ProfileController" method="get" class="compare-box">

            <select name="id1" required>
                <option value="">Select Student 1</option>

                <c:forEach var="p" items="${list}">
                    <option value="${p.studentid}">
                        ${p.fullname} (${p.studentid})
                    </option>
                </c:forEach>
            </select>

            <select name="id2" required>
                <option value="">Select Student 2</option>

                <c:forEach var="p" items="${list}">
                    <option value="${p.studentid}">
                        ${p.fullname} (${p.studentid})
                    </option>
                </c:forEach>
            </select>

            <input type="hidden" name="action" value="compare">

            <button type="submit" class="btn">
                Compare Profiles
            </button>

        </form>
    
    <table>
        <tr>
            <th>Student ID</th>
            <th>Name</th>
            <th>Program</th>
            <th>Email</th>
        </tr>

        <c:forEach var="p" items="${list}">
            <tr>
                <td>${p.studentid}</td>
                <td>${p.fullname}</td>
                <td>${p.program}</td>
                <td>${p.email}</td>

                <td>
                    <a href="ProfileController?view=${p.studentid}" class="btn">
                        View Profile
                    </a>
                </td>
            </tr>
        </c:forEach>

    </table>

    
    <div style="margin-top: 25px; text-align: center;">
        <a href="index.jsp" class="btn">Create New Profile</a>
    </div>

</div>

</body>
</html>