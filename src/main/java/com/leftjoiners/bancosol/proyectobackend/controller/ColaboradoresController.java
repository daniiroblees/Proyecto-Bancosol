package com.leftjoiners.bancosol.proyectobackend.controller;

import com.leftjoiners.bancosol.proyectobackend.dao.TiendaCampanyaRepository;
import com.leftjoiners.bancosol.proyectobackend.entity.TiendaCampanya;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class ColaboradoresController {
    @Autowired
    protected TiendaCampanyaRepository tiendaCampanyaRepository;


    @GetMapping("/colaboradores")
    public String doInit(Model model) {
        return "colaboradores";
    }
}
