<%@ page import="com.leftjoiners.bancosol.proyectobackend.entity.AsignacionTurno" %>
<%@ page import="com.leftjoiners.bancosol.proyectobackend.entity.Tienda" %>
<%@ page import="com.leftjoiners.bancosol.proyectobackend.entity.Colaborador" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    AsignacionTurno asignacionTurno = (AsignacionTurno) request.getAttribute("asignacionTurno");
    Tienda tienda = asignacionTurno.getTiendaCampanya().getTienda();
    List<Colaborador> colaboradores = (List<Colaborador>) request.getAttribute("colaboradores");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Asignación de Turno</title>
    <link rel="stylesheet" href="/css/global.css" />
    <link rel="stylesheet" href="/css/formularioTurno.css" />
    <link href="https://cdn.jsdelivr.net/npm/remixicon@3.5.0/fonts/remixicon.css" rel="stylesheet">
</head>
<body class="formulario-turno-page">

<jsp:include page="../shared/navbar.jsp"/>
<div style="display: flex; flex-direction: row" >
    <div class="form-turno">
        <div class="turno-info">
            <div class="turno-info-row">
                <span><%=tienda.getNombre()%> - <span class="text-mutex"><%=tienda.getDomicilio()%></span></span>
                <span><%=asignacionTurno.getTipoTurno().getNombre()%></span>
            </div>
            <div class="turno-info-row">
                <span></span>
                <span>Lineal <%=asignacionTurno.getLineal()%></span>
            </div>
        </div>

        <form action="/turnos/guardarTurno" method="post">
            <input type="hidden" value="<%=asignacionTurno.getId() != null ? asignacionTurno.getId() : ""%>" name="id">
            <input type="hidden" value="<%=asignacionTurno.getTiendaCampanya().getId()%>" name="tiendaCampanyaId">
            <input type="hidden" value="<%=asignacionTurno.getTipoTurno().getId()%>" name="tipoTurnoId">
            <input type="hidden" value="<%=asignacionTurno.getLineal()%>" name="lineal">

            <div class="form-group">
                <label for="input_colaboradores">Colaborador:</label>
                <select id="input_colaboradores" name="idColaborador">
                    <option value="0">Seleccione un colaborador...</option>
                    <%for (Colaborador colaborador : colaboradores) {%>
                    <option value="<%=colaborador.getId()%>" <%=asignacionTurno.getColaborador() != null && asignacionTurno.getColaborador().equals(colaborador) ? "selected" : "" %>>
                        <%=colaborador.getNombre()%>
                    </option>
                    <%}%>
                </select>
            </div>

            <div class="form-group">
                <label for="input_num_voluntarios">Número de voluntarios:</label>
                <input id="input_num_voluntarios" type="number" name="numVoluntarios"
                       value="<%=asignacionTurno.getNumVoluntarios() != null ? asignacionTurno.getNumVoluntarios() : ""%>">
            </div>

            <div class="form-group-row">
                <div class="form-group">
                    <label for="input_hora_inicio">Hora Inicio:</label>
                    <input id="input_hora_inicio" type="time" name="horaInicio"
                           value="<%=asignacionTurno.getHoraInicio() != null ? asignacionTurno.getHoraInicio() : ""%>">
                </div>

                <div class="form-group">
                    <label for="input_hora_fin">Hora Fin:</label>
                    <input id="input_hora_fin" type="time" name="horaFin"
                           value="<%=asignacionTurno.getHoraFin() != null ? asignacionTurno.getHoraFin() : ""%>">
                </div>
            </div>

            <div class="form-group">
                <label for="input_observaciones">Observaciones:</label>
                <textarea id="input_observaciones" name="observaciones" rows="4"><%=asignacionTurno.getObservaciones() != null ? asignacionTurno.getObservaciones() : ""%></textarea>
            </div>

            <button type="submit" class="btn-submit">Guardar Turno</button>
        </form>
    </div>
    <div id="colaborador_container">
        <jsp:include page="../colaboradores/info_colaboradores.jsp"/>
    </div>
</div>
</body>
<script>
    const colaboradorContainer = document.querySelector("#colaborador_container");
    const inputColaboradores = document.querySelector("#input_colaboradores");
    let colaboradorActual = inputColaboradores.value;

    function fetchColaboradorData() {
        if (colaboradorActual == 0) {
            colaboradorContainer.innerHTML = "";
            return;
        }

        const params = new URLSearchParams();
        params.append("id", colaboradorActual);

        fetch("/turnos/buscarColaborador", {
            method: "POST",
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            },
            body: params.toString()
        })
            .then(response => response.text())
            .then(html => {colaboradorContainer.innerHTML = html})
            .catch(error => console.error("Error:", error));
    }

    inputColaboradores.addEventListener("change", (e) => {
        colaboradorActual = e.target.value;
        fetchColaboradorData();
    })
</script>
</html>