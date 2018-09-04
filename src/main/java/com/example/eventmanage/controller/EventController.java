package com.example.eventmanage.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.eventmanage.dao.EventDao;
import com.example.eventmanage.domain.Event;

@Controller
public class EventController {
	@Autowired
	private EventDao eventDao;

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		format.setLenient(false);
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format, true));
	}

	// 1 ページあたりの表示件数
	private static final int NUM_PER_PAGE = 5;

	@RequestMapping(value = { "/", "todayEvent" })
	public String todayEvent(@RequestParam(name = "p", defaultValue = "1") Integer page, HttpSession session,
			Model model)
			throws Exception {
		//今日のイベントリスト(ページ分割)
		List<Event> listItem = eventDao.findByPage(page, NUM_PER_PAGE);
		model.addAttribute("listItem", listItem);
		// Pagination 用
		int totalPages = eventDao.totalPages(NUM_PER_PAGE);
		model.addAttribute("totalPages", totalPages);
		model.addAttribute("currentPage", page);
		return "todayEvent";
	}

	@RequestMapping(value = "addItem", method = RequestMethod.GET)
	public String addItemGet(Model model, HttpServletRequest request) throws Exception {
		Event item = new Event();
		model.addAttribute("item", item);

		File uploadsDirectory = new File(request.getServletContext().getRealPath("/images/item"));
		File[] fileList = uploadsDirectory.listFiles();
		model.addAttribute("fileList", fileList);
		return "addItem";
	}

	@RequestMapping(value = "addItem", method = RequestMethod.POST)
	public String addItemPost(
			@Valid Event item,
			Errors errors,
			@RequestParam MultipartFile upfile,
			HttpServletRequest request,
			Model model) throws Exception {

		// エラーが無ければデータの追加
		// エラーが有ればフォームの再表示
		if (!errors.hasErrors()) {
			// データの追加

			eventDao.insert(item);
			return "addItemDone";
		} else {
			// フォームの再表示
			return "addItem";
		}
	}

	@RequestMapping(value = "/delItem/{id}")
	public String delItem(@PathVariable Integer id, Model model) throws Exception {
		Event item = eventDao.findById(id);
		eventDao.delete(item);
		return "deleteItemDone";
	}

	@RequestMapping(value = "updateItem/{id}", method = RequestMethod.GET)
	public String updateItemGet(
			@PathVariable Integer id,

			HttpServletRequest request,
			Model model) throws Exception {
		Event item = eventDao.findById(id);
		model.addAttribute("item", item);

		return "updateItem";
	}

	@RequestMapping(value = "updateItem/{id}", method = RequestMethod.POST)
	public String updateItemPost(
			@Valid Event item,
			Errors errors,

			HttpServletRequest request,
			Model model) throws Exception {

		// エラーが無ければデータの追加
		// エラーが有ればフォームの再表示
		if (!errors.hasErrors()) {
			// データの追加
			//			if (!upfile.isEmpty()) {
			//				String fileName = upfile.getOriginalFilename();
			//				File destination = new File(request.getServletContext().getRealPath("/images/item")
			//						+ "/" + fileName);
			//				upfile.transferTo(destination);
			//				item.setImageUrl(fileName);
			//			}

			eventDao.update(item);
			return "updateItemDone";
		} else {
			// フォームの再表示
			return "updateItem";
		}
	}

}
