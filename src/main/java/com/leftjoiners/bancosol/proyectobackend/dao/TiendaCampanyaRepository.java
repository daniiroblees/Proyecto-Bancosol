package com.leftjoiners.bancosol.proyectobackend.dao;

import com.leftjoiners.bancosol.proyectobackend.entity.AsignacionTurno;
import com.leftjoiners.bancosol.proyectobackend.entity.TiendaCampanya;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface TiendaCampanyaRepository extends JpaRepository<TiendaCampanya, Integer> {
}
