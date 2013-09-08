package org.canvass.example.data.services;


import java.util.List;

import org.canvass.example.data.model.Data;

public interface DataService {
    public void addOrder(Data data);
    public List<Data> listOrders();    
}