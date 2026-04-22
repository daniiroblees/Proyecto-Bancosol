<%@ page import="com.leftjoiners.bancosol.proyectobackend.entity.Colaborador" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: marin
  Date: 20/04/2026
  Time: 13:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Colaboradores</title>
    <link rel="stylesheet" href="/css/colaboradores.css" />
</head>
<body>
    <%
        List<Colaborador> colaboradores = (List<Colaborador>) request.getAttribute("colaboradores");
    %>
    <h1>Colaboradores</h1>
    <main>
        <section class="display-fila">
            <table>
                <thead>
                <tr>
                    <th>Colaborador</th>
                    <th>Domicilio</th>
                    <th>Localidad</th>
                    <th>Colabora en</th>
                    <th>Coordinador</th>
                    <th>Contacto Principal</th>
                    <th>Observaciones</th>
                </tr>
                </thead>
                <tdata>
                    <%
                        for (Colaborador colaborador : colaboradores) {

                    %>
                    <tr>
                        <td><%=colaborador.getNombre()%></td>
                        <td><%=colaborador.getDomicilio()%></td>
                        <td><%=colaborador.getLocalidadSede().getNombre()%></td>
                        <td><%=colaborador.getColaboraEn().getNombre()%></td>
                        <td><%=colaborador.getCoordinador().getNombre()%></td>
                        <td><%=colaborador.getContactoPrincipal()%></td>
                        <td><%=colaborador.getObservaciones()%></td>
                    </tr>
                    <%
                        }
                    %>
                </tdata>
            </table>
            <table>
                <thead>
                    <tr>
                        <th colspan="3">Colaborador seleccionado</th>
                    </tr>
                </thead>
                <tr>
                    <td>COLABORADOR</td>
                    <td colspan="2">Ayuntamiento de Málaga 1</td>
                </tr>
                <tr>
                    <td>DOMICILIO</td>
                    <td colspan="2">Dirección 1</td>
                </tr>
                <tr>
                    <td>CP-LOCALIDAD</td>
                    <td>00000</td>
                    <td>Málaga</td>
                </tr>
                <tr>
                    <td>COLABORA EN</td>
                    <td colspan="2">Málaga</td>
                </tr>
                <tr>
                    <td rowspan="3"> CONTACTO 1</td>
                    <td>Nombre</td>
                    <td>Pepe Perez 1</td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td>correopepe@correo.com</td>
                </tr>
                <tr>
                    <td>Teléfono</td>
                    <td>111111111</td>
                </tr>
                <tr>
                    <td rowspan="3"> CONTACTO 2</td>
                    <td>Nombre</td>
                    <td>Pepe Perez 2</td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td>correopepe2@correo.com</td>
                </tr>
                <tr>
                    <td>Teléfono</td>
                    <td>222222222</td>
                </tr>
                <tr>
                    <td rowspan="3"> CONTACTO 3</td>
                    <td>Nombre</td>
                    <td>Pepe Perez 3</td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td>correopepe3@correo.com</td>
                </tr>
                <tr>
                    <td>Teléfono</td>
                    <td>333333333</td>
                </tr>
            </table>
        </section>
    </main>
</body>
</html>
