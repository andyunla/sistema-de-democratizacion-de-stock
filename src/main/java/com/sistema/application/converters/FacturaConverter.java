package com.sistema.application.converters;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import com.sistema.application.entities.Chango;
import com.sistema.application.entities.Cliente;
import com.sistema.application.entities.Empleado;
import com.sistema.application.entities.Factura;
import com.sistema.application.entities.Local;
import com.sistema.application.models.ChangoModel;
import com.sistema.application.models.ClienteModel;
import com.sistema.application.models.EmpleadoModel;
import com.sistema.application.models.FacturaModel;
import com.sistema.application.repositories.IClienteRepository;

@Component("facturaConverter")
public class FacturaConverter {
	@Autowired
	@Qualifier("clienteConverter")
	private static ClienteConverter clienteConverter;
	@Autowired
	@Qualifier("empleadoConverter")
	private static EmpleadoConverter empleadoConverter;
	@Autowired
	@Qualifier("changoConverter")
	private static ChangoConverter changoConverter;
	@Autowired
	@Qualifier("localConverter")
	private static LocalConverter localConverter;
	public FacturaModel entityToModel(Factura factura) {
		return new FacturaModel(factura.getIdFactura(), clienteConverter.entityToModel(factura.getCliente()),
				changoConverter.entityToModel(factura.getChango()), factura.getFechaFactura(), factura.getCosteTotal()
				,empleadoConverter.entityToModel(factura.getEmpleado()), localConverter.entityToModel(factura.getLocal()) );
	}
	
	public Factura modelToEntity(FacturaModel facturaModel) {
		//return new Factura(clienteConverter.modelToEntity(facturaModel.getCliente()), changoConverter.modelToEntity(facturaModel.getChango()), facturaModel.getFechaFactura(), facturaModel.getCosteTotal(), 
		//				   clienteConverter.modelToEntity(facturaModel.getEmpleado(), clienteConverter.modelToEntity(facturaModel.getLocal())));
		return new Factura(facturaModel.getIdFactura(),clienteConverter.modelToEntity(facturaModel.getCliente()),
				changoConverter.modelToEntity(facturaModel.getChango()), facturaModel.getFechaFactura(), facturaModel.getCosteTotal(),
				empleadoConverter.modelToEntity(facturaModel.getEmpleado()), localConverter.modelToEntity(facturaModel.getLocal()));
	}
	
}
