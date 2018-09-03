package com.example.eventmanage.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.eventmanage.dao.UsersDao;
import com.example.eventmanage.domain.Users;

@Controller
public class AuthController {
	@Autowired
	private UsersDao usersDao;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginGet() {
		return "login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginPost(
			@RequestParam String loginId,
			@RequestParam String loginPass,
			@Valid Users users,
			Errors errors,
			Model model,
			HttpSession session) throws Exception {
		if (!errors.hasErrors()) {

			users = usersDao.findByLoginIdAndLoginPass(loginId, loginPass);
			if (users != null) {
				session.setAttribute("userId", users.getLoginId());
				session.setAttribute("userName", users.getUserName());
				return "redirect:/itemList";
			}
			errors.reject("error.login");
			return "login";
		} else {
			return "login";
		}
	}

	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String addGet(HttpSession session) {
		session.invalidate();
		return "redirect:/login";
	}
}
