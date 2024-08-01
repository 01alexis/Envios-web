package com.distribuida.dao;

import java.util.List;

import com.distribuida.entities.Envios;

public interface EnviosDAO {
	//Crud Basico
	
		public List<Envios> findAll();
		
		public Envios findOne(int id);
		
		public void add(Envios envios);
		
		public void up(Envios envios);
		
		public void del(int id);
		
		// CRUD avanzados 


}
