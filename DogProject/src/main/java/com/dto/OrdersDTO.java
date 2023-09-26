package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("Orders")
public class OrdersDTO {
	private int OrderID;
	private String UserID;
	private int ProductID;
	private String ProductName;
	private int Price;
	private String Psize;
	private String Color;
	private int Amount;
	private String Image;
	private String UserName;
	private String Email1;
	private String Email2;
	private int Post;
	private String RodeAddress;
	private String HouseAddress;
	private String DetailAddress;
	private String PhoneNumber;
	private String PayMethod;
	private String OrderTime;
	private int TotalPrice;
	private String ReviewFlag;
	public OrdersDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public OrdersDTO(int orderID, String userID, int productID, String productName, int price, String psize,
			String color, int amount, String image, String userName, String email1, String email2, int post,
			String rodeAddress, String houseAddress, String detailAddress, String phoneNumber, String payMethod,
			String orderTime, int totalPrice, String reviewFlag) {
		super();
		OrderID = orderID;
		UserID = userID;
		ProductID = productID;
		ProductName = productName;
		Price = price;
		Psize = psize;
		Color = color;
		Amount = amount;
		Image = image;
		UserName = userName;
		Email1 = email1;
		Email2 = email2;
		Post = post;
		RodeAddress = rodeAddress;
		HouseAddress = houseAddress;
		DetailAddress = detailAddress;
		PhoneNumber = phoneNumber;
		PayMethod = payMethod;
		OrderTime = orderTime;
		TotalPrice = totalPrice;
		ReviewFlag = reviewFlag;
	}
	@Override
	public String toString() {
		return "OrdersDTO [OrderID=" + OrderID + ", UserID=" + UserID + ", ProductID=" + ProductID + ", ProductName="
				+ ProductName + ", Price=" + Price + ", Psize=" + Psize + ", Color=" + Color + ", Amount=" + Amount
				+ ", Image=" + Image + ", UserName=" + UserName + ", Email1=" + Email1 + ", Email2=" + Email2
				+ ", Post=" + Post + ", RodeAddress=" + RodeAddress + ", HouseAddress=" + HouseAddress
				+ ", DetailAddress=" + DetailAddress + ", PhoneNumber=" + PhoneNumber + ", PayMethod=" + PayMethod
				+ ", OrderTime=" + OrderTime + ", TotalPrice=" + TotalPrice + ", ReviewFlag=" + ReviewFlag + "]";
	}
	public int getOrderID() {
		return OrderID;
	}
	public void setOrderID(int orderID) {
		OrderID = orderID;
	}
	public String getUserID() {
		return UserID;
	}
	public void setUserID(String userID) {
		UserID = userID;
	}
	public int getProductID() {
		return ProductID;
	}
	public void setProductID(int productID) {
		ProductID = productID;
	}
	public String getProductName() {
		return ProductName;
	}
	public void setProductName(String productName) {
		ProductName = productName;
	}
	public int getPrice() {
		return Price;
	}
	public void setPrice(int price) {
		Price = price;
	}
	public String getPsize() {
		return Psize;
	}
	public void setPsize(String psize) {
		Psize = psize;
	}
	public String getColor() {
		return Color;
	}
	public void setColor(String color) {
		Color = color;
	}
	public int getAmount() {
		return Amount;
	}
	public void setAmount(int amount) {
		Amount = amount;
	}
	public String getImage() {
		return Image;
	}
	public void setImage(String image) {
		Image = image;
	}
	public String getUserName() {
		return UserName;
	}
	public void setUserName(String userName) {
		UserName = userName;
	}
	public String getEmail1() {
		return Email1;
	}
	public void setEmail1(String email1) {
		Email1 = email1;
	}
	public String getEmail2() {
		return Email2;
	}
	public void setEmail2(String email2) {
		Email2 = email2;
	}
	public int getPost() {
		return Post;
	}
	public void setPost(int post) {
		Post = post;
	}
	public String getRodeAddress() {
		return RodeAddress;
	}
	public void setRodeAddress(String rodeAddress) {
		RodeAddress = rodeAddress;
	}
	public String getHouseAddress() {
		return HouseAddress;
	}
	public void setHouseAddress(String houseAddress) {
		HouseAddress = houseAddress;
	}
	public String getDetailAddress() {
		return DetailAddress;
	}
	public void setDetailAddress(String detailAddress) {
		DetailAddress = detailAddress;
	}
	public String getPhoneNumber() {
		return PhoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		PhoneNumber = phoneNumber;
	}
	public String getPayMethod() {
		return PayMethod;
	}
	public void setPayMethod(String payMethod) {
		PayMethod = payMethod;
	}
	public String getOrderTime() {
		return OrderTime;
	}
	public void setOrderTime(String orderTime) {
		OrderTime = orderTime;
	}
	public int getTotalPrice() {
		return TotalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		TotalPrice = totalPrice;
	}
	public String getReviewFlag() {
		return ReviewFlag;
	}
	public void setReviewFlag(String reviewFlag) {
		ReviewFlag = reviewFlag;
	}
	
}
