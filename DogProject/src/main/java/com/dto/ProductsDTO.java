package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("Products")
public class ProductsDTO {
	
	int productid;
	String productname;
	String category;
	String content;
	int price;
	String image;
	int stockquantity;
	public ProductsDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ProductsDTO(int productid, String productname, String category, String content, int price, String image,
			int stockquantity) {
		super();
		this.productid = productid;
		this.productname = productname;
		this.category = category;
		this.content = content;
		this.price = price;
		this.image = image;
		this.stockquantity = stockquantity;
	}
	public int getProductid() {
		return productid;
	}
	public void setProductid(int productid) {
		this.productid = productid;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getStockquantity() {
		return stockquantity;
	}
	public void setStockquantity(int stockquantity) {
		this.stockquantity = stockquantity;
	}
	@Override
	public String toString() {
		return "GoodsDTO [productid=" + productid + ", productname=" + productname + ", category=" + category
				+ ", content=" + content + ", price=" + price + ", image=" + image + ", stockquantity=" + stockquantity
				+ "]";
	}
	
    
    
}
