
package models;

import java.sql.Timestamp;

public class Feedback {
     private int fback_id;
    private String fullName;
    private int rated_star;
    private String feedback_content;
    private String feedback_image;
    private int product_id;
    private int user_id;
    private Timestamp date;
    private String avatar_user;

    public Feedback() {
    }

    public Feedback(int fback_id, String fullName, int rated_star, String feedback_content, String feedback_image, int product_id, int user_id, Timestamp date, String avatar_user) {
        this.fback_id = fback_id;
        this.fullName = fullName;
        this.rated_star = rated_star;
        this.feedback_content = feedback_content;
        this.feedback_image = feedback_image;
        this.product_id = product_id;
        this.user_id = user_id;
        this.date = date;
        this.avatar_user = avatar_user;
    }

    public int getFback_id() {
        return fback_id;
    }

    public void setFback_id(int fback_id) {
        this.fback_id = fback_id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public int getRated_star() {
        return rated_star;
    }

    public void setRated_star(int rated_star) {
        this.rated_star = rated_star;
    }

    public String getFeedback_content() {
        return feedback_content;
    }

    public void setFeedback_content(String feedback_content) {
        this.feedback_content = feedback_content;
    }

    public String getFeedback_image() {
        return feedback_image;
    }

    public void setFeedback_image(String feedback_image) {
        this.feedback_image = feedback_image;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public String getAvatar_user() {
        return avatar_user;
    }

    public void setAvatar_user(String avatar_user) {
        this.avatar_user = avatar_user;
    }
    
    
}
