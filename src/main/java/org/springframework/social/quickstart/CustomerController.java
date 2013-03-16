package org.springframework.social.quickstart;

import java.util.List;

import javax.inject.Inject;

import org.springframework.social.intuit.api.Intuit;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.intuit.sb.cdm.v2.Customer;
import com.intuit.sb.cdm.v2.Invoice;
import com.intuit.sb.cdm.v2.Payment;


/**
 * Simple little @Controller that invokes Intuit and renders the result.
 * The injected {@link Intuit} reference is configured with the required authorization credentials for the current user behind the scenes.
 * @author Jeffrey Williams
 */
@Controller
@RequestMapping("/customer")
public class CustomerController {

	private final Intuit intuit;
	
	@Inject
	public CustomerController(Intuit intuit) {
		this.intuit = intuit;
	}

	@RequestMapping(method = RequestMethod.GET)
	public String list(Model model) {
		List<Customer> customers = intuit.customerOperations().getCustomers();		
		model.addAttribute("customers", customers);
		return "customer/list";
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public String show(Model model, @PathVariable(value="id") Long customerId) {
		model.addAttribute("customer", intuit.customerOperations().getCustomer(customerId));
		return "customer/show";
	}
	
	@RequestMapping(value="/{customerId}/payment/", method = RequestMethod.GET)
	public String customerPayments(Model model, @PathVariable(value="customerId") Long customerId) {
		Customer customer = intuit.customerOperations().getCustomer(customerId);
		List<Payment> payments = intuit.paymentOperations().getPayments(customer);
		model.addAttribute("customer", customer);
		model.addAttribute("payments", payments);
		return "customer/show";
	}

	@RequestMapping(value="/{customerId}/invoice/", method = RequestMethod.GET)
	public String customerInvoices(Model model, @PathVariable(value="customerId") Long customerId) {
		Customer customer = intuit.customerOperations().getCustomer(customerId);
		List<Invoice> invoices = intuit.invoiceOperations().getInvoices(customer);
		model.addAttribute("customer", customer);
		model.addAttribute("invoices", invoices);
		return "customer/show";
	}
	
	@RequestMapping(value = "/update/{id}", method = RequestMethod.GET)
	public String update(Model model, @PathVariable(value="id") Long customerId) {
		Customer customer = intuit.customerOperations().getCustomer(customerId);
		model.addAttribute("customer", customer);
		return "customer/update";
	}

	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String create(Model model) {
		model.addAttribute("customer", new Customer());
		return "customer/create";
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
	public String delete(Model model, @PathVariable(value="id") Long customerId) {
		Customer customer = intuit.customerOperations().getCustomer(customerId);
		intuit.customerOperations().delete(customer);
		return "redirect:";
	}
	
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String save(Model model, Customer customer) {
		if(customer.getId() != null){
			customer = updateCustomer(customer);
			customer = intuit.customerOperations().update(customer);
		}
		else {
			customer = intuit.customerOperations().create(customer);
		}
		return "redirect:" + customer.getId().getValue();
	}


	private Customer updateCustomer(Customer customer){
		Customer update = intuit.customerOperations().getCustomer(Long.parseLong(customer.getId().getValue()));
		update.setName(customer.getName());
		update.setGivenName(customer.getGivenName());
		update.setFamilyName(customer.getFamilyName());
		
		return update;
	}
}