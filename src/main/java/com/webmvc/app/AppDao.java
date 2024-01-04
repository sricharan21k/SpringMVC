package com.webmvc.app;

import java.util.List;

public interface AppDao<T> {
    List<?> getAllRecords();

    T getRecord(int id);

    void deleteRecord(int id);

    void addRecord(T t);

    void updateRecord(T t);
}
