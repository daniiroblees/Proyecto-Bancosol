<%@ page import="com.leftjoiners.bancosol.proyectobackend.entity.TiendaCampanya" %>
<%@ page import="com.leftjoiners.bancosol.proyectobackend.entity.AsignacionTurno" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Integer id = (Integer) request.getAttribute("id");

    if (id == null) {
%>
    <jsp:include page="info_turno_placeholder.jsp"/>
<%
        return; // Esto hace que el resto del JSP no se procese
    }

    Integer turno = (Integer) request.getAttribute("turno");

    TiendaCampanya tienda = (TiendaCampanya) request.getAttribute("tienda");
    List<AsignacionTurno> turnos = tienda.getTurnos();
    AsignacionTurno asignacionTurno = turnos.stream().filter(t -> t.getTipoTurno().getId().equals(turno)).findFirst().orElse(null);

    if (asignacionTurno == null) {
%>
    <jsp:include page="info_turno_placeholder.jsp"/>
<%
        return;
    }
%>
<div id="volunteer-container">
    <div id="volunteer-localization">
        <div><p id="lbl-tienda"><%= (tienda != null && tienda.getTienda() != null) ? tienda.getTienda().getNombre() : "Seleccione una tienda" %></p></div>
        <div><p id="lbl-domicilio"><%= tienda.getTienda().getDomicilio() %></p></div>
    </div>
    <div id="volunteer-schedule">
        <label for="viernes_manana">
            <input type="radio" id="viernes_manana" name="schedule" value="1" <%= turno == 1 ? "checked" : "" %> />
            Viernes mañana
        </label>
        <label for="viernes_tarde">
            <input type="radio" id="viernes_tarde" name="schedule" value="2" <%= turno == 2 ? "checked" : "" %> />
            Viernes Tarde
        </label>
        <label for="sabado_manana">
            <input type="radio" id="sabado_manana" name="schedule" value="3" <%= turno == 3 ? "checked" : "" %> />
            Sabado Mañana
        </label>
        <label for="sabado_tarde">
            <input type="radio" id="sabado_tarde" name="schedule" value="4" <%= turno == 4 ? "checked" : "" %> />
            Sabado Tarde
        </label>
    </div>
    <div id="volunteer-info">
        <div id="volunteer-name">
            <div>
                <p id="lbl-capitan"><%= asignacionTurno.getColaborador().getNombre()%></p>
            </div>
            <div class="volunteer-date">
                <div>COMIENZO</div>
                <div><%= asignacionTurno.getHoraInicio()%></div>
            </div>
            <div class="volunteer-date">
                <div>FIN</div>
                <div><%= asignacionTurno.getHoraFin()%></div>
            </div>
        </div>
        <div id="volunteer-observations">
            <p><%= asignacionTurno.getObservaciones()%></p>
        </div>
    </div>
</div>
<div id="button-container">
    <button id="save-button">Guardar</button>
    <button id="cancel-button">Cancelar</button>
    <button id="export-button">Exportar</button>
</div>