package it.prova.raccoltafilmspringmvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import it.prova.raccoltafilmspringmvc.model.Regista;
import it.prova.raccoltafilmspringmvc.repository.regista.RegistaRepository;

@Service
public class RegistaServiceImpl implements RegistaService {

	@Autowired
	private RegistaRepository repository;

	@Override
	@Transactional(readOnly = true)
	public List<Regista> listAllElements() {
		return (List<Regista>) repository.findAll();
	}

	@Override
	@Transactional(readOnly = true)
	public Regista caricaSingoloElemento(Long id) {
		return repository.findById(id).orElse(null);
	}

	@Override
	@Transactional(readOnly = true)
	public Regista caricaSingoloElementoConFilms(Long id) {
		return repository.findOneEager(id).orElse(null);
	}

	@Override
	@Transactional
	public void aggiorna(Regista registaInstance) {
		repository.save(registaInstance);
	}

	@Override
	@Transactional
	public void inserisciNuovo(Regista registaInstance) {
		repository.save(registaInstance);
	}

	@Override
	@Transactional
	public void rimuovi(Regista registaInstance) {
		System.out.println("sto cancellando");
		if (!registaInstance.getFilms().isEmpty()) {
			throw new RuntimeException("impossibile cancellare Regista con film");
		}
		repository.delete(registaInstance);

	}

	@Override
	@Transactional(readOnly = true)
	public List<Regista> findByExample(Regista example) {
		return repository.findByExample(example);
	}

	@Override
	@Transactional(readOnly = true)
	public List<Regista> cercaByCognomeENomeILike(String term) {
		return repository.findByCognomeIgnoreCaseContainingOrNomeIgnoreCaseContainingOrderByNomeAsc(term, term);
	}

}
