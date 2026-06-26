package model;

public class Profile {

    private String studentid;
    private String fullname;
    private String program;
    private String email;
    private String hobbies;
    private String bio;

    public String getStudentid() { return studentid; }
    public void setStudentid(String studentid) { this.studentid = studentid; }

    public String getFullname() { return fullname; }
    public void setFullname(String fullname) { this.fullname = fullname; }

    public String getProgram() { return program; }
    public void setProgram(String program) { this.program = program; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getHobbies() { return hobbies; }
    public void setHobbies(String hobbies) { this.hobbies = hobbies; }

    public String getBio() { return bio; }
    public void setBio(String bio) { this.bio = bio; }
}