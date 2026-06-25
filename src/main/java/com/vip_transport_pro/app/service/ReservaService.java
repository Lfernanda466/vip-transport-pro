package com.vip_transport_pro.app.service;

import java.util.List;
import com.vip_transport_pro.app.model.Reserva;

public interface ReservaService {

    Reserva guardar(Reserva reserva);

    List<Reserva> listarTodas();

}