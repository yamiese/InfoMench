package dao;

import model.Profile;
import java.sql.*;
import java.util.*;

public class ProfileDAO {

    private String url = "jdbc:mysql://localhost:3306/infomensch";
    private String user = "root";
    private String pass = "";

    private Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(url, user, pass);
    }

    public void insert(Profile p) {
        String sql = "INSERT INTO student (studentid, fullname, program, email, hobbies, bio) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, p.getStudentid());
            ps.setString(2, p.getFullname());
            ps.setString(3, p.getProgram());
            ps.setString(4, p.getEmail());
            ps.setString(5, p.getHobbies());
            ps.setString(6, p.getBio());

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Profile> getAll() {
        List<Profile> list = new ArrayList<>();

        String sql = "SELECT * FROM student";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Profile p = new Profile();
                p.setStudentid(rs.getString("studentid"));
                p.setFullname(rs.getString("fullname"));
                p.setProgram(rs.getString("program"));
                p.setEmail(rs.getString("email"));
                p.setHobbies(rs.getString("hobbies"));
                p.setBio(rs.getString("bio"));
                list.add(p);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
    
    public Profile getByStudentId(String studentid) {

        Profile p = null;

        String sql = "SELECT * FROM student WHERE studentid = ?";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, studentid);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                p = new Profile();
                p.setStudentid(rs.getString("studentid"));
                p.setFullname(rs.getString("fullname"));
                p.setProgram(rs.getString("program"));
                p.setEmail(rs.getString("email"));
                p.setHobbies(rs.getString("hobbies"));
                p.setBio(rs.getString("bio"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return p;
    }
}