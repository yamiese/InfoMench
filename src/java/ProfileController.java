import java.io.IOException;
import java.util.List;
import java.util.regex.Pattern;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.ProfileDAO;
import model.Profile;

@WebServlet("/ProfileController")
public class ProfileController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // get parameter
        String fullname = request.getParameter("fullname");
        String studentid = request.getParameter("studentid");
        String program = request.getParameter("program");
        String email = request.getParameter("email");
        String hobbies = request.getParameter("hobbies");
        String bio = request.getParameter("bio");

        // trim input
        if (fullname != null) fullname = fullname.trim();
        if (studentid != null) studentid = studentid.trim();
        if (program != null) program = program.trim();
        if (email != null) email = email.trim();
        if (hobbies != null) hobbies = hobbies.trim();
        if (bio != null) bio = bio.trim();

        // email pattern
        String emailRegex = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$";

        // validation flag
        boolean valid = true;

        String fullnameErr = "";
        String studentidErr = "";
        String programErr = "";
        String emailErr = "";
        String hobbiesErr = "";
        String bioErr = "";

        // validation
        if (fullname == null || fullname.isEmpty()) {
            fullnameErr = "Full name is required";
            valid = false;
        }

        if (studentid == null || studentid.isEmpty()) {
            studentidErr = "Student ID is required";
            valid = false;
        } else if (!studentid.matches("[0-9]{6,12}")) {
            studentidErr = "Student ID must be 6–12 digits";
            valid = false;
        }

        if (program == null || program.isEmpty()) {
            programErr = "Program is required";
            valid = false;
        }

        if (email == null || email.isEmpty()) {
            emailErr = "Email is required";
            valid = false;
        } else if (!Pattern.matches(emailRegex, email)) {
            emailErr = "Invalid email format";
            valid = false;
        }

        if (hobbies == null || hobbies.isEmpty()) {
            hobbiesErr = "Hobbies are required";
            valid = false;
        } else if (hobbies.length() < 3) {
            hobbiesErr = "Please enter at least 3 characters";
            valid = false;
        }

        if (bio == null || bio.isEmpty()) {
            bioErr = "Bio is required";
            valid = false;
        } else if (bio.length() < 10) {
            bioErr = "Bio must be at least 10 characters";
            valid = false;
        }

        // if invalid
        if (!valid) {

            request.setAttribute("fullname", fullname);
            request.setAttribute("studentid", studentid);
            request.setAttribute("program", program);
            request.setAttribute("email", email);
            request.setAttribute("hobbies", hobbies);
            request.setAttribute("bio", bio);

            request.setAttribute("fullnameErr", fullnameErr);
            request.setAttribute("studentidErr", studentidErr);
            request.setAttribute("programErr", programErr);
            request.setAttribute("emailErr", emailErr);
            request.setAttribute("hobbiesErr", hobbiesErr);
            request.setAttribute("bioErr", bioErr);

            request.getRequestDispatcher("index.jsp").forward(request, response);
            return;
        }

        // save to db
        Profile p = new Profile();
        p.setStudentid(studentid);
        p.setFullname(fullname);
        p.setProgram(program);
        p.setEmail(email);
        p.setHobbies(hobbies);
        p.setBio(bio);

        ProfileDAO dao = new ProfileDAO();
        dao.insert(p);

        // send to display page
        request.setAttribute("profile", p);
        request.getRequestDispatcher("display.jsp").forward(request, response);
    }

    // view all profile
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ProfileDAO dao = new ProfileDAO();

        String action = request.getParameter("action");
        String viewId = request.getParameter("view");

        // CASE 1: COMPARE
        if ("compare".equals(action)) {

            String id1 = request.getParameter("id1");
            String id2 = request.getParameter("id2");

            Profile p1 = dao.getByStudentId(id1);
            Profile p2 = dao.getByStudentId(id2);

            request.setAttribute("p1", p1);
            request.setAttribute("p2", p2);

            request.getRequestDispatcher("compare.jsp").forward(request, response);
            return;
        }

        // CASE 2: VIEW SINGLE
        if (viewId != null) {

            Profile p = dao.getByStudentId(viewId);

            if (p == null) {
                response.getWriter().println("Profile not found!");
                return;
            }

            request.setAttribute("profile", p);
            request.getRequestDispatcher("display.jsp").forward(request, response);
            return;
        }

        // CASE 3: VIEW ALL
        List<Profile> list = dao.getAll();

        request.setAttribute("list", list);
        request.getRequestDispatcher("view-all.jsp").forward(request, response);
    }
}