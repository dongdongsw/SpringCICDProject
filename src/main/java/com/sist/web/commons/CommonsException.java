package com.sist.web.commons;

import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

// 공통으로 사용되는 예외처리
@RestControllerAdvice
public class CommonsException {

	@ExceptionHandler(Exception.class)
	public void exception(Exception ex) {
		System.out.println("========================= Exception 에러 ===========================");
		ex.printStackTrace();
	}
	
	@ExceptionHandler(Throwable.class)
	public void throwable(Throwable ex) {
		System.out.println("========================= Throwable 에러 ===========================");
		ex.printStackTrace();
	}
	
}
