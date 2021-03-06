package com.violence.util.api;

import java.sql.ResultSet;
import java.util.Collection;
import java.util.List;
import java.util.Map;

public interface EntityAdapter {
    Object getObjectFromResultSet(Class aClass, ResultSet resultSet);
    Object getObject(Class aClass, String sql);
    Object getObject(Class aClass, String sql, Long id);
    Object getObject(Class aClass, String sql, Map<Integer, String> params);
    Collection getListObject(Class aClass, String sql);
    Collection getListObject(Class aClass, String sql, Map<Integer, String> params);
    Collection getListObject(String sql, Class aClass, Map<Integer, Long> params);
    ResultSet getResultSet(String sql);
    void insert(Object o);
    void update(Object object);
    <T> String prepareObjectToInsert(List<T> authors);
    <T> String prepareObjectToInsert(T object);
}
