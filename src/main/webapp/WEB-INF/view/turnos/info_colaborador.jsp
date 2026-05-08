<%@ page import="com.leftjoiners.bancosol.proyectobackend.entity.AsignacionTurno" %>
<%@ page import="com.leftjoiners.bancosol.proyectobackend.entity.Tienda" %>
<%@ page import="com.leftjoiners.bancosol.proyectobackend.entity.Colaborador" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Colaborador colaborador = (Colaborador) request.getAttribute("colaborador");
%>

<div style="padding: 40px">
    <%= colaborador != null ? colaborador.getNombre() : "No hay"%>
</div>