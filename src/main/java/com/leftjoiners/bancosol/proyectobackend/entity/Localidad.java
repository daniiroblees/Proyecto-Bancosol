package com.leftjoiners.bancosol.proyectobackend.entity;

import jakarta.persistence.*;
import lombok.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "localidad")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Localidad {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String nombre;

    @ManyToOne
    @JoinColumn(name = "id_municipio")
    private Municipio municipio;

    @OneToMany(mappedBy = "localidad")
    private List<Tienda> tiendas = new ArrayList<>();

    @OneToMany(mappedBy = "localidad")
    private List<Usuario> usuarios = new ArrayList<>();

    @OneToMany(mappedBy = "localidadSede")
    private List<Colaborador> colaboradoresSede = new ArrayList<>();

    @OneToMany(mappedBy = "colaboraEn")
    private List<Colaborador> colaboradoresColaboran = new ArrayList<>();
}