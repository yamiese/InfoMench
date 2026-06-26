<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Compare Profiles</title>
    <link rel="stylesheet" href="view-all.css">
</head>

<body>

<div class="header">Profile Comparison</div>

<div class="container">

<table class="compare-table">

    <thead>
        <tr>
            <th>Field</th>
            <th class="a-header">Student A</th>
            <th class="b-header">Student B</th>
        </tr>
    </thead>

    <tbody>
        <tr>
            <td>Name</td>
            <td class="a">${p1.fullname}</td>
            <td class="b">${p2.fullname}</td>
        </tr>

        <tr>
            <td>Program</td>
            <td class="a">${p1.program}</td>
            <td class="b">${p2.program}</td>
        </tr>

        <tr>
            <td>Email</td>
            <td class="a">${p1.email}</td>
            <td class="b">${p2.email}</td>
        </tr>

        <tr>
            <td>Hobbies</td>
            <td class="a">${p1.hobbies}</td>
            <td class="b">${p2.hobbies}</td>
        </tr>

        <tr>
            <td>Biography</td>
            <td class="a">${p1.bio}</td>
            <td class="b">${p2.bio}</td>
        </tr>
    </tbody>

</table>
        
        <div style="text-align:center; margin-top:20px;">
            <a href="ProfileController" class="btn">
                 Back
            </a>
        </div>

</div>

</body>
</html>