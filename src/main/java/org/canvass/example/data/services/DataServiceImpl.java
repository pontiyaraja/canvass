package org.canvass.example.data.services;


import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaQuery;

import org.canvass.example.data.model.Data;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class DataServiceImpl implements DataService {

    @PersistenceContext
    EntityManager em;
        
	@Override
    @Transactional
	public void addOrder(Data data) {
		em.persist(data);
	}

	@Override
    @Transactional
	public List<Data> listOrders() {
		CriteriaQuery<Data> c = em.getCriteriaBuilder().createQuery(Data.class);
		c.from(Data.class);
        return em.createQuery(c).getResultList();
	}	
}
