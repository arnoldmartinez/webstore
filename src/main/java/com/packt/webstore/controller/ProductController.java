package com.packt.webstore.controller;

import com.packt.webstore.domain.Product;
import com.packt.webstore.exception.NoProductsFoundUnderCategoryException;
import com.packt.webstore.exception.ProductNotFoundException;
import com.packt.webstore.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/products")
public class ProductController {

    @Autowired
    private ProductService productService;

    @RequestMapping
    public String list(Model model) {
        model.addAttribute("products", productService.getAllProducts());

        return "products";
    }

    @RequestMapping(value = "/{category}", method = RequestMethod.GET)
    public String getProductsByCategory(Model model, @PathVariable("category") String category) {
        List<Product> products = productService.getProductsByCategory(category);

        if(products == null || products.isEmpty()) {
            throw new NoProductsFoundUnderCategoryException();
        }

        model.addAttribute("products", products);

        return "products";
    }

    @RequestMapping("/filter/{ByCriteria}")
    public String getProductsByFilter(@MatrixVariable(pathVar = "ByCriteria") Map<String, List<String>> filterParams, Model model) {
        model.addAttribute("products", productService.getProductsByFilter(filterParams));

        return "products";
    }

    @RequestMapping("/product")
    public String getProductById(@RequestParam("id") String productId, Model model) {
        model.addAttribute("product", productService.getProductById(productId));

        return "product";
    }

    @RequestMapping("/{manufacturer}")
    public String getProductsByManufacturer(Model model, @PathVariable("manufacturer") String productManufacturer) {
        model.addAttribute("products", productService.getProductsByManufacturer(productManufacturer));

        return "products";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String getAddNewProductForm(Model model) {
        Product newProduct = new Product();

        model.addAttribute("newProduct", newProduct);

        return "addProduct";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String processAddNewProductForm(@ModelAttribute("newProduct") Product newProduct, BindingResult result, HttpServletRequest request) {
        String[] suppressedFields = result.getSuppressedFields();

        if(suppressedFields.length > 0) {
            throw new RuntimeException("Attempting to bind disalloweb fields: " + StringUtils.arrayToCommaDelimitedString(suppressedFields));
        }

        MultipartFile productImage = newProduct.getProductImage();

        String rootDirectory = request.getSession().getServletContext().getRealPath("/");

        if(productImage != null && !productImage.isEmpty()) {
            try {
                //productImage.transferTo(new File(rootDirectory + "resources\\images\\" + newProduct.getProductId() + ".png"));
                productImage.transferTo(new File(rootDirectory + "resources/images/" + newProduct.getProductId() + ".png"));
            } catch (Exception e) {
                throw new RuntimeException("Product Image saving failed ", e);
            }
        }

        MultipartFile productPDF = newProduct.getProductPDF();

        if(productPDF != null && !productPDF.isEmpty()) {
            try {
                productPDF.transferTo(new File(rootDirectory + "resources/pdf/" + newProduct.getProductId() + ".pdf"));
            } catch (Exception e) {
                throw new RuntimeException("Product PDF saving failed ", e);
            }
        }

        productService.addProduct(newProduct);

        return "redirect:/products";
    }

    @InitBinder
    public void initialiseBinder(WebDataBinder binder) {
        binder.setAllowedFields("productId", "name", "unitPrice", "description", "manufacturer", "category", "unitsInStock", "condition", "productImage", "productPDF");
        binder.setDisallowedFields("unitInOrder", "discontinued");
    }

    @ExceptionHandler(ProductNotFoundException.class)
    public ModelAndView handleError(HttpServletRequest request, ProductNotFoundException exception) {
        ModelAndView modelAndView = new ModelAndView();

        modelAndView.addObject("invalidProductId", exception.getProductId());
        modelAndView.addObject("exception", exception);
        modelAndView.addObject("url", request.getRequestURL() + "?" + request.getQueryString());

        modelAndView.setViewName("productNotFound");

        return modelAndView;
    }
}
