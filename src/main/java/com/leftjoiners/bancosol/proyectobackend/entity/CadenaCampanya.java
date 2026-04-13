package com.leftjoiners.bancosol.proyectobackend.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "cadena_campanya")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class CadenaCampanya {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "id_cadena")
    private Cadena cadena;

    @ManyToOne
    @JoinColumn(name = "id_campanya")
    private Campanya campanya;

    private Boolean participa;
}