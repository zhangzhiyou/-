package model;

/**
 * Created by zhiyou on 15-7-3.
 */
public class Jiaocaike {
    private String username3;
    private String password3;

    public Jiaocaike(){
        super();
    }
    public Jiaocaike(String username3,String password3){
        this.username3=username3;
        this.password3=password3;
    }
    public String getUsername3() {
        return username3;
    }

    public void setUsername3(String username3) {
        this.username3 = username3;
    }

    public String getPassword3() {
        return password3;
    }

    public void setPassword3(String password3) {
        this.password3 = password3;
    }
}
