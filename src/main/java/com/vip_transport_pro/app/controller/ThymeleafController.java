package com.vip_transport_pro.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.vip_transport_pro.app.model.Reserva;
import com.vip_transport_pro.app.repository.ReservaRepository;

@Controller
public class ThymeleafController {

    @Autowired
    private ReservaRepository reservaRepository;

    // 1. Muestra el formulario Nivel 3 (Thymeleaf)
    @GetMapping("/nivel3")
    public String nivel3(Model model) {
        model.addAttribute("reserva", new Reserva());
        model.addAttribute("titulo", "Nivel 3 - Experiencia VIP");
        return "formulario_thymeleaf";
    }

    // 2. Procesa el guardado del Nivel 3 y salta al resumen
    @PostMapping("/guardarNivel3")
    public String guardarNivel3(@ModelAttribute("reserva") Reserva reserva) {
        // Guardamos y obtenemos el objeto con su ID generado por MySQL
        Reserva guardada = reservaRepository.save(reserva);
        // Redireccionamos a la URL del resumen
        return "redirect:/resumen/" + guardada.getId();
    }

    // 3. ESTE ES EL CÓDIGO QUE ME PEDISTE (EL BUSCADOR DEL RESUMEN)
    @GetMapping("/resumen/{id}")
    public String verResumen(@PathVariable("id") Long id, Model model) {
        // Buscamos la reserva directamente en la base de datos por su ID
        Reserva reserva = reservaRepository.findById(id).orElse(null);
        
        if (reserva == null) {
            // Si el ID no existe, lo mandamos al formulario inicial
            return "redirect:/nivel1";
        }
        
        // Pasamos el objeto 'reserva' a la vista resumen_vip.html
        model.addAttribute("reserva", reserva);
        return "resumen_vip"; 
    }
}