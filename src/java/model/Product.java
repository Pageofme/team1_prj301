package model;

import java.util.Date;
import java.util.List;

public class Product {
    private int id;
    private String name;
    private String description;
    private double price;
    private Date createdDate;
    private int companyId;
//    private List<ProductImage> images;
//    private List<ProductSizeColor> sizeColors;

    public Product(int id, String name, String description, double price, Date createdDate, int companyId) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.price = price;
        this.createdDate = createdDate;
        this.companyId = companyId;
    }

    public Product() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }

    public int getCompanyId()
    {
        return companyId;
    }

    public void setCompanyId(int companyId)
    {
        this.companyId = companyId;
    }

    public Date getCreatedDate() { return createdDate; }
    public void setCreatedDate(Date createdDate) { this.createdDate = createdDate; }

//    public List<ProductImage> getImages() { return images; }
//    public void setImages(List<ProductImage> images) { this.images = images; }
//
//    public List<ProductSizeColor> getSizeColors() { return sizeColors; }
//    public void setSizeColors(List<ProductSizeColor> sizeColors) { this.sizeColors = sizeColors; }

    @Override
    public String toString() {
        return "Product [id=" + id + ", name=" + name + ", price=" + price +
                ", companyId=" + companyId + ", createdDate=" + createdDate + "]";
    }
}
