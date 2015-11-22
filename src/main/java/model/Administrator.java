package model;

/**
 * Created by zhiyou on 15-11-21.
 */
public class Administrator {
    private int id;
    private String username;
    private String password;

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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Administrator(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public Administrator() {
        super();
    }
}
