package com.leftjoiners.bancosol.proyectobackend.entity;

import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "campanya")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Campanya {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "id_tipo")
    private TipoCampanya tipoCampanya;

    @Column(nullable = false)
    private String nombre;

    @Column(name = "fecha_inicio")
    private LocalDate fechaInicio;

    @Column(name = "fecha_fin")
    private LocalDate fechaFin;

    private Integer duracion;

    @OneToMany(mappedBy = "campanya")
    private List<CadenaCampanya> cadenasCampanya = new ArrayList<>();

    @OneToMany(mappedBy = "campanya")
    private List<TiendaCampanya> tiendasCampanya = new ArrayList<>();
}