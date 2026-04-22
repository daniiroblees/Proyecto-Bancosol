package com.leftjoiners.bancosol.proyectobackend.dao;

import com.leftjoiners.bancosol.proyectobackend.entity.Colaborador;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ColaboradoresRespository  extends JpaRepository<Colaborador, Integer> {
}
