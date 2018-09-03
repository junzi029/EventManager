package com.example.eventmanage.dao;

import java.util.List;

import com.example.eventmanage.domain.Users;

public interface UsersDao {
	List<Users> findAll() throws Exception;

	Users findById(Integer userId) throws Exception;

	void insert(Users users) throws Exception;

	void update(Users users) throws Exception;

	void delete(Users users) throws Exception;

	Users findByLoginIdAndLoginPass(String loginId, String loginPass) throws Exception;

	public List<Users> findByPage(int page, int numPerPage) throws Exception;

	public int totalPages(int numPerPage) throws Exception;
}
