package com.violence.repository;

import com.violence.entity.Catalog;
import com.violence.util.api.EntityAdapter;
import com.violence.util.api.EntityAdapterImpl;

import java.util.List;

public class CatalogRepositoryImpl implements CatalogRepository {

    private EntityAdapter entityAdapter = new EntityAdapterImpl();

    @Override
    public void save(Catalog catalog) {
        String sql = "INSERT INTO catalog (catalog_id, date_from, date_to, user_id, book_id) VALUES " + catalog.getId();
        entityAdapter.insert(sql);
    }

    @Override
    public void edit(Catalog catalog) {

    }

    @Override
    public void delete(Long id) {

    }

    @Override
    public Catalog getById(Long id) {
        String sql = "SELECT catalog.*, users.*, books.* FROM catalog " +
                "INNER JOIN users ON catalog.user_id = users.user_id " +
                "INNER JOIN books ON catalog.book_id = books.book_id" +
                "WHERE catalog.catalog_id = ?";
        return entityAdapter.getObject(new Catalog(), sql, id);
    }

    @Override
    public List<Catalog> getAll() {
        String sql = "SELECT " +
                "books.*, " +
                "catalog.*, " +
                "users.* " +
                "FROM " +
                "catalog " +
                "INNER JOIN books ON catalog.book_id = books.book_id " +
                "INNER JOIN users ON catalog.user_id = users.user_id";
        return entityAdapter.getListObject(new Catalog(), sql);
    }

    @Override
    public void saveList(List<Catalog> catalogs) {
        String sql = "INSERT INTO catalog (catalog_id, date_from, date_to, user_id, book_id) VALUES "
                + entityAdapter.prepareObjectToInsert(catalogs);
        entityAdapter.insert(sql);
    }
}
