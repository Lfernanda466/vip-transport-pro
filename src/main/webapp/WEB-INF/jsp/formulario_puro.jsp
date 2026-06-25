<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>VIP Transport | Full Dynamic</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body { background: linear-gradient(rgba(0,0,0,0.8), rgba(0,0,0,0.8)), url('https://www.deutschland.de/sites/default/files/styles/image_carousel_mobile/public/media/image/tdt_15052020_wie_familien_in_deutschland_leben_gemeinsam.jpg?itok=1KaBjDjQ'); background-size: cover; background-attachment: fixed; color: white; font-family: 'Poppins', sans-serif; }
        .glass-container { background: rgba(255, 255, 255, 0.05); backdrop-filter: blur(15px); border: 1px solid rgba(212, 175, 55, 0.3); border-radius: 25px; padding: 40px; margin: 30px auto; }
        .gold-text { color: #D4AF37; font-weight: bold; text-transform: uppercase; }
        .section-divider { border-bottom: 1px solid rgba(212, 175, 55, 0.2); margin: 25px 0; padding-bottom: 10px; }
        .form-control, .form-select { background: rgba(0,0,0,0.5); border: 1px solid #444; color: white; }
        .condicional { display: none; }
        .btn-confirmar { background: linear-gradient(45deg, #B8860B, #D4AF37); color: black; font-weight: 900; border-radius: 50px; padding: 20px; width: 100%; border: none; }
    </style>
</head>
<body>
    <div class="container">
        <div class="glass-container col-lg-11">
            <h2 class="text-center mb-5 gold-text">Reserva Premium VIP</h2>
            <form action="/guardarNivel1" method="post">
                <!-- 1. SOLICITANTE -->
                <div class="section-divider"><h5 class="gold-text">1. Solicitante</h5></div>
                <div class="row g-3">
                    <div class="col-md-4"><label>Nombre Completo (*)</label><input type="text" name="nombre" class="form-control" required></div>
                    <div class="col-md-4">
                        <label>Celular (*)</label>
                        <div class="input-group">
                            <select name="codPais" class="form-select" style="max-width: 120px;">
                                <option value="+57">🇨🇴 +57</option><option value="+51">🇵🇪 +51</option><option value="+52">🇲🇽 +52</option>
                                <option value="+53">🇨🇺 +53</option><option value="+54">🇦🇷 +54</option><option value="+55">🇧🇷 +55</option>
                                <option value="+56">🇨🇱 +56</option><option value="+58">🇻🇪 +58</option><option value="+501">🇧🇿 +501</option>
                                <option value="+502">🇬🇹 +502</option><option value="+503">🇸🇻 +503</option><option value="+504">🇭🇳 +504</option>
                                <option value="+505">🇳🇮 +505</option><option value="+506">🇨🇷 +506</option><option value="+507">🇵🇦 +507</option>
                                <option value="+509">🇭🇹 +509</option><option value="+591">🇧🇴 +591</option><option value="+593">🇪🇨 +593</option>
                                <option value="+595">🇵🇾 +595</option><option value="+598">🇺🇾 +598</option>
                            </select>
                            <input type="text" name="telefono" class="form-control" required>
                        </div>
                    </div>
                    <div class="col-md-4"><label>Correo (*)</label><input type="email" name="correo" class="form-control" required></div>
                    <div class="col-md-6"><label>Empresa (Opcional)</label><input type="text" name="empresa" class="form-control"></div>
                    <div class="col-md-6"><label>Documento Identidad</label><input type="text" name="documento" class="form-control"></div>
                </div>

                <!-- 2. SERVICIO -->
                <div class="section-divider"><h5 class="gold-text">2. Detalles del Servicio</h5></div>
                <div class="row g-3">
                    <div class="col-md-4">
                        <label>Tipo de Servicio (*)</label>
                        <select name="tipoServicio" id="tipoServicio" class="form-select" onchange="toggleServicio()">
                            <option value="AEROPUERTO">Traslado Aeropuerto</option>
                            <option value="POR_HORAS">Por Horas</option>
                            <option value="BODA">Boda / Evento</option>
                        </select>
                    </div>
                    <div class="col-md-4"><label>Fecha (*)</label><input type="date" name="fecha" class="form-control" required></div>
                    <div class="col-md-4"><label>Hora Recogida (*)</label><input type="time" name="hora" class="form-control" required></div>
                    <div class="col-md-6"><label>Origen (*)</label><input type="text" name="origen" class="form-control" placeholder="Autocompletado..." required></div>
                    <div class="col-md-6" id="divDestino"><label>Destino</label><input type="text" name="destino" class="form-control"></div>
                    <div class="col-md-4">
                        <label>Trayecto (*)</label>
                        <select name="trayecto" id="trayecto" class="form-select" onchange="toggleRegreso()">
                            <option value="IDA">Solo Ida</option><option value="REGRESO">Ida y Vuelta</option>
                        </select>
                    </div>
                    <div class="col-md-4 condicional" id="divFechaRegreso"><label>Fecha Regreso</label><input type="date" name="fechaRegreso" class="form-control"></div>
                    <div class="col-md-4 condicional" id="divHoraRegreso"><label>Hora Regreso</label><input type="time" name="horaRegreso" class="form-control"></div>
                    <div class="col-md-4 condicional" id="divDuracion"><label>Duración (Horas)</label><input type="number" name="duracion" class="form-control"></div>
                    <div class="col-md-12">
                        <label>¿Paradas Intermedias?</label>
                        <select id="tieneParadas" class="form-select" onchange="toggleParadas()">
                            <option value="NO">No</option><option value="SI">Sí</option>
                        </select>
                    </div>
                    <div class="col-md-12 condicional" id="divParadas"><label>Detalle Paradas</label><input type="text" name="paradas" class="form-control" placeholder="Dirección 1, Dirección 2..."></div>
                </div>

                <!-- 3. PASAJEROS -->
                <div class="section-divider"><h5 class="gold-text">3. Pasajeros y Equipaje</h5></div>
                <div class="row g-3">
                    <div class="col-md-3"><label>Pasajeros (*)</label><input type="number" name="numPasajeros" class="form-control" value="1" required></div>
                    <div class="col-md-5"><label>Nombre Pasajero VIP</label><input type="text" name="nombreVip" class="form-control"></div>
                    <div class="col-md-4"><label>Equipaje (Tipo/Cant)</label><input type="text" name="equipaje" class="form-control"></div>
                    <div class="col-md-4">
                        <label>¿Silla Niños?</label>
                        <select id="tieneSilla" class="form-select" onchange="toggleSilla()">
                            <option value="NO">No</option><option value="SI">Sí</option>
                        </select>
                    </div>
                    <div class="col-md-4 condicional silla"><label>Cantidad</label><input type="number" name="sillaCant" class="form-control"></div>
                    <div class="col-md-4 condicional silla"><label>Edad</label><input type="text" name="sillaEdad" class="form-control"></div>
                    <div class="col-md-12"><label>Accesibilidad (Silla ruedas, etc)</label><input type="text" name="accesibilidad" class="form-control"></div>
                </div>

                <!-- 4. VEHÍCULO -->
                <div class="section-divider"><h5 class="gold-text">4. Vehículo</h5></div>
                <div class="row g-3">
                    <div class="col-md-4">
                        <label>Categoría (*)</label>
                        <select name="categoriaVehiculo" class="form-select">
                            <option>Sedán Ejecutivo</option><option>SUV de Lujo</option><option>Van / Sprinter</option>
                            <option>Limosina</option><option>Vehículo Blindado</option>
                        </select>
                    </div>
                    <div class="col-md-4"><label>Capacidad</label><input type="text" name="capacidad" class="form-control"></div>
                    <div class="col-md-4"><label>Marca/Color</label><input type="text" name="marcaColor" class="form-control"></div>
                    <div class="col-md-12"><label>Características (Wifi, Bebidas, etc)</label><input type="text" name="caracteristicas" class="form-control"></div>
                </div>

                <!-- 5. VUELO -->
                <div id="seccionVuelo" class="condicional">
                    <div class="section-divider"><h5 class="gold-text">5. Datos de Vuelo</h5></div>
                    <div class="row g-3">
                        <div class="col-md-3"><label>No. Vuelo</label><input type="text" name="numVuelo" class="form-control"></div>
                        <div class="col-md-3"><label>Aerolínea</label><input type="text" name="aerolinea" class="form-control"></div>
                        <div class="col-md-3"><label>Hora Llegada</label><input type="time" name="horaLlegada" class="form-control"></div>
                        <div class="col-md-3">
                            <label>Meet & Greet</label>
                            <select id="meetGreet" class="form-select" onchange="toggleCartel()">
                                <option value="NO">No</option><option value="SI">Sí</option>
                            </select>
                        </div>
                        <div class="col-md-12 condicional" id="divCartel"><label>Nombre Cartel</label><input type="text" name="nombreCartel" class="form-control"></div>
                    </div>
                </div>

                <!-- 6. VIP -->
                <div class="section-divider"><h5 class="gold-text">6. Requerimientos VIP</h5></div>
                <div class="row g-3">
                    <div class="col-md-4">
                        <label>Conductor Bilingüe?</label>
                        <select id="bilingue" class="form-select" onchange="toggleIdioma()">
                            <option value="NO">No</option><option value="SI">Sí</option>
                        </select>
                    </div>
                    <div class="col-md-4 condicional" id="divIdioma"><label>Idioma</label><input type="text" name="idioma" class="form-control"></div>
                    <div class="col-md-4">
                        <label>¿Servicio de Seguridad?</label>
                        <select id="seguridad" name="seguridad" class="form-select" onchange="toggleSeguridad()">
                            <option value="NO">No</option><option value="SI">Sí</option>
                        </select>
                    </div>
                    <div class="col-md-4 condicional" id="divSeguridad">
                        <label>Tipo de Seguridad</label>
                        <select name="tipoSeguridad" class="form-select">
                            <option value="ESCOLTA">Servicio de Escolta</option>
                            <option value="SEGURIDAD_ARMADA">Servicio de Seguridad Armada</option>
                        </select>
                    </div>
                    <div class="col-md-4"><label>Amenidades</label><input type="text" name="amenidades" class="form-control"></div>
                    <div class="col-md-4"><label>Música</label><input type="text" name="musica" class="form-control"></div>
                    <div class="col-md-4"><label>Temperatura</label><input type="text" name="temperatura" class="form-control"></div>
                </div>

                <!-- 7. PAGO -->
                <div class="section-divider"><h5 class="gold-text">7. Pago y Facturación</h5></div>
                <div class="row g-3">
                    <div class="col-md-4"><label>Método (*)</label><select name="metodoPago" class="form-select"><option>Tarjeta</option><option>Efectivo</option><option>Crédito/Corp</option></select></div>
                    <div class="col-md-8"><label>Facturación (NIT/Razón)</label><input type="text" name="facturacion" class="form-control"></div>
                    <div class="col-md-4"><label>Centro Costos</label><input type="text" name="centroCostos" class="form-control"></div>
                    <div class="col-md-4">
                        <label>¿Tiene Cupón?</label>
                        <select id="tieneCupon" class="form-select" onchange="toggleCupon()">
                            <option value="NO">No</option><option value="SI">Sí</option>
                        </select>
                    </div>
                    <div class="col-md-4 condicional" id="divCupon"><label>Código Cupón</label><input type="text" name="cupon" class="form-control"></div>
                    <div class="col-md-12"><label>Notas Especiales</label><textarea name="notas" class="form-control" rows="2"></textarea></div>
                </div>

                <!-- 8. CONFIRMACIÓN -->
                <div class="section-divider"><h5 class="gold-text">8. Confirmación Legal</h5></div>
                <div class="form-check"><input type="checkbox" name="aceptaTerminos" class="form-check-input" required><label>Acepto términos</label></div>
                <div class="form-check"><input type="checkbox" name="aceptaDatos" class="form-check-input" required><label>Autorizo datos (Ley 1581)</label></div>
                <div class="form-check mb-4"><input type="checkbox" name="aceptaCancelacion" class="form-check-input" required><label>Acepto cancelación</label></div>

                <button type="submit" class="btn-confirmar">CONFIRMAR RESERVA PREMIUM</button>
            </form>
        </div>
    </div>

    <script>
        function toggleRegreso() { let val = document.getElementById("trayecto").value; document.getElementById("divFechaRegreso").style.display = (val === "REGRESO") ? "block" : "none"; document.getElementById("divHoraRegreso").style.display = (val === "REGRESO") ? "block" : "none"; }
        function toggleSilla() { let val = document.getElementById("tieneSilla").value; document.querySelectorAll(".silla").forEach(el => el.style.display = (val === "SI") ? "block" : "none"); }
        function toggleServicio() { let val = document.getElementById("tipoServicio").value; document.getElementById("seccionVuelo").style.display = (val === "AEROPUERTO") ? "block" : "none"; document.getElementById("divDestino").style.display = (val === "POR_HORAS") ? "none" : "block"; document.getElementById("divDuracion").style.display = (val === "POR_HORAS") ? "block" : "none"; }
        function toggleParadas() { document.getElementById("divParadas").style.display = (document.getElementById("tieneParadas").value === "SI") ? "block" : "none"; }
        function toggleCartel() { document.getElementById("divCartel").style.display = (document.getElementById("meetGreet").value === "SI") ? "block" : "none"; }
        function toggleIdioma() { document.getElementById("divIdioma").style.display = (document.getElementById("bilingue").value === "SI") ? "block" : "none"; }
        function toggleCupon() { document.getElementById("divCupon").style.display = (document.getElementById("tieneCupon").value === "SI") ? "block" : "none"; }
        function toggleSeguridad() { document.getElementById("divSeguridad").style.display = (document.getElementById("seguridad").value === "SI") ? "block" : "none"; }
        window.onload = function() { toggleServicio(); toggleRegreso(); toggleSilla(); toggleParadas(); toggleCartel(); toggleIdioma(); toggleCupon(); toggleSeguridad(); };
    </script>
</body>
</html>