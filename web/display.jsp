<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Profile Card</title>

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="styleInfoMench.css">
</head>

<body>

<div class="header">InfoMensch</div>

<div class="card">

    <h1>${profile.fullname}</h1>

    <p><strong>Student ID</strong> <span>${profile.studentid}</span></p>
    <p><strong>Program</strong> <span>${profile.program}</span></p>
    <p><strong>Email</strong> <span>${profile.email}</span></p>
    <p><strong>Hobbies</strong> <span>${profile.hobbies}</span></p>

    <div class="bio">
        ${profile.bio}
    </div>

    <!-- Navigation Buttons -->
    <div style="margin-top: 25px; display: flex; gap: 10px; justify-content: center;">

        <a href="ProfileController" class="btn-secondary">
            View All Profiles
        </a>

        <a href="index.jsp" class="btn-secondary">
            Create New Profile
        </a>

    </div>

</div>

</body>
</html>