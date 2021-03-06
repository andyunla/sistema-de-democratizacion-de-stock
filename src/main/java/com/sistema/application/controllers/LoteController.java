package com.sistema.application.controllers;

import java.util.List;

import com.sistema.application.converters.UserConverter;
import com.sistema.application.dto.UserDto;
import com.sistema.application.helpers.ViewRouteHelper;
import com.sistema.application.models.LoteModel;
import com.sistema.application.repositories.IUserRepository;
import com.sistema.application.services.ILoteService;
import com.sistema.application.services.IProductoService;
import com.sistema.application.services.implementations.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import javax.validation.Valid;
import org.springframework.validation.BindingResult;


@Controller
@RequestMapping("lote")
public class LoteController {
     @Autowired
     @Qualifier("userConverter")
     private UserConverter userConverter;
     @Autowired
     @Qualifier("loteService")
     private ILoteService loteService;

     @Autowired
     @Qualifier("productoService")
     private IProductoService productoService;
     
     @Autowired
     @Qualifier("userService")
     private UserService userService;
     
     @Autowired
     @Qualifier("userRepository")
     private IUserRepository userRepository;

     @GetMapping("")
     public String lotes(Model modelo) {
          // Obtenemos el usuario de la sesión
          UserDto userDto = userService.getCurrentUser();
          modelo.addAttribute("currentUser", userDto);
          modelo.addAttribute("lotes", loteService.findByLocalOrderByFechaingresoDesc(userDto.getLocal().getIdLocal()));
          modelo.addAttribute("lote", new LoteModel());
          modelo.addAttribute("productos", productoService.getAll());
          return ViewRouteHelper.LOTE_ABM;
     }  

     @PostMapping("agregar")
     public String agregar(@Valid @ModelAttribute("lote") LoteModel nuevoLote, BindingResult bindingResult) {
          nuevoLote.setCantidadActual(nuevoLote.getCantidadInicial());
          if(bindingResult.hasErrors()) {
               return ViewRouteHelper.LOTE_ABM;
          } else {
               loteService.insertOrUpdate(nuevoLote);
          }
          return "redirect:/" + ViewRouteHelper.LOTE_ROOT;
     }

     @GetMapping("traer/{idLocal}/{idProducto}/{soloActivos}")
     public ModelAndView traer(@PathVariable("idLocal") long idLocal, @PathVariable("idProducto") long idProducto,
                               @PathVariable("soloActivos") boolean soloActivos) {
          ModelAndView mAV = new ModelAndView(ViewRouteHelper.LISTA_LOTES);
          List<LoteModel> lotes = loteService.findByALocalProductoAndActivo(idLocal, idProducto, soloActivos);
          mAV.addObject("lotes", lotes);
          return mAV;  
     }
       
     @PostMapping("eliminar/{idLote}")
     public ResponseEntity<String> eliminar(@PathVariable("idLote") long idLote) {
          boolean eliminado = loteService.remove(idLote);
          if (eliminado) {
               return new ResponseEntity<String>(HttpStatus.OK);
          } else {
               return new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
          }
     }   
}    
