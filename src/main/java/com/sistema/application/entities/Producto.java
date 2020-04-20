package com.sistema.application.entities;

import java.time.LocalDate;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

@Entity
@Table(name="producto")
public class Producto {
	@Id
	@GeneratedValue
	@Column(name="idProducto")
	private long idProducto;

	@Column(name="nombre", nullable=false)
	private String nombre;

	@Column(name="descripcion", nullable=false)
	private String descripcion;

	@Column(name="precio", nullable=false)
	private double precio;

	@Column(name="talle", nullable=false)
	private int talle;

	@OneToMany(fetch=FetchType.LAZY, mappedBy="producto")
	private Set<Item> listaItems;
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="producto")
	private Set<Lote> listaLotes;

	@OneToMany(fetch=FetchType.LAZY, mappedBy="producto")
	private Set<PedidoStock> listaPedidoStock;

	public Producto() {}

	public Producto(String nombre, String descripcion, double precio, int talle) {
		this.nombre = nombre;
		this.descripcion = descripcion;
		this.precio = precio;
		this.talle = talle;
	}

	//Getters y Setters
	public long getIdProducto() {
		return idProducto;
	}

	protected void setIdProducto(long idProducto) {
		this.idProducto = idProducto;
	}
	
	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public double getPrecio() {
		return precio;
	}

	public void setPrecio(double precio) {
		this.precio = precio;
	}

	public int getTalle() {
		return talle;
	}

	public void setTalle(int talle) {
		this.talle = talle;
	}

	public Set<Item> getListaItems() {
		return listaItems;
	}

	public void setListaItems(Set<Item> listaItems) {
		this.listaItems = listaItems;
	}

	public Set<Lote> getListaLotes() {
		return listaLotes;
	}

	public void setListaLotes(Set<Lote> listaLotes) {
		this.listaLotes = listaLotes;
	}
	
	public Set<PedidoStock> getListaPedidoStock() {
		return listaPedidoStock;
	}

	public void setListaPedidoStock(Set<PedidoStock> listaPedidoStock) {
		this.listaPedidoStock = listaPedidoStock;
	}

	public boolean equals(Producto producto) {
		return this.idProducto == producto.getIdProducto();
	}
	
	@Override
	public String toString() {
		return "\n\nID: "+idProducto+"\nNombre: " + nombre + "\nDescripcion: " + descripcion
				+ "\nPrecio: " + precio + "\nTalle: " + talle ;
	}
}
