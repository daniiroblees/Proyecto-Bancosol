package com.leftjoiners.bancosol.proyectobackend.controller;

import com.leftjoiners.bancosol.proyectobackend.dao.ColaboradoresRespository;
import com.leftjoiners.bancosol.proyectobackend.dao.TiendaCampanyaRepository;
import com.leftjoiners.bancosol.proyectobackend.entity.Colaborador;
import com.leftjoiners.bancosol.proyectobackend.entity.TiendaCampanya;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class ColaboradoresController {
    @Autowired
    protected ColaboradoresRespository colaboradoresRespository;


    @GetMapping("/colaboradores")
    public String doInit(Model model) {
        List<Colaborador> colaboradores = colaboradoresRespository.findAll();

        model.addAttribute("colaboradores", colaboradores);
        return "colaboradores";
    }
}
