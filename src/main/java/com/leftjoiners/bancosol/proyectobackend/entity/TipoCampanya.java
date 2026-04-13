package com.leftjoiners.bancosol.proyectobackend.entity;

import jakarta.persistence.*;
import lombok.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "tipo_campanya")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class TipoCampanya {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String nombre;

    @OneToMany(mappedBy = "tipoCampanya")
    private List<Campanya> campanyas = new ArrayList<>();
}