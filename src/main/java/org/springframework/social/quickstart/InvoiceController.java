package org.springframework.social.quickstart;

import java.util.List;

import javax.inject.Inject;

import org.springframework.social.intuit.api.Intuit;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.intuit.sb.cdm.v2.Invoice;


/**
 * Simple little @Controller that invokes Intuit and renders the result.
 * The injected {@link Intuit} reference is configured with the required authorization credentials for the current user behind the scenes.
 * @author Jeffrey Williams
 */
@Controller
@RequestMapping("/invoice")
public class InvoiceController {

	private final Intuit intuit;
	
	@Inject
	public InvoiceController(Intuit intuit) {
		this.intuit = intuit;
	}

	@RequestMapping(method = RequestMethod.GET)
	public String list(Model model) {
		List<Invoice> invoices = intuit.invoiceOperations().getInvoices();
		model.addAttribute("invoices", invoices);
		return "invoice/list";
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public String show(Model model, @PathVariable(value="id") Long invoiceId) {
		model.addAttribute("invoice", intuit.invoiceOperations().getInvoice(invoiceId));
		return "invoice/show";
	}
	
	@RequestMapping(value = "/update/{id}", method = RequestMethod.GET)
	public String update(Model model, @PathVariable(value="id") Long invoiceId) {
		Invoice invoice = intuit.invoiceOperations().getInvoice(invoiceId);
		model.addAttribute("invoice", invoice);
		return "invoice/update";
	}

	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public String create(Model model) {
		model.addAttribute("invoice", new Invoice());
		return "invoice/create";
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
	public String delete(Model model, @PathVariable(value="id") Long invoiceId) {
		Invoice invoice = intuit.invoiceOperations().getInvoice(invoiceId);
		intuit.invoiceOperations().delete(invoice);
		return "redirect:";
	}
	
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String save(Model model, Invoice invoice) {
		if(invoice.getId() != null){
			invoice = updateInvoice(invoice);
			invoice = intuit.invoiceOperations().update(invoice);
		}
		else {
			invoice = intuit.invoiceOperations().create(invoice);
		}
		return "redirect:" + invoice.getId().getValue();
	}


	private Invoice updateInvoice(Invoice invoice){
		Invoice update = intuit.invoiceOperations().getInvoice(Long.parseLong(invoice.getId().getValue()));
		
		return update;
	}
}