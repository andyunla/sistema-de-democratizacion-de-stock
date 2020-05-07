package com.sistema.application.models;

import java.time.LocalDate;

import com.sistema.application.models.EmpleadoModel;
import com.sistema.application.models.ChangoModel;
import com.sistema.application.models.ClienteModel;

public class FacturaModel {

	//Atributos
	private long idFactura;
	private ClienteModel cliente;
	private ChangoModel chango;
	private LocalDate fechaFactura;
	private double costeTotal;
	private EmpleadoModel empleado;
	
	
	//Constructores
	public FacturaModel() {};
	
	public FacturaModel(long idFactura, ClienteModel cliente, ChangoModel chango, LocalDate fechaFactura,
			double costeTotal, EmpleadoModel empleado) {
		super();
		this.idFactura = idFactura;
		this.cliente = cliente;
		this.chango = chango;
		this.fechaFactura = fechaFactura;
		this.costeTotal = costeTotal;
		this.empleado = empleado;
	}

	
	//Getters y Setters
	public long getIdFactura() {
		return idFactura;
	}
	public void setIdFactura(long idFactura) {
		this.idFactura = idFactura;
	}

	public ClienteModel getCliente() {
		return cliente;
	}
	public void setCliente(ClienteModel cliente) {
		this.cliente = cliente;
	}

	public ChangoModel getChango() {
		return chango;
	}
	public void setChango(ChangoModel chango) {
		this.chango = chango;
	}

	public LocalDate getFechaFactura() {
		return fechaFactura;
	}
	public void setFechaFactura(LocalDate fechaFactura) {
		this.fechaFactura = fechaFactura;
	}

	public double getCosteTotal() {
		return costeTotal;
	}
	public void setCosteTotal(double costeTotal) {
		this.costeTotal = costeTotal;
	}

	public EmpleadoModel getEmpleado() {
		return empleado;
	}
	public void setEmpleado(EmpleadoModel empleado) {
		this.empleado = empleado;
	}

	
	//toString
	@Override
	public String toString() {
		return "FacturaModel [idFactura=" + idFactura + ", cliente=" + cliente + ", chango=" + chango
				+ ", fechaFactura=" + fechaFactura + ", costeTotal=" + costeTotal + ", empleado=" + empleado + "]";
	}	
	
}