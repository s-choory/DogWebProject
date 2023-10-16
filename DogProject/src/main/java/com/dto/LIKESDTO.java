package com.dto;

import org.apache.ibatis.type.Alias;

@Alias("LIKES")
public class LIKESDTO {

	
	private String userID;
	private int categoryID;
	private String CATEGORIES;
	public LIKESDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public String getCATEGORIES() {
		return CATEGORIES;
	}

	public void setCATEGORIES(String cATEGORIES) {
		CATEGORIES = cATEGORIES;
	}

	public LIKESDTO(String userID, int categoryID, String cATEGORIES) {
		super();
		this.userID = userID;
		this.categoryID = categoryID;
		CATEGORIES = cATEGORIES;
	}
	@Override
	public String toString() {
		return "LIKESDTO [userID=" + userID + ", categoryID=" + categoryID + ", CATEGORIES=" + CATEGORIES + "]";
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public int getCategoryID() {
		return categoryID;
	}
	public void setCategoryID(int categoryID) {
		this.categoryID = categoryID;
	}
	
	
}
