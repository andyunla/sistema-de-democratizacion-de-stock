package com.sistema.application.repositories;
import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.sistema.application.entities.Chango;

public interface IChangoRepository extends JpaRepository<Chango, Serializable> {
	public abstract Chango findByIdChango(long idChango);
}