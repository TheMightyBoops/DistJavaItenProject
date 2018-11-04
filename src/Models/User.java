package Models;

public class User {
    private final String ADMIN_PW = "admin";
    private String username;
    private String password;
    private boolean isAdmin=false;

    public User(String username, String password) {
        setUsername(username);
        setPassword(password);
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void checkIfAdmin(String passwordAttempt) {
        if(passwordAttempt.trim().equals(ADMIN_PW)) {
            isAdmin=true;
        }
    }

    public boolean isAdmin() {
        return isAdmin;
    }

    public void setAdmin(boolean admin) {
        isAdmin = admin;
    }

}
