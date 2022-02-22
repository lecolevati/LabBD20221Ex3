<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="./css/styles.css">
<title>Exercício Ônibus</title>
</head>
<body>

	<div align="center" class="container">
		<form action="onibus" method="post">
			<input class="id_input_data" type="number" min="0" step="1" id="codigo" name="codigo"
				placeholder="Código Viagem">
			<br />
			<input type="submit" id="botao" name="botao" value="Descricao Onibus">
			<br />
			<input type="submit" id="botao" name="botao" value="Descricao Viagem">
		</form>
	</div>
	<br />
	<br />
	<div align="center">
		<H2><c:out value="${erro }" /></H2>
	</div>
	<div align="center">
		<c:if test="${not empty descOn }">
			<table class="table_round">
				<thead>
					<tr>
						<th>Código Viagem</th>
						<th>Motorista</th>
						<th>Placa Ônibus</th>
						<th>Marca Ônibus</th>
						<th>Descrição</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><c:out value="${descOn.codigo }"/></td>
						<td><c:out value="${descOn.motorista }"/></td>
						<td><c:out value="${descOn.placa }"/></td>
						<td><c:out value="${descOn.marca }"/></td>
						<td><c:out value="${descOn.descricao }"/></td>
					</tr>
				</tbody>
			</table>
		</c:if>
	</div>
	<div align="center">
		<c:if test="${not empty descViagem }">
			<table class="table_round">
				<thead>
					<tr>
						<th>Código Viagem</th>
						<th>Placa Ônibus</th>
						<th>Hora Saída</th>
						<th>Hora Chegada</th>
						<th>Partida</th>
						<th>Destino</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><c:out value="${descViagem.codigo }"/></td>
						<td><c:out value="${descViagem.placa }"/></td>
						<td><c:out value="${descViagem.horaSaida }"/></td>
						<td><c:out value="${descViagem.horaChegada }"/></td>
						<td><c:out value="${descViagem.partida }"/></td>
						<td><c:out value="${descViagem.destino }"/></td>
					</tr>
				</tbody>
			</table>
		</c:if>
	</div>

</body>
</html>