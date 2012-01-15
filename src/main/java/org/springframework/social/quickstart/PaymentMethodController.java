package org.springframework.social.quickstart;

import java.util.List;

import javax.inject.Inject;

import org.springframework.social.intuit.api.Intuit;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.intuit.sb.cdm.qbo.v2.PaymentMethod;

/**
 * Simple little @Controller that invokes Intuit and renders the result.
 * The injected {@link Intuit} reference is configured with the required authorization credentials for the current user behind the scenes.
 * @author Jeffrey Williams
 */
@Controller
@RequestMapping("/paymentMethod")
public class PaymentMethodController {

	private final Intuit intuit;
	
	@Inject
	public PaymentMethodController(Intuit intuit) {
		this.intuit = intuit;
	}

	@RequestMapping(method = RequestMethod.GET)
	public String list(Model model) {
		List<PaymentMethod> paymentMethods = intuit.paymentMethodOperations().getPaymentMethods();
		model.addAttribute("paymentMethods", paymentMethods);
		return "paymentMethod/list";
	}
}