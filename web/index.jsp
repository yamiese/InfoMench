<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Profile Form</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">  
    <link rel="stylesheet" href="styleInfoMench.css">
</head>
<body>

<div class="header">InfoMensch</div>

<div class="container">

    <h2>Enter Your Information</h2>

    <form action="ProfileController" method="post">
       
        <div class="field">
            <label>Full Name</label>
            <input type="text" name="fullname" value="${fullname}">
            <small style="color:red">${fullnameErr}</small>
        </div>
      
        <div class="field">
            <label>Student ID</label>
            <input type="text" name="studentid" value="${studentid}">
            <small style="color:red">${studentidErr}</small>
        </div>

        <div class="field">
            <label>Program</label>
            <input type="text" name="program" value="${program}">
            <small style="color:red">${programErr}</small>
        </div>

        <div class="field">
            <label>Email</label>
            <input type="text" name="email" value="${email}">
            <small style="color:red">${emailErr}</small>
        </div>

        <div class="field">
            <label>Hobbies</label>
            <input type="text" name="hobbies" value="${hobbies}">
            <small style="color:red">${hobbiesErr}</small>
        </div>

        <div class="field">
            <label>Biography</label>
            <textarea name="bio">${bio}</textarea>
            <small style="color:red">${bioErr}</small>
        </div>

        <input type="submit" value="Create Profile">

    </form>

</div>

</body>
</html>