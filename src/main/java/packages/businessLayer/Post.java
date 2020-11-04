package packages.businessLayer;

import java.awt.Image;
import java.util.Date;

public class Post {
    private String attachment;
    private String text;
    private Date date;
    private boolean updated;
    private String[] tags;
    private int postID;
    private int userID;

    public Post(int userID, String text, String img, Date date, String[] tags) {
        this.userID = userID;
        this.text = text;
        this.attachment = img;
        this.date = date;
        this.updated = false;
        this.tags = tags;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getText() {
        return this.text;
    }

    public void setAttachment(String att) {
        this.attachment = att;
    }

    public String getAttachment() {
        return this.attachment;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getUserID() {
        return this.userID;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Date getDate() {
        return this.date;
    }

    public void setUpdated(boolean b) {
        this.updated = true;
    }

    public void setPostID(int id) {
        this.postID = id;
    }

    public int getPostID() {
        return this.postID;
    }

    public void setTags(String[] tags) {
        this.tags = tags;
    }

    public String getTags() {
        String temp = "";
        for (String el: this.tags) {
            temp += el + " ";
        }
        return temp;
    }
}
