package com.sistema.application.services;

import com.sistema.application.entities.Lote;
import com.sistema.application.models.LoteModel;

import java.util.List;
import java.util.Set;

public interface ILoteService {
	
	public List<Lote> getAll();

	public List <LoteModel> getAllModels();
	public List <LoteModel> getAllModels2();

	public LoteModel insertOrUpdate(LoteModel loteModel);
	
	public boolean remove(long id);
	
	public Set<LoteModel> findByLoteProductoActivo(long idProducto, long idLocal);
	
	public Set<LoteModel> findByLoteProductoBaja(long idProducto, long idLocal);
}
