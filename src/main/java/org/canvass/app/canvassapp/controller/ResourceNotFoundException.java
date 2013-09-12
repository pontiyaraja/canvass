package org.canvass.app.canvassapp.controller;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(value=HttpStatus.NOT_FOUND)
public class ResourceNotFoundException extends RuntimeException {
	private static final long serialVersionUID = 1L;

	private String email;
	
	public ResourceNotFoundException(String email) {
		this.email=email;
	}

	public String getEmail() {
		return email;
	}	
	
}
