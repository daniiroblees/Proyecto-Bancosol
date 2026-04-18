<%-- Created by IntelliJ IDEA. User: javie Date: 18/04/2026 Time: 23:35 To
change this template use File | Settings | File Templates. --%> <%@ page
contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>Title</title>
    <link rel="stylesheet" href="/css/voluntarios.css" />
  </head>
  <body>
    <h1>Asignación de voluntarios</h1>
    <table>
      <thead>
        <tr>
          <th>Tienda</th>
          <th>Domicilio</th>
          <th>Localidad</th>
          <th>Capitan</th>
          <th>Viernes Mañana</th>
          <th>Viernes Tarde</th>
          <th>Sabado Mañana</th>
          <th>Sabado Tarde</th>
          <th>Observaciones</th>
        </tr>
      </thead>
      <tbody id="table-body">
        <tr>
          <td>Tienda 1</td>
          <td>Domicilio 1</td>
          <td>Localidad 1</td>
          <td>Capitan 1</td>
          <td>Viernes Mañana 1</td>
          <td>Viernes Tarde 1</td>
          <td>Sabado Mañana 1</td>
          <td>Sabado Tarde 1</td>
          <td>Observaciones 1</td>
        </tr>
      </tbody>
    </table>
	<div id="volunteer-container">
		<div id="volunteer-localization">
			<div><p>Carrefour </p></div>
			<div><p>Calle Principal</p></div>
		</div>
		<div id="volunteer-schedule">
			<label for="volunteer-1">
				<input type="checkbox" id="volunteer-1" />
				Voluntario 1
			</label>
			<label for="volunteer-2">
				<input type="checkbox" id="volunteer-2" />
				Voluntario 2
			</label>
			<label for="volunteer-3">
				<input type="checkbox" id="volunteer-3" />
				Voluntario 3
			</label>
		</div>
		<div id="volunteer-info">
			<div id="volunteer-name">
				<div >
					<p>AYUNTAMIETNO DE ALMAYATE</p>
				</div>
				<div class="volunteer-date">
					<div>COMIENZO</div>
					<div>10</div>
				</div>
				<div class="volunteer-date">
					<div>FIN</div>
					<div>14</div>
				</div>
			</div>
			<div id="volunteer-observations">
				<p>TENEMOS 10 VOLUNTARIOS DISPONIBLES</p>
			</div>
		</div>
	</div>
  </body>
  <script>
	const tr = document.querySelector("#table-body tr");
	for (let i = 0; i < 2; i++)
		tr.parentNode.appendChild(tr.cloneNode(true));
  </script>
</html>
