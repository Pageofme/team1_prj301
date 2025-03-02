package model;

public class User {
    private int id; 
    private String username; 
    private String email; 
    private String country; 
    private String role; 
    private boolean status; 
    private String password; 
    // Constructor mặc định
    public User(String id, String user,String email, String role){
    }

      // Constructor mặc định
      public User(int id1, String user, String string, String role1) {
      }

    // Constructor đầy đủ
    public User(int id, String username, String email, String country, String role, boolean status, String password) {
        this.id = id;
        this.username = username;
        this.email = email;
        this.country = country;
        this.role = role;
        this.status = status;
        this.password = password;
    }
    // Getter và Setter cho các thuộc tính
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getCountry() {
        return country;
    }
    public void setCountry(String country) {
        this.country = country;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    // Phương thức toString() để in đối tượng User
    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", email='" + email + '\'' +
                ", country='" + country + '\'' +
                ", role='" + role + '\'' +
                ", status=" + status +
                ", password='" + password + '\'' +
                '}';
    }
}

