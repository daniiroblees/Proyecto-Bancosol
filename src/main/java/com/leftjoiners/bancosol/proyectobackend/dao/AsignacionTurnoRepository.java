package com.leftjoiners.bancosol.proyectobackend.dao;

import com.leftjoiners.bancosol.proyectobackend.entity.AsignacionTurno;
import com.leftjoiners.bancosol.proyectobackend.entity.VistaAsignacionColaboradores;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AsignacionTurnoRepository extends JpaRepository<AsignacionTurno, Integer> {
}
