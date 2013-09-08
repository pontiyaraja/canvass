package org.canvass.example.data.controller;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolation;
import javax.validation.Valid;
import javax.validation.Validator;

import org.canvass.example.data.model.Data;
import org.canvass.example.data.services.DataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;


@Controller
@RequestMapping(value="/data")
public class DataController {
	
	@Autowired
	private DataService dataService;
	
	private Validator validator;
	
	@Autowired
	public DataController(Validator validator) {
		this.validator = validator;
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public @ResponseBody String create(@ModelAttribute Data data) {
		dataService.addOrder(data);
		return "Success";
	}
	
	@RequestMapping(method=RequestMethod.GET)
	public @ResponseBody List<Data> getOrders() {
		return dataService.listOrders();
	}

	
	
	// internal helper
	private Map<String, String> validationMessages(Set<ConstraintViolation<Data>> failureSet) {
		Map<String, String> failureMessageMap = new HashMap<String, String>();
		for (ConstraintViolation<Data> failure : failureSet) {
			failureMessageMap.put(failure.getPropertyPath().toString(), failure.getMessage());
		}
		return failureMessageMap;
	}
}
