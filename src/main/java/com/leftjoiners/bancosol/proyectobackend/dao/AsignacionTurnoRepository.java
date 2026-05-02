package com.leftjoiners.bancosol.proyectobackend.dao;

import com.leftjoiners.bancosol.proyectobackend.entity.AsignacionTurno;
import com.leftjoiners.bancosol.proyectobackend.entity.VistaAsignacionColaboradores;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Optional;

public interface AsignacionTurnoRepository extends JpaRepository<AsignacionTurno, Integer> {
    @Query("SELECT a FROM AsignacionTurno a " +
            "WHERE a.tiendaCampanya.id = :id " +
            "AND a.tipoTurno.id = :turno " +
            "AND (a.lineal = :linealActual OR a.lineal IS NULL)")
    public Optional<AsignacionTurno> buscarTurnoEspecifico(@Param("id") Integer id,
                                                    @Param("turno") Integer turno,
                                                    @Param("linealActual") Integer linealActual);

}
