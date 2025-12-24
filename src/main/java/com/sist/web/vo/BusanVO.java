package com.sist.web.vo;

import lombok.Data;

@Data
public class BusanVO {

	private int no, hit, contenttype, contentid;
	private String title, image1, image2, address;
	private double x,y;
}
