<%@ page import="java.util.List" %>
<%@ page import="com.leftjoiners.bancosol.proyectobackend.entity.Tienda" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Tiendas</title>
        <link rel="stylesheet" href="/css/tiendas.css">
    </head>
    <body>
    <%
        List<Tienda> tiendas = (List<Tienda>) request.getAttribute("tiendas");
    %>
        <header>
            <img id="logo" src="/images/LOGO_BANCOSOL.png" alt="Logo Bancosol">
            <h1>GESTIÓN DE CAMPAÑAS - TIENDAS</h1>
        </header>
        <main>
            <section>
                <h2>Filtrado</h2>
                <div id="filtrado-tiendas">
                    <select name="cadena" id="cadena-tienda">
                        <option id="i"> FALTA por llamar a un bucle de caada cosa </option>
                    </select>
                </div>
            </section>

            <section>
                <h2>Tiendas</h2>
                <div id="seleccion-tiendas">
                    <table>
                        <thead>
                            <tr>
                                <th rowspan="2">TIENDA</th>
                                <th rowspan="2">P</th>
                                <th rowspan="2">DOMICILIO</th>
                                <th rowspan="2">LOCALIDAD</th>
                                <th rowspan="2">Pr</th>
                                <th rowspan="1" colspan="2">COORDINADOR</th>
                            </tr>
                            <tr>
                                <th>PRIMAVERA</th>
                                <th>GRAN RECOGIDA</th>
                            </tr>
                        </thead>

                        <tbody>
                            <%
                                for(Tienda tienda : tiendas){
                            %>
                            <tr>
                                <td><%= tienda.getNombre() %></td>
                                <td class="check-participa"><input  type="checkbox" name="participa" value="<%=tienda.getId()%>"> </td>
                                <td> <%= tienda.getDomicilio() %></td>
                                <td> <%= tienda.getLocalidad().getNombre() %></td>
                                <td> PR </td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
            </section>


        </main>
    </body>
</html>