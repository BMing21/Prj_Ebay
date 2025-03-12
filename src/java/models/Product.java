package models;

import java.util.ArrayList;
import java.util.List;

public class Product {
    private int id, unitprice, quantity, category_id;
    private String name, description;
    private Category category;
    
    private List<Image> images = new ArrayList();

    public List<Image> getImages() {
        return images;
    }

    public void setImages(List<Image> Images) {
        this.images = Images;
    }

    public Product() {
    }

    public Product(int id, int unitprice, int quantity, int category_id, String name, String description) {
        this.id = id;
        this.unitprice = unitprice;
        this.quantity = quantity;
        this.category_id = category_id;
        this.name = name;
        this.description = description;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUnitprice() {
        return unitprice;
    }

    public void setUnitprice(int unitprice) {
        this.unitprice = unitprice;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getCategory_id() {
        return category_id;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
    
    
}
