package org.canvass.app.canvassapp;

import javax.validation.Validator;

import org.canvass.app.canvassapp.model.User;
import org.canvass.app.canvassapp.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	//@Autowired
	//private OrderService orderService;
    private Validator validator;
	
	@Autowired
	public HomeController(Validator validator) {
		this.validator = validator;
	}
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	
	    	
		public String getOrdersPage(Model model) {
		logger.info("Welcome home! the client locale is ");
			model.addAttribute("user", new User());
			
			return "home";		
	}
	
}
