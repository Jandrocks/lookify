package com.alemeza.lookify.services;
import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.alemeza.lookify.models.Lookify;
import com.alemeza.lookify.repositories.LookifyRepository;

@Service
public class LookifyService {
	private LookifyRepository lookifyRepository;
	
	public LookifyService(LookifyRepository lookifyRepository) {
		this.lookifyRepository = lookifyRepository;
	}

	public List<Lookify> findAll() {
		return lookifyRepository.findAll();
	}
	
	public Lookify createSongs (Lookify songs ) {
		return lookifyRepository.save(songs);
	}
	
	// borra
	public void deleteSongs(Long id) {
		Optional<Lookify> optionalSongs = lookifyRepository.findById(id);
		if (optionalSongs.isPresent()) {
			lookifyRepository.deleteById(id);
		}
	}
	//listatop
	public List<Lookify> cancionesTopDiez(){
		return lookifyRepository.findTop10ByOrderByRatingDesc();
	}
	
	//busca por id

	public Lookify findSongsId(Long id) {
		Optional<Lookify> optionalSongs = lookifyRepository.findById(id);
		if (optionalSongs.isPresent()) {
			return optionalSongs.get();
		} else {
			return null;
		}
	}
}
