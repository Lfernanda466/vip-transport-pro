package com.vip_transport_pro.app.controller;

import java.util.Arrays;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import com.vip_transport_pro.app.model.Reserva;
import com.vip_transport_pro.app.service.ReservaService;

@Controller
public class JstlController {

    @Autowired
    private ReservaService reservaService;

    @GetMapping("/nivel2")
    public String mostrarNivel2(Model model) {
        // Listas para demostrar el uso de <c:forEach>
        List<String> servicios = Arrays.asList("AEROPUERTO", "POR_HORAS", "PUNTO_A_PUNTO", "EVENTO");
        List<String> vehiculos = Arrays.asList("SEDAN_EJECUTIVO", "SUV_LUJO", "VAN_SPRINTER", "LIMOSINA");
        
        model.addAttribute("servicios", servicios);
        model.addAttribute("vehiculos", vehiculos);
        model.addAttribute("reserva", new Reserva());
        return "formulario_jstl";
    }

    @PostMapping("/guardarNivel2")
    public String guardarNivel2(@ModelAttribute Reserva reserva, Model model) {
        reservaService.guardar(reserva);
        model.addAttribute("mensaje", "¡Reserva Nivel 2 (JSTL) guardada con éxito!");
        return "formulario_jstl";
    }
}