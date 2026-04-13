package com.leftjoiners.bancosol.proyectobackend.entity;

import jakarta.persistence.*;
import lombok.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "distrito")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Distrito {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private Integer numero;
    private String nombre;

    @OneToMany(mappedBy = "distrito")
    private List<Tienda> tiendas = new ArrayList<>();

    @OneToMany(mappedBy = "distrito")
    private List<Usuario> usuarios = new ArrayList<>();
}