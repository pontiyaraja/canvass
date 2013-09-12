package org.canvass.app.canvassapp.controller;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolation;
import javax.validation.Valid;
import javax.validation.Validator;

import org.canvass.app.canvassapp.model.User;
import org.canvass.app.canvassapp.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;


@Controller
@RequestMapping(value="/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	private Validator validator;
	
	@Autowired
	public UserController(Validator validator) {
		this.validator = validator;
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public @ResponseBody String create(@Valid @RequestBody User order) {
		userService.addUser(order);
		return "Success";
	}
	
	@RequestMapping(method=RequestMethod.GET)
	public @ResponseBody List<User> getOrders() {
		return userService.listUsers();
	}

	@RequestMapping(value="{email}", method=RequestMethod.GET)
	public @ResponseBody List<User> getOrder(@PathVariable String email) {
		List<User> user = userService.findUser(email);
		if (user == null) {
			throw new ResourceNotFoundException(email);
		}
		return user;
	}	
	
}
