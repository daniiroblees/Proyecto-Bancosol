package com.leftjoiners.bancosol.proyectobackend.entity;

import jakarta.persistence.*;
import lombok.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "tienda_campanya")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class TiendaCampanya {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "id_tienda")
    private Tienda tienda;

    @ManyToOne
    @JoinColumn(name = "id_campanya")
    private Campanya campanya;

    @ManyToOne
    @JoinColumn(name = "id_coordinador")
    private Usuario coordinador;

    @ManyToOne
    @JoinColumn(name = "id_capitan")
    private Usuario capitan;

    @OneToMany(mappedBy = "tiendaCampanya")
    private List<AsignacionTurno> turnos = new ArrayList<>();
}