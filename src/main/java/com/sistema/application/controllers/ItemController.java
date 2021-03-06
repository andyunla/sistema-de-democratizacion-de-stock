package com.sistema.application.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.validation.BindingResult;
import javax.validation.Valid;


import com.sistema.application.converters.UserConverter;
import com.sistema.application.dto.UserDto;
import com.sistema.application.helpers.ViewRouteHelper;
import com.sistema.application.models.ItemModel;
import com.sistema.application.repositories.IUserRepository;
import com.sistema.application.entities.Item;
import com.sistema.application.services.IItemService;
import com.sistema.application.services.IProductoService;
import com.sistema.application.services.implementations.UserService;
import com.sistema.application.services.IChangoService;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;
import java.util.ArrayList;

@Controller
@RequestMapping("/item")
public class ItemController {
	
	//Atributos
	@Autowired
	@Qualifier("userConverter")
	private UserConverter userConverter;
	
	@Autowired
	@Qualifier("itemService")
	private IItemService itemService;
	
	@Autowired
    @Qualifier("productoService")
    private IProductoService productoService;
	
	@Autowired
    @Qualifier("changoService")
    private IChangoService changoService;
	
	@Autowired
    @Qualifier("userRepository")
    private IUserRepository userRepository;	
	
	@Autowired
    @Qualifier("userService")
    private UserService userService;
	
	//Métodos
	@GetMapping("")
	public String items(Model modelo) {
		// Obtenemos el usuario de la sesión
		UserDto userDto = userService.getCurrentUser();
		modelo.addAttribute("currentUser", userDto);
		
		List<Item> listaItems = itemService.getAll();
		List<Item> itemsLocales = new ArrayList<Item>();
		
		for(Item it: listaItems) {
			if(it.getChango().getLocal().getIdLocal() == userDto.getLocal().getIdLocal() ) itemsLocales.add(it);
		}
		
		modelo.addAttribute("items", itemsLocales);
		
		return ViewRouteHelper.ITEM_ABM;
	}
	
	@PostMapping("agregar")
	public String agregar(@Valid @ModelAttribute("item") ItemModel nuevoItem, BindingResult bindingResult) {
		
		if(bindingResult.hasErrors()) {
			return ViewRouteHelper.ITEM_ABM;
		}else {
			itemService.insertOrUpdate(nuevoItem);
		}
		
		return "redirect:/" + ViewRouteHelper.ITEM_ROOT;
	}
	
	@PostMapping("modificar")
	public String modificar(@Valid @ModelAttribute("item") ItemModel itemModificado, BindingResult bindingResult) {
		
		if(bindingResult.hasErrors()) {
			return ViewRouteHelper.ITEM_ABM;
		}else {
			itemService.insertOrUpdate(itemModificado);
		}
		
		return "redirect:/" + ViewRouteHelper.ITEM_ROOT;
	}
	
	@PostMapping("eliminar/{idItem}")
	public String eliminar(@PathVariable("idItem") long idItem, RedirectAttributes redirectAttributes) {
		boolean eliminado = itemService.remove(idItem);
		redirectAttributes.addFlashAttribute("itemEliminado", eliminado);
		return "redirect:/" + ViewRouteHelper.ITEM_ROOT;
	}
	
}
