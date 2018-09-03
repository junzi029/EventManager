package com.example.eventmanage.dao;

import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.example.eventmanage.domain.Event;

@Transactional
@Repository
public class EventDaoImpl extends BaseDao implements EventDao {

	@SuppressWarnings("unchecked")
	@Override
	public List<Event> findAll() throws Exception {
		return getSession().createCriteria(Event.class)
				.list();
	}

	@Override
	public Event findById(Integer eventId) throws Exception {
		return (Event) getSession().createCriteria(Event.class)
				.add(Restrictions.eq("event_id", eventId))
				.uniqueResult();
	}

	@Override
	public void insert(Event event) throws Exception {

		event.setCreatedAt(new Date());
		getSession().save(event);

	}

	@Override
	public void update(Event event) throws Exception {
		getSession().update(event);
	}

	@Override
	public void delete(Event event) throws Exception {
		getSession().delete(event);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Event> findByPage(int page, int numPerPage) throws Exception {
		int offset = numPerPage * (page - 1);
		return getSession().createCriteria(Event.class)
				.setFirstResult(offset)
				.setMaxResults(numPerPage)
				.list();
	}

	@Override
	public int totalPages(int numPerPage) throws Exception {
		Long count = (Long) getSession().createCriteria(Event.class)
				.setProjection(Projections.rowCount())
				.uniqueResult();
		return (int) Math.ceil((double) count / numPerPage);

	}

}
