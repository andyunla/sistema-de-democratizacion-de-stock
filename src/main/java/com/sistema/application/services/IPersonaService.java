package com.sistema.application.services;

import com.sistema.application.entities.Persona;
import com.sistema.application.models.PersonaModel;

import java.util.List;

public interface IPersonaService {

	public List<Persona> getAll();
	
	public PersonaModel insertOrUpdate(PersonaModel personaModel);
	
	public boolean remove(long id);
}