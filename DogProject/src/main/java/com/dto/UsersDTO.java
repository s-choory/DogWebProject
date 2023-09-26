package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("Users")
public class UsersDTO {
	
	private String UserID;
	private String UserName;
	private String UserAlias;
	private String Email1;
	private String Email2;
	private int Post;
	private String Password;
	private String RodeAddress;
	private String HouseAddress;
	private String DetailAddress;
	private String PhoneNumber;
	private String DogName;
	private String DogType;
	private String UserImg;
	private String UserType;
	public UsersDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public String getUserImg() {
		return UserImg;
	}

	public void setUserImg(String userImg) {
		UserImg = userImg;
	}

	@Override
	public String toString() {
		return "UsersDTO [UserID=" + UserID + ", UserName=" + UserName + ", UserAlias=" + UserAlias + ", Email1="
				+ Email1 + ", Email2=" + Email2 + ", Post=" + Post + ", Password=" + Password + ", RodeAddress="
				+ RodeAddress + ", HouseAddress=" + HouseAddress + ", DetailAddress=" + DetailAddress + ", PhoneNumber="
				+ PhoneNumber + ", DogName=" + DogName + ", DogType=" + DogType + ", UserImg=" + UserImg + ", UserType="
				+ UserType + "]";
	}

	public UsersDTO(String userID, String userName, String userAlias, String email1, String email2, int post,
			String password, String rodeAddress, String houseAddress, String detailAddress, String phoneNumber,
			String dogName, String dogType, String userImg, String userType) {
		super();
		UserID = userID;
		UserName = userName;
		UserAlias = userAlias;
		Email1 = email1;
		Email2 = email2;
		Post = post;
		Password = password;
		RodeAddress = rodeAddress;
		HouseAddress = houseAddress;
		DetailAddress = detailAddress;
		PhoneNumber = phoneNumber;
		DogName = dogName;
		DogType = dogType;
		UserImg = userImg;
		UserType = userType;
	}

	public String getUserID() {
		return UserID;
	}
	public void setUserID(String userID) {
		UserID = userID;
	}
	public String getUserName() {
		return UserName;
	}
	public void setUserName(String userName) {
		UserName = userName;
	}
	public String getUserAlias() {
		return UserAlias;
	}
	public void setUserAlias(String userAlias) {
		UserAlias = userAlias;
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
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
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
	public String getDogName() {
		return DogName;
	}
	public void setDogName(String dogName) {
		DogName = dogName;
	}
	public String getDogType() {
		return DogType;
	}
	public void setDogType(String dogType) {
		DogType = dogType;
	}
	public String getUserType() {
		return UserType;
	}
	public void setUserType(String userType) {
		UserType = userType;
	}
	
}
