package com.leftjoiners.bancosol.proyectobackend.entity;

import jakarta.persistence.*;
import lombok.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "municipio")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Municipio {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String nombre;

    @ManyToOne
    @JoinColumn(name = "id_zona")
    private Zona zona;

    @OneToMany(mappedBy = "municipio")
    private List<Localidad> localidades = new ArrayList<>();
}