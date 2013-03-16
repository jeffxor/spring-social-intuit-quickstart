package org.springframework.social.quickstart;

import java.util.List;

import javax.inject.Inject;

import org.springframework.social.intuit.api.Intuit;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.intuit.sb.cdm.v2.Payment;


/**
 * Simple little @Controller that invokes Intuit and renders the result.
 * The injected {@link Intuit} reference is configured with the required authorization credentials for the current user behind the scenes.
 * @author Jeffrey Williams
 */
@Controller
@RequestMapping("/payment")
public class PaymentController {

	private final Intuit intuit;
	
	@Inject
	public PaymentController(Intuit intuit) {
		this.intuit = intuit;
	}

	@RequestMapping(method = RequestMethod.GET)
	public String list(Model model) {
		List<Payment> payments = intuit.paymentOperations().getPayments();
		model.addAttribute("payments", payments);
		return "payment/list";
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public String show(Model model, @PathVariable(value="id") Long paymentId) {
		model.addAttribute("payment", intuit.paymentOperations().getPayment(paymentId));
		return "payment/show";
	}
	
	@RequestMapping(value = "/update/{id}", method = RequestMethod.GET)
	public String update(Model model, @PathVariable(value="id") Long paymentId) {
		Payment payment = intuit.paymentOperations().getPayment(paymentId);
		model.addAttribute("payment", payment);
		return "payment/update";
	}

	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String create(Model model) {
		model.addAttribute("payment", new Payment());
		return "payment/create";
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
	public String delete(Model model, @PathVariable(value="id") Long paymentId) {
		Payment payment = intuit.paymentOperations().getPayment(paymentId);
		intuit.paymentOperations().delete(payment);
		return "redirect:";
	}
	
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String save(Model model, Payment payment) {
		if(payment.getId() != null){
			payment = updatePayment(payment);
			payment = intuit.paymentOperations().update(payment);
		}
		else {
			payment = intuit.paymentOperations().create(payment);
		}
		return "redirect:" + payment.getId().getValue();
	}


	private Payment updatePayment(Payment payment){
		Payment update = intuit.paymentOperations().getPayment(Long.parseLong(payment.getId().getValue()));
		
		return update;
	}
}