package com.example.school.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author zhujingwen
 */
@Controller
@RequestMapping("/interface")
public class InterfaceController {

	@GetMapping("/blood")
	public String blood() {

		return "blood.html";
	}

	@GetMapping("/hougong")
	public String hougong() {

		return "hougong.html";
	}

	@GetMapping("/theater")
	public String theater() {

		return "theater.html";
	}

	@GetMapping("/cartoon")
	public String cartoon() {

		return "cartoo。n.html";
	}

	@GetMapping("/movie")
	public String movie() {

		return "movie.html";
	}

}
