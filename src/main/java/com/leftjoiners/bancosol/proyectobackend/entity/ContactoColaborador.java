package com.leftjoiners.bancosol.proyectobackend.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "contacto_colaborador")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ContactoColaborador {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "id_colaborador")
    private Colaborador colaborador;

    private String nombre;
    private String email;
    private String telefono;

    @Column(name = "es_principal")
    private Boolean esPrincipal;
}