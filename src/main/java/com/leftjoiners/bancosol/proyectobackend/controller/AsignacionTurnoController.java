package com.leftjoiners.bancosol.proyectobackend.controller;

import com.leftjoiners.bancosol.proyectobackend.dao.*;
import com.leftjoiners.bancosol.proyectobackend.entity.AsignacionTurno;
import com.leftjoiners.bancosol.proyectobackend.entity.TiendaCampanya;
import com.leftjoiners.bancosol.proyectobackend.entity.VistaAsignacionColaboradores;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalTime;
import java.util.List;

@Controller
@RequestMapping("/turnos")
public class AsignacionTurnoController {
    @Autowired
    protected TiendaCampanyaRepository tiendaCampanyaRepository;

    @Autowired
    protected AsignacionColaboradoresRepository asignacionColaboradoresRepository;

    @Autowired
    protected TipoTurnoRepository tipoTurnoRepository;

    @Autowired
    protected ColaboradoresRespository colaboradoresRespository;

    @Autowired
    protected AsignacionTurnoRepository asignacionTurnoRepository;

    @GetMapping("")
    public String doInit(Model model) {
        List<VistaAsignacionColaboradores> asignacionColaboradores = asignacionColaboradoresRepository.findAll();

        model.addAttribute("asignacionColaboradores", asignacionColaboradores);
        model.addAttribute("currentSection", "turnos");
        return "turnos/asignacion_turno";
    }

    @PostMapping("/buscarTurno")
    public String buscarTurno(@RequestParam(value = "id", required = false) Integer id,
                              @RequestParam(value = "turno", required = false) Integer turno,
                              @RequestParam(value = "lineales", required = false) Integer lineales,
                              @RequestParam(value = "linealActual", required = false) Integer linealActual,
                              Model model) {
        TiendaCampanya tiendaCampanya = tiendaCampanyaRepository.findById(id).orElse(null);
        AsignacionTurno asignacionTurno = this.asignacionTurnoRepository.buscarTurnoEspecifico(id, turno, linealActual).orElse(null);

        model.addAttribute("id", id);
        model.addAttribute("turno", turno);
        model.addAttribute("lineales", lineales);
        model.addAttribute("linealActual", linealActual);
        model.addAttribute("tienda", tiendaCampanya);
        model.addAttribute("asignacionTurno", asignacionTurno);

        return "turnos/info_turno";
    }

    @GetMapping("/crearTurno")
    public String crearTurno(@RequestParam(value = "id", required = false) Integer id,
                              @RequestParam(value = "turno", required = false) Integer turno,
                              @RequestParam(value = "lineal", required = false) Integer lineal,
                              Model model) {
        TiendaCampanya tienda = tiendaCampanyaRepository.findById(id).orElse(null);;
        AsignacionTurno asignacionTurno = this.asignacionTurnoRepository.buscarTurnoEspecifico(id, turno, lineal).orElse(null);

        if (asignacionTurno == null) {
            asignacionTurno = new AsignacionTurno();
            asignacionTurno.setTiendaCampanya(tienda);
            asignacionTurno.setLineal(lineal);
            asignacionTurno.setTipoTurno(this.tipoTurnoRepository.findById(turno).orElse(null));
        }

        model.addAttribute("colaboradores", this.colaboradoresRespository.findAll());
        model.addAttribute("asignacionTurno", asignacionTurno);
        model.addAttribute("currentSection", "turnos");
        return "turnos/formulario_turno";
    }

    @PostMapping("/guardarTurno")
    public String guardarTurno(@RequestParam(value = "id", required = false) Integer id,
                               @RequestParam("tiendaCampanyaId") Integer tiendaCampanyaId,
                               @RequestParam("tipoTurnoId") Integer tipoTurnoId,
                               @RequestParam("lineal") Integer lineal,
                               @RequestParam("idColaborador") Integer idColaborador,
                               @RequestParam("horaInicio") LocalTime horaInicio,
                               @RequestParam("horaFin") LocalTime horaFin,
                               @RequestParam("numVoluntarios") Integer numVoluntarios,
                               @RequestParam("observaciones") String observaciones) {
        AsignacionTurno asignacionTurno = new AsignacionTurno();
        asignacionTurno.setId(id);
        asignacionTurno.setTiendaCampanya(tiendaCampanyaRepository.findById(tiendaCampanyaId).orElse(null));
        asignacionTurno.setLineal(lineal);
        asignacionTurno.setTipoTurno(this.tipoTurnoRepository.findById(tipoTurnoId).orElse(null));
        asignacionTurno.setColaborador(this.colaboradoresRespository.findById(idColaborador).orElse(null));
        asignacionTurno.setHoraInicio(horaInicio);
        asignacionTurno.setHoraFin(horaFin);
        asignacionTurno.setNumVoluntarios(numVoluntarios);
        asignacionTurno.setObservaciones(observaciones);
        this.asignacionTurnoRepository.save(asignacionTurno);

        return "redirect:/turnos";
    }
}
