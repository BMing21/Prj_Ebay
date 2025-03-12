
package models;

public class Cart {
    private int product_id, customer_id, quantity, total_cost;
    public Product product;
    public User customer;

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

   

    public Cart() {
    }
    
    
    

    public Cart(int dish_id, int customer_id, int quantity, int total_cost) {
        this.product_id = dish_id;
        this.customer_id = customer_id;
        this.quantity = quantity;
        this.total_cost = total_cost;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    

   

    public int getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(int customer_id) {
        this.customer_id = customer_id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getTotal_cost() {
        return total_cost;
    }

    public void setTotal_cost(int total_cost) {
        this.total_cost = total_cost;
    }

   
    public User getCustomer() {
        return customer;
    }

    public void setCustomer(User customer) {
        this.customer = customer;
    }
    
    
}
