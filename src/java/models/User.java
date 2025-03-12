package models;


public class User {

    private int userId;
    private String password;
    private String fullName;
    private String avatar;
    private String phone;
    private String email;
    private String address;
    private String role; 
    private boolean active; 
   

    public User() {
    }
    
    

    public User(String username, String password, String fullName,
              String avatar, String phone, 
            String email, String address, String role, boolean active) {
        this.password = password;
        this.fullName = fullName;
        this.avatar = avatar;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.role = role;
        this.active = active;
    }

    

    // Getters and Setters
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

   

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }


    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public boolean isActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    
    
}
