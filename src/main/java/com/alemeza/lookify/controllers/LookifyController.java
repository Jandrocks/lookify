package com.alemeza.lookify.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.alemeza.lookify.models.Lookify;
import com.alemeza.lookify.services.LookifyService;

import jakarta.validation.Valid;

@Controller
public class LookifyController {	
	@Autowired
	private LookifyService lookifyService;

	public LookifyController(LookifyService lookifyService) {
		this.lookifyService = lookifyService;
	}
	@GetMapping("/")
	 public String raiz() {
		return "index.jsp";
	}		
	//muestra songs 
	@GetMapping("/dashboard")
	public String dashboard(Model model) {
		List<Lookify> list = lookifyService.findAll();
		model.addAttribute("listSongs", list);
		return "dashboard.jsp";
	}		
	//abrir nueva songs
	@GetMapping("/songs/news")
	public String formSongs(@ModelAttribute("cancion") Lookify song) {
		return "formsongs.jsp";
	}	
	//agrega nueva songs
	@PostMapping("/songs/news")
	public String saveSongs(@Valid @ModelAttribute("cancion") Lookify song, BindingResult result) {
		if (result.hasErrors()) {
			return "formsongs.jsp";
		} else {
			lookifyService.createSongs(song);
			return "redirect:/dashboard";
		}
	}	
	//borrar
	@GetMapping("/delete/{id}")
	public String deleteSongs(@PathVariable("id") Long id) {
		lookifyService.deleteSongs(id);
		return "redirect:/dashboard";
	}
	//topsong
	@GetMapping("/search/topsongs")
	public String muestraTopSongs(Model viewModel) {
		viewModel.addAttribute("topsong", lookifyService.cancionesTopDiez());
	return "topsongs.jsp";
	
	}
	//muestra por id
	@GetMapping("/songs/{id}")
	public String showSongs(@PathVariable("id") Long id, Model viewModel) {
		viewModel.addAttribute("songs", lookifyService.findSongsId(id));
		return "muestrasongsid.jsp";
	}
}
