package org.springframework.social.quickstart;

import javax.inject.Inject;

import org.springframework.social.intuit.api.Intuit;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Simple little @Controller that invokes Intuit and renders the result.
 * The injected {@link Intuit} reference is configured with the required authorization credentials for the current user behind the scenes.
 * @author Jeffrey Williams
 */
@Controller
@RequestMapping("/profile")
public class UserProfileController {

	private final Intuit intuit;
	
	@Inject
	public UserProfileController(Intuit intuit) {
		this.intuit = intuit;
	}

	@RequestMapping(method = RequestMethod.GET)
	public String show(Model model) {
		model.addAttribute("profile", intuit.userOperations().getUserProfile());
		return "profile/show";
	}
}