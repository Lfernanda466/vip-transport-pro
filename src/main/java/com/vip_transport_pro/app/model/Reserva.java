package com.vip_transport_pro.app.model;

import jakarta.persistence.*;
import java.time.LocalDate;
import java.time.LocalTime;

@Entity
@Table(name = "solicitudes_vip")
public class Reserva {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String nombreCompleto;
    private String celularFull;
    private String correo;
    @Column(columnDefinition = "TEXT") private String empresa;
    private String documentoIdentidad;
    private String tipoServicio;
    private LocalDate fechaServicio;
    private LocalTime horaRecogida;
    @Column(columnDefinition = "TEXT") private String origen;
    @Column(columnDefinition = "TEXT") private String destino;
    private String trayecto;
    private LocalDate fechaRegreso;
    private LocalTime horaRegreso;
    @Column(columnDefinition = "TEXT") private String paradasIntermedias;
    private String duracionEstimada;
    private Integer numPasajeros;
    private String nombrePasajeroVip;
    @Column(columnDefinition = "TEXT") private String equipajeDetalle;
    private String sillaNinosCant;
    private String sillaNinosEdad;
    @Column(columnDefinition = "TEXT") private String accesibilidad;
    private String categoriaVehiculo;
    private String capacidadRequerida;
    private String marcaColor;
    @Column(columnDefinition = "TEXT") private String caracteristicasVehiculo;
    private String numVuelo;
    private String aerolinea;
    private LocalTime horaLlegadaVuelo;
    private LocalTime horaSalidaVuelo;
    private String nombreCartel;
    private String idiomaConductor;
    private String seguridadEscolta;
    private String tipoSeguridad; // NUEVO
    @Column(columnDefinition = "TEXT") private String amenidades;
    @Column(columnDefinition = "TEXT") private String musicaPref;
    private String temperaturaPref;
    @Column(columnDefinition = "TEXT") private String notasEspeciales;
    private String metodoPago;
    @Column(columnDefinition = "TEXT") private String datosFacturacion;
    private String centroCostos;
    private String cupon;
    private boolean aceptaTerminos;
    private boolean aceptaDatos;
    private boolean aceptaCancelacion;

    public Reserva() {}

