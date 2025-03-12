
package models;

public class OrderDetail {
    private int order_id ;
    private int product_id;
    private int quantity;
    private int price;
    private Order order;
    private Product product;

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

   

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

   
    
    public OrderDetail() {
    }

    public OrderDetail(int order_id, int dish_id, int quantity, int price) {
        this.order_id = order_id;
        this.product_id = dish_id;
        this.quantity = quantity;
        this.price = price;
    }
    
}
