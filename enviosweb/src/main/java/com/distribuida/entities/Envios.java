package com.distribuida.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Component
@Entity
@Table(name= "envios")
public class Envios {
	
	//id_envio, IdPedido, FechaEnvio, IdSucursalOrigen, IdSucursalDestino


	   @Id
	    @GeneratedValue(strategy= GenerationType.IDENTITY)
	   @Column(name="id_envio")
	private int idEnvios;
	    @Column(name="FechaEnvio")
	private Date fechaEnvio;
	@Column (name="IdPedido")
	private int idPedido;
	
	@Column (name="IdSucursalOrigen")
	private int idSucursalOrigen;
	@Column (name="IdSucursalDestino")
	private int idSucursalDestino;

		//@JoinColumn(name="id_Pedido")
		//@ManyToOne(cascade = {CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH})
		//private Pedido pedido;
		
		//@JoinColumn(name="id_SucursalOrigen")
		//@ManyToOne(cascade = {CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH})
		//private Sucursalorigen sucursalorigen;
		
		//@JoinColumn(name="id_SucursalDestino")
		//@ManyToOne(cascade = {CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH})
		//private Sucursaldestino sucursaldestino;
		

	
	
public Envios () {}

	public Envios(int idEnvios, Date fechaEnvio, int idPedido, int idSucursalOrigen, int idSucursalDestino) {
		this.idEnvios = idEnvios;
		this.fechaEnvio = fechaEnvio;
		this.idPedido = idPedido;
		this.idSucursalOrigen = idSucursalOrigen;
		this.idSucursalDestino = idSucursalDestino;
		//this.pedido = pedido;
		//this.sucursalorigen = sucursalorigen;
		//this.sucursaldestino = sucursaldestino;
	}


	//public Pedido getPedido() {
	//	return pedido;
	//}




	//public void setPedido(Pedido pedido) {
	//	this.pedido = pedido;
	//}




	//public Sucursalorigen getSucursalorigen() {
	//	return sucursalorigen;
	//}




	//public void setSucursalorigen(Sucursalorigen sucursalorigen) {
	//	this.sucursalorigen = sucursalorigen;
	//}




	//public Sucursaldestino getSucursaldestino() {
	//	return sucursaldestino;
	//}




	//public void setSucursaldestino(Sucursaldestino sucursaldestino) {
	//	this.sucursaldestino = sucursaldestino;
	//}




	
	public int getIdEnvios() {
		return idEnvios;
	}












	public void setIdEnvios(int idEnvios) {
		this.idEnvios = idEnvios;
	}












	public Date getFechaEnvio() {
		return fechaEnvio;
	}












	public void setFechaEnvio(Date fechaEnvio) {
		this.fechaEnvio = fechaEnvio;
	}












	public int getIdPedido() {
		return idPedido;
	}












	public void setIdPedido(int idPedido) {
		this.idPedido = idPedido;
	}












	public int getIdSucursalOrigen() {
		return idSucursalOrigen;
	}












	public void setIdSucursalOrigen(int idSucursalOrigen) {
		this.idSucursalOrigen = idSucursalOrigen;
	}












	public int getIdSucursalDestino() {
		return idSucursalDestino;
	}












	public void setIdSucursalDestino(int idSucursalDestino) {
		this.idSucursalDestino = idSucursalDestino;
	}






	@Override
	public String toString() {
		return "Envios [idEnvios=" + idEnvios + ", fechaEnvio=" + fechaEnvio + ", idPedido=" + idPedido
				+ ", idSucursalOrigen=" + idSucursalOrigen + ", idSucursalDestino=" + idSucursalDestino + "]";
	}



	

}
