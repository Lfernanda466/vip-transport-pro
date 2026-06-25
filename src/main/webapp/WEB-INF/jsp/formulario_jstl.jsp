<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>VIP Transport - Nivel 2 JSTL</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .card { border-top: 5px solid #0d6efd; }
        .section-header { background: #e9ecef; padding: 10px; font-weight: bold; margin-top: 20px; }
    </style>
</head>
<body class="bg-light">
    <div class="container py-5">
        <div class="card shadow">
            <div class="card-header bg-primary text-white text-center">
                <h2>Nivel 2: Implementación JSTL</h2>
            </div>
            <div class="card-body">
                <c:if test="${not empty mensaje}">
                    <div class="alert alert-success">${mensaje}</div>
                </c:if>

                <form action="/guardarNivel2" method="post">
                    <!-- Secciones 1 y 2 -->
                    <div class="section-header">1 y 2. Solicitante y Servicio</div>
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label>Nombre Completo</label>
                            <input type="text" name="nombreCompleto" class="form-control" value="${reserva.nombreCompleto}">
                        </div>
                        <div class="col-md-6">
                            <label>Tipo de Servicio</label>
                            <select name="tipoServicio" class="form-select">
                                <c:forEach items="${servicios}" var="s">
                                    <option value="${s}">${s}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label>Fecha</label>
                            <input type="date" name="fechaServicio" class="form-control">
                        </div>
                    </div>

                    <!-- Sección 5: Lógica Condicional con JSTL -->
                    <div class="section-header">5. Datos de Vuelo (Solo si aplica)</div>
                    <p class="text-muted small">Uso de etiquetas c:if para validación de vista</p>
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label>Número de Vuelo</label>
                            <input type="text" name="numeroVuelo" class="form-control">
                        </div>
                    </div>

                    <!-- Sección 8: Confirmación -->
                    <div class="section-header">8. Confirmación Legal</div>
                    <div class="form-check mt-3">
                        <input type="checkbox" name="aceptaTerminos" class="form-check-input" id="check1">
                        <label class="form-check-label" for="check1">Autorizo tratamiento de datos (Ley 1581)</label>
                    </div>

					<!-- Agregamos un ID al formulario y una pequeña lógica al botón -->
					<button type="submit" class="btn btn-gold" onclick="this.disabled=true;this.form.submit();">
					    Confirmar Reserva Premium
					</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>