package com.vip_transport_pro.app.controller;

import java.time.LocalDate;
import java.time.LocalTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import com.vip_transport_pro.app.model.Reserva;
import com.vip_transport_pro.app.service.ReservaService;
import jakarta.servlet.http.HttpServletRequest;

@Controller
public class VipController {

    @Autowired
    private ReservaService reservaService;

    @GetMapping("/nivel1")
    public String nivel1(Model model) {
        model.addAttribute("titulo", "Nivel 1 JSP Puro");
        return "formulario_puro";
    }

    @PostMapping("/guardarNivel1")
    public String guardarNivel1(HttpServletRequest request, Model model) {
        try {
            Reserva r = new Reserva();
            r.setNombreCompleto(request.getParameter("nombre"));
            r.setCelularFull(request.getParameter("codPais") + " " + request.getParameter("telefono"));
            r.setCorreo(request.getParameter("correo"));
            r.setEmpresa(request.getParameter("empresa"));
            r.setDocumentoIdentidad(request.getParameter("documento"));
            r.setTipoServicio(request.getParameter("tipoServicio"));
            r.setFechaServicio(LocalDate.parse(request.getParameter("fecha")));
            r.setHoraRecogida(LocalTime.parse(request.getParameter("hora")));
            r.setOrigen(request.getParameter("origen"));
            r.setDestino(request.getParameter("destino"));
            r.setTrayecto(request.getParameter("trayecto"));

            if ("REGRESO".equals(request.getParameter("trayecto"))) {
                r.setFechaRegreso(LocalDate.parse(request.getParameter("fechaRegreso")));
                r.setHoraRegreso(LocalTime.parse(request.getParameter("horaRegreso")));
            }

            r.setNumPasajeros(Integer.parseInt(request.getParameter("numPasajeros")));
            r.setNombrePasajeroVip(request.getParameter("nombreVip"));
            r.setEquipajeDetalle(request.getParameter("equipaje"));
            r.setSillaNinosCant(request.getParameter("sillaCant"));
            r.setSillaNinosEdad(request.getParameter("sillaEdad"));
            r.setAccesibilidad(request.getParameter("accesibilidad"));
            r.setCategoriaVehiculo(request.getParameter("categoriaVehiculo"));
            r.setCapacidadRequerida(request.getParameter("capacidad"));
            r.setMarcaColor(request.getParameter("marcaColor"));
            r.setCaracteristicasVehiculo(request.getParameter("caracteristicas"));
            r.setNumVuelo(request.getParameter("numVuelo"));
            r.setAerolinea(request.getParameter("aerolinea"));
            
            if (request.getParameter("horaLlegada") != null && !request.getParameter("horaLlegada").isEmpty()) {
                r.setHoraLlegadaVuelo(LocalTime.parse(request.getParameter("horaLlegada")));
            }
            
            r.setNombreCartel(request.getParameter("nombreCartel"));
            r.setIdiomaConductor(request.getParameter("idioma"));
            r.setSeguridadEscolta(request.getParameter("seguridad"));
            r.setTipoSeguridad(request.getParameter("tipoSeguridad")); // NUEVO
            r.setAmenidades(request.getParameter("amenidades"));
            r.setMusicaPref(request.getParameter("musica"));
            r.setTemperaturaPref(request.getParameter("temperatura"));
            r.setNotasEspeciales(request.getParameter("notas"));
            r.setMetodoPago(request.getParameter("metodoPago"));
            r.setDatosFacturacion(request.getParameter("facturacion"));
            r.setCentroCostos(request.getParameter("centroCostos"));
            r.setCupon(request.getParameter("cupon"));
            r.setAceptaTerminos(request.getParameter("aceptaTerminos") != null);
            r.setAceptaDatos(request.getParameter("aceptaDatos") != null);
            r.setAceptaCancelacion(request.getParameter("aceptaCancelacion") != null);

            Reserva guardada = reservaService.guardar(r);
            return "redirect:/resumen/" + guardada.getId();
        } catch (Exception e) {
            model.addAttribute("error", "Error: " + e.getMessage());
            return "formulario_puro";
        }
    }
}