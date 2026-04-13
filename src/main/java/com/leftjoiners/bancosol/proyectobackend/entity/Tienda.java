package com.leftjoiners.bancosol.proyectobackend.entity;

import jakarta.persistence.*;
import lombok.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "tienda")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Tienda {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "id_cadena")
    private Cadena cadena;

    private String nombre;
    private Integer lineales;

    @ManyToOne
    @JoinColumn(name = "id_localidad")
    private Localidad localidad;

    private String cp;

    @ManyToOne
    @JoinColumn(name = "id_distrito")
    private Distrito distrito;

    private String domicilio;

    @OneToMany(mappedBy = "tienda")
    private List<TiendaCampanya> tiendasCampanya = new ArrayList<>();
}