    // --- GETTERS Y SETTERS (Generar todos incluyendo el nuevo tipoSeguridad) ---
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getNombreCompleto() { return nombreCompleto; }
    public void setNombreCompleto(String n) { this.nombreCompleto = n; }
    public String getCelularFull() { return celularFull; }
    public void setCelularFull(String c) { this.celularFull = c; }
    public String getCorreo() { return correo; }
    public void setCorreo(String c) { this.correo = c; }
    public String getEmpresa() { return empresa; }
    public void setEmpresa(String e) { this.empresa = e; }
    public String getDocumentoIdentidad() { return documentoIdentidad; }
    public void setDocumentoIdentidad(String d) { this.documentoIdentidad = d; }
    public String getTipoServicio() { return tipoServicio; }
    public void setTipoServicio(String t) { this.tipoServicio = t; }
    public LocalDate getFechaServicio() { return fechaServicio; }
    public void setFechaServicio(LocalDate f) { this.fechaServicio = f; }
    public LocalTime getHoraRecogida() { return horaRecogida; }
    public void setHoraRecogida(LocalTime h) { this.horaRecogida = h; }
    public String getOrigen() { return origen; }
    public void setOrigen(String o) { this.origen = o; }
    public String getDestino() { return destino; }
    public void setDestino(String d) { this.destino = d; }
    public String getTrayecto() { return trayecto; }
    public void setTrayecto(String t) { this.trayecto = t; }
    public LocalDate getFechaRegreso() { return fechaRegreso; }
    public void setFechaRegreso(LocalDate f) { this.fechaRegreso = f; }
    public LocalTime getHoraRegreso() { return horaRegreso; }
    public void setHoraRegreso(LocalTime h) { this.horaRegreso = h; }
    public String getParadasIntermedias() { return paradasIntermedias; }
    public void setParadasIntermedias(String p) { this.paradasIntermedias = p; }
    public String getDuracionEstimada() { return duracionEstimada; }
    public void setDuracionEstimada(String d) { this.duracionEstimada = d; }
    public Integer getNumPasajeros() { return numPasajeros; }
    public void setNumPasajeros(Integer n) { this.numPasajeros = n; }
    public String getNombrePasajeroVip() { return nombrePasajeroVip; }
    public void setNombrePasajeroVip(String n) { this.nombrePasajeroVip = n; }
    public String getEquipajeDetalle() { return equipajeDetalle; }
    public void setEquipajeDetalle(String e) { this.equipajeDetalle = e; }
    public String getSillaNinosCant() { return sillaNinosCant; }
    public void setSillaNinosCant(String s) { this.sillaNinosCant = s; }
    public String getSillaNinosEdad() { return sillaNinosEdad; }
    public void setSillaNinosEdad(String s) { this.sillaNinosEdad = s; }
    public String getAccesibilidad() { return accesibilidad; }
    public void setAccesibilidad(String a) { this.accesibilidad = a; }
    public String getCategoriaVehiculo() { return categoriaVehiculo; }
    public void setCategoriaVehiculo(String c) { this.categoriaVehiculo = c; }
    public String getCapacidadRequerida() { return capacidadRequerida; }
    public void setCapacidadRequerida(String c) { this.capacidadRequerida = c; }
    public String getMarcaColor() { return marcaColor; }
    public void setMarcaColor(String m) { this.marcaColor = m; }
    public String getCaracteristicasVehiculo() { return caracteristicasVehiculo; }
    public void setCaracteristicasVehiculo(String c) { this.caracteristicasVehiculo = c; }
    public String getNumVuelo() { return numVuelo; }
    public void setNumVuelo(String n) { this.numVuelo = n; }
    public String getAerolinea() { return aerolinea; }
    public void setAerolinea(String a) { this.aerolinea = a; }
    public LocalTime getHoraLlegadaVuelo() { return horaLlegadaVuelo; }
    public void setHoraLlegadaVuelo(LocalTime h) { this.horaLlegadaVuelo = h; }
    public LocalTime getHoraSalidaVuelo() { return horaSalidaVuelo; }
    public void setHoraSalidaVuelo(LocalTime h) { this.horaSalidaVuelo = h; }
    public String getNombreCartel() { return nombreCartel; }
    public void setNombreCartel(String n) { this.nombreCartel = n; }
    public String getIdiomaConductor() { return idiomaConductor; }
    public void setIdiomaConductor(String i) { this.idiomaConductor = i; }
    public String getSeguridadEscolta() { return seguridadEscolta; }
    public void setSeguridadEscolta(String s) { this.seguridadEscolta = s; }
    public String getTipoSeguridad() { return tipoSeguridad; }
    public void setTipoSeguridad(String t) { this.tipoSeguridad = t; }
    public String getAmenidades() { return amenidades; }
    public void setAmenidades(String a) { this.amenidades = a; }
    public String getMusicaPref() { return musicaPref; }
    public void setMusicaPref(String m) { this.musicaPref = m; }
    public String getTemperaturaPref() { return temperaturaPref; }
    public void setTemperaturaPref(String t) { this.temperaturaPref = t; }
    public String getNotasEspeciales() { return notasEspeciales; }
    public void setNotasEspeciales(String n) { this.notasEspeciales = n; }
    public String getMetodoPago() { return metodoPago; }
    public void setMetodoPago(String m) { this.metodoPago = m; }
    public String getDatosFacturacion() { return datosFacturacion; }
    public void setDatosFacturacion(String d) { this.datosFacturacion = d; }
    public String getCentroCostos() { return centroCostos; }
    public void setCentroCostos(String c) { this.centroCostos = c; }
    public String getCupon() { return cupon; }
    public void setCupon(String c) { this.cupon = c; }
    public boolean isAceptaTerminos() { return aceptaTerminos; }
    public void setAceptaTerminos(boolean a) { this.aceptaTerminos = a; }
    public boolean isAceptaDatos() { return aceptaDatos; }
    public void setAceptaDatos(boolean a) { this.aceptaDatos = a; }
    public boolean isAceptaCancelacion() { return aceptaCancelacion; }
    public void setAceptaCancelacion(boolean a) { this.aceptaCancelacion = a; }
}