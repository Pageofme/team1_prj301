package model;

public class ProductSizeColor {
    private int id;
    private int productId;
    private Size size;
    private Color color;
    private int stock;

    public ProductSizeColor(int id, int productId, Size size, Color color, int stock) {
        this.id = id;
        this.productId = productId;
        this.size = size;
        this.color = color;
        this.stock = stock;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getProductId() { return productId; }
    public void setProductId(int productId) { this.productId = productId; }

    public Size getSize() { return size; }
    public void setSize(Size size) { this.size = size; }

    public Color getColor() { return color; }
    public void setColor(Color color) { this.color = color; }

    public int getStock() { return stock; }
    public void setStock(int stock) { this.stock = stock; }

    @Override
    public String toString() {
        return "ProductSizeColor [id=" + id + ", productId=" + productId + 
                ", size=" + size.getName() + ", color=" + color.getName() + ", stock=" + stock + "]";
    }
}

