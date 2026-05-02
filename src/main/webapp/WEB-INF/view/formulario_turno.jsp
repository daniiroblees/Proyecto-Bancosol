<%@ page import="com.leftjoiners.bancosol.proyectobackend.entity.AsignacionTurno" %>
<%@ page import="com.leftjoiners.bancosol.proyectobackend.entity.Tienda" %>
<%@ page import="com.leftjoiners.bancosol.proyectobackend.entity.Colaborador" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: javie
  Date: 22/04/2026
  Time: 9:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    AsignacionTurno asignacionTurno = (AsignacionTurno) request.getAttribute("asignacionTurno");
    Tienda tienda = asignacionTurno.getTiendaCampanya().getTienda();

    List<Colaborador> colaboradores = (List<Colaborador>) request.getAttribute("colaboradores");
%>
<html>
<head>
    <title>Asignacion de Turno</title>
</head>
<body>
<h1>Asignacion de Turno</h1>

<div>
<form action="/guardarTurno" method="post">
    <p><%= asignacionTurno.getId() != null ? "Editando turno existente"  : "Creando turno nuevo"%></p>
    <p>Tienda: <%=tienda.getNombre()%> - <%=tienda.getDomicilio()%></p>
    <p>Turno: <%=asignacionTurno.getTipoTurno().getNombre()%></p>
    <p>Lineal: <%=asignacionTurno.getLineal()%></p>

    <input type="hidden" value="<%=asignacionTurno.getId() != null ? asignacionTurno.getId() : ""%>" name="id">
    <input type="hidden" value="<%=asignacionTurno.getTiendaCampanya().getId()%>" name="tiendaCampanyaId">
    <input type="hidden" value="<%=asignacionTurno.getTipoTurno().getId()%>" name="tipoTurnoId">
    <input type="hidden" value="<%=asignacionTurno.getLineal()%>" name="lineal">
    <p>
        <label for="input_colaboradores">Colaborador: </label>
        <select id="input_colaboradores" name="idColaborador">
            <%for (Colaborador colaborador : colaboradores) {%>
                <option value="<%=colaborador.getId()%>" <%=asignacionTurno.getColaborador() != null && asignacionTurno.getColaborador().equals(colaborador) ? "selected" : "" %>> <%=colaborador.getNombre()%></option>
            <%}%>
        </select>
    </p>
    <p>
        <label for="input_num_voluntarios">Numero de voluntarios: </label>
        <input id="input_num_voluntarios" type="number" name="numVoluntarios" value="<%=asignacionTurno.getNumVoluntarios() != null ? asignacionTurno.getNumVoluntarios() : ""%>">
    </p>
    <p>
        <label for="input_hora_inicio">Hora Inicio</label>
        <input id="input_hora_inicio" type="time" name="horaInicio" value="<%=asignacionTurno.getHoraInicio() != null ? asignacionTurno.getHoraInicio() : ""%>">
    </p>

    <p>
        <label for="input_hora_fin">Hora Fin</label>
        <input id="input_hora_fin" type="time" name="horaFin" value="<%=asignacionTurno.getHoraFin() != null ? asignacionTurno.getHoraFin() : ""%>">
    </p>

    <p>
        <label for="input_observaciones">Observaciones</label>
        <br>
        <textarea id="input_observaciones" name="observaciones" rows="5" cols="30"><%=asignacionTurno.getObservaciones() != null ? asignacionTurno.getObservaciones() : ""%></textarea>
    </p>
    <button type="submit">Guardar</button>
</form>
</div>
</body>
</html>
