package com.example.eventmanage.dao;

import java.util.List;

import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.example.eventmanage.domain.Users;

@Transactional
@Repository
public class UsersDaoImpl extends BaseDao implements UsersDao {

	@Override
	public List<Users> findAll() throws Exception {
		// TODO 自動生成されたメソッド・スタブ
		return null;
	}

	@Override
	public Users findById(Integer userId) throws Exception {
		return (Users) getSession().createCriteria(Users.class)
				.add(Restrictions.eq("user_id", userId))
				.uniqueResult();
	}

	@Override
	public void insert(Users users) throws Exception {
		users.setLoginPass(BCrypt.hashpw(users.getLoginPass(), BCrypt.gensalt()));
		getSession().save(users);

	}

	@Override
	public void update(Users users) throws Exception {
		users.setLoginPass(BCrypt.hashpw(users.getLoginPass(), BCrypt.gensalt()));
		getSession().update(users);

	}

	@Override
	public void delete(Users users) throws Exception {
		getSession().delete(users);

	}

	@Override
	public Users findByLoginIdAndLoginPass(String loginId, String loginPass) throws Exception {
		Users users = (Users) getSession().createCriteria(Users.class)
				.add(Restrictions.eq("loginId", loginId))
				.uniqueResult();

		if (users == null) {
			return null;
		} else if (!(BCrypt.checkpw(loginPass, users.getLoginPass()))) {
			users = null;
		}
		return users;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Users> findByPage(int page, int numPerPage) throws Exception {
		int offset = numPerPage * (page - 1);
		return getSession().createCriteria(Users.class)
				.setFirstResult(offset)
				.setMaxResults(numPerPage)
				.list();
	}

	@Override
	public int totalPages(int numPerPage) throws Exception {
		Long count = (Long) getSession().createCriteria(Users.class)
				.setProjection(Projections.rowCount())
				.uniqueResult();
		return (int) Math.ceil((double) count / numPerPage);

	}
}
