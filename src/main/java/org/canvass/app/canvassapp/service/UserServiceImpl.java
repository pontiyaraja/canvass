package org.canvass.app.canvassapp.service;


import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaQuery;

import org.canvass.app.canvassapp.model.User;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserServiceImpl implements UserService {

    @PersistenceContext
    EntityManager em;
        
	@Override
    @Transactional
	public void addUser(User user) {
		em.persist(user);
	}

	@Override
    @Transactional
	public List<User> listUsers() {
		CriteriaQuery<User> c = em.getCriteriaBuilder().createQuery(User.class);
		c.from(User.class);
        return em.createQuery(c).getResultList();
	}

	@Override
    @Transactional
	public List<User> findUser(String email) {
		return em.createQuery("SELECT o FROM Order o WHERE o.email = :email", User.class)
		.setParameter("email", email)
		.getResultList();
	}	
	
}
