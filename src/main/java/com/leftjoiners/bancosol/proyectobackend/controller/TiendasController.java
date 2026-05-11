package com.leftjoiners.bancosol.proyectobackend.controller;

import com.leftjoiners.bancosol.proyectobackend.dao.TiendaCampanyaRepository;
import com.leftjoiners.bancosol.proyectobackend.dao.TiendaRepository;
import com.leftjoiners.bancosol.proyectobackend.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@RequestMapping("/tiendas")
@Controller
public class TiendasController {

    @Autowired
    protected TiendaRepository tiendaRepository;

    @Autowired
    protected TiendaCampanyaRepository tiendaCampanyaRepository;

    @GetMapping("")
    public String doTiendas(Model model) {
        List<Tienda> tiendas = tiendaRepository.findAll();
        List<TiendaCampanya> tiendaCampanyas = tiendaCampanyaRepository.findAll();

        model.addAttribute("tiendas", tiendas);
        model.addAttribute("tiendaCampanyas", tiendaCampanyas);
        model.addAttribute("currentSection", "tiendas");
        return "/tiendas/tiendas";
    }

    @PostMapping("/filtrarTiendas")
    public String doFiltrarTiendas(Model model,
                                   @RequestParam("cadena") Cadena cadena,
                                   @RequestParam("localidad") Localidad localidad,
                                   @RequestParam("zona")Zona zona, //zona???'
                                   @RequestParam("coordinador") Integer coordinador){ //o Usuario
        //falta la query y mandarsela a tiendas
        return "tiendas";
    }

}
