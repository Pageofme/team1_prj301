package model;

public class ProductImage {
    private int id;
    private int productId;
    private String imageUrl;
//    private String imageType;
//    private int imageOrder;

    public ProductImage(int id, int productId, String imageUrl) {
        this.id = id;
        this.productId = productId;
        this.imageUrl = imageUrl;
    }

    public ProductImage(int productId, String imageUrl) {
        this.productId = productId;
        this.imageUrl = imageUrl;
    }

    
    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getProductId() { return productId; }
    public void setProductId(int productId) { this.productId = productId; }

    public String getImageUrl() { return imageUrl; }
    public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }

//    public String getImageType() { return imageType; }
//    public void setImageType(String imageType) { this.imageType = imageType; }
//
//    public int getImageOrder() { return imageOrder; }
//    public void setImageOrder(int imageOrder) { this.imageOrder = imageOrder; }

    @Override
    public String toString() {
        return "ProductImage [id=" + id + ", productId=" + productId + ", imageUrl=" + imageUrl + "]";
    }
}
