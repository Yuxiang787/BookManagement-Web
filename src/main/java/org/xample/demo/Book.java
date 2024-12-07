package org.xample.demo;

public class Book {
    private int id;
    private String category;
    private String title;
    private String author;

    public Book() {
    }

    public Book(int id) {
        this.id = id;
    }

    public Book(String category, String title, String author) {
        this.category = category;
        this.title = title;
        this.author = author;
    }
    public Book(int id, String category, String title, String author) {
        this.id = id;
        this.category = category;
        this.title = title;
        this.author = author;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String toString() {
        return "Book{" +
                "id=" + id +
                ", category='" + category + '\'' +
                ", title='" + title + '\'' +
                ", author='" + author + '\'' +
                '}';
    }

    public static void main(String[] args) {

    }
}
