package com.leftjoiners.bancosol.proyectobackend.entity;

import jakarta.persistence.*;
import lombok.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "usuario")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Usuario {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "id_rol")
    private Rol rol;

    private String usuario;
    private String contrasenya;
    private String nombre;
    private String telefono;
    private String email;

    @ManyToOne
    @JoinColumn(name = "id_entidad")
    private EntidadInstitucional entidad;

    @ManyToOne
    @JoinColumn(name = "id_zona_asignada")
    private Zona zonaAsignada;

    @ManyToOne
    @JoinColumn(name = "id_localidad")
    private Localidad localidad;

    private Integer cp;

    @ManyToOne
    @JoinColumn(name = "id_distrito")
    private Distrito distrito;

    // Relaciones inversas (Un usuario puede coordinar colaboradores y tiendas)
    @OneToMany(mappedBy = "coordinador")
    private List<Colaborador> colaboradoresCoordinados = new ArrayList<>();

    @OneToMany(mappedBy = "coordinador")
    private List<TiendaCampanya> tiendasCoordinadas = new ArrayList<>();

    @OneToMany(mappedBy = "capitan")
    private List<TiendaCampanya> tiendasCapitaneadas = new ArrayList<>();
}