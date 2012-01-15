package org.springframework.social.quickstart;

import java.util.List;

import javax.inject.Inject;

import org.springframework.social.intuit.api.Intuit;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.intuit.sb.cdm.qbo.v2.Customer;

/**
 * Simple little @Controller that invokes Intuit and renders the result.
 * The injected {@link Intuit} reference is configured with the required authorization credentials for the current user behind the scenes.
 * @author Jeffrey Williams
 */
@Controller
public class HomeController {

	private final Intuit intuit;
	
	@Inject
	public HomeController(Intuit intuit) {
		this.intuit = intuit;
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String list(Model model) {
		List<Customer> customers = intuit.customerOperations().getCustomers();
		model.addAttribute("customers", customers);
		return "home";
	}

}