package com.example.eventmanage.dao;

import java.util.List;

import com.example.eventmanage.domain.Event;

public interface EventDao {
	List<Event> findAll() throws Exception;

	public Event findById(Integer eventId) throws Exception;

	public void insert(Event event) throws Exception;

	public void update(Event event) throws Exception;

	public void delete(Event event) throws Exception;

	public List<Event> findByPage(int page, int numPerPage) throws Exception;

	public int totalPages(int numPerPage) throws Exception;
}