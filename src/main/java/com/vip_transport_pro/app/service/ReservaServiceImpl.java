package com.vip_transport_pro.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vip_transport_pro.app.model.Reserva;
import com.vip_transport_pro.app.repository.ReservaRepository;

@Service
public class ReservaServiceImpl implements ReservaService {

    @Autowired
    private ReservaRepository repository;

    @Override
    public Reserva guardar(Reserva reserva) {

        return repository.save(reserva);

    }

    @Override
    public List<Reserva> listarTodas() {

        return repository.findAll();

    }

}