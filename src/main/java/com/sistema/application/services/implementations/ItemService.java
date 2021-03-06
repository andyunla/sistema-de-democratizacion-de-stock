package com.sistema.application.services.implementations;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.sistema.application.services.IItemService;
import com.sistema.application.repositories.IItemRepository;
import com.sistema.application.converters.ChangoConverter;
import com.sistema.application.converters.ItemConverter;
import com.sistema.application.converters.ProductoConverter;
import com.sistema.application.entities.Item;
import com.sistema.application.models.ChangoModel;
import com.sistema.application.models.ItemModel;
import com.sistema.application.models.ProductoModel;

import java.util.ArrayList;
import java.util.List;

@Service("itemService")
public class ItemService implements IItemService {

	// Atributos
	@Autowired
	@Qualifier("itemRepository")
	private IItemRepository itemRepository;

	@Autowired
	@Qualifier("itemConverter")
	private ItemConverter itemConverter;

	@Autowired
	@Qualifier("changoConverter")
	private ChangoConverter changoConverter;

	@Autowired
	@Qualifier("productoConverter")
	private ProductoConverter productoConverter;

	// Métodos
	public ItemModel findByIdItem(long idItem) {
		return itemConverter.entityToModel(itemRepository.findByIdItem(idItem));
	}

	@Override
	public ItemModel findByChangoAndProducto(long idChango, long idProducto) {
		Item item = itemRepository.findByChangoAndProducto(idChango, idProducto);
		if (item == null) {
			return null;
		}
		return itemConverter.entityToModel(item);
	}

	@Override
	public List<ItemModel> findByChango(long idChango) {
		List<ItemModel> items = new ArrayList<ItemModel>();
		for (Item item : itemRepository.findByChango(idChango)) {
			items.add(itemConverter.entityToModel(item));
		}
		return items;
	}

	@Override
	public List<Item> getAll() {
		return itemRepository.findAll();
	}

	@Override
	public List<ItemModel> getAllModel() {
		List<ItemModel> items = new ArrayList<ItemModel>();
		for (Item i : itemRepository.findAll()) {
			items.add(itemConverter.entityToModel(i));
		}
		return items;
	}

	@Override
	public ItemModel insertOrUpdate(ItemModel itemModel) {
		Item item = itemRepository.save(itemConverter.modelToEntity(itemModel));
		return itemConverter.entityToModel(item);
	}

	@Override
	public boolean remove(long id) {
		try {
			itemRepository.deleteById(id);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
}
