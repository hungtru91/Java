package com.project.movietickets.service;

import java.time.LocalDate;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.project.movietickets.entity.MovieEntity;
import com.project.movietickets.repository.MovieRepository;
import com.project.movietickets.repository.custom.SearchMovieRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MovieService {
	private final MovieRepository movieRepository;

	private final SearchMovieRepository searchMovieRepository;

	private final StorageService storageService;

	public List<MovieEntity> getAllMovie() {
		return movieRepository.findAll();
	}
	
	public Page<MovieEntity> getAllMovieByPage(Pageable pageable) {
		return movieRepository.findAll(pageable);
	}
	
	public int getTotalItem() {
		return (int) movieRepository.count();
	}

	public List<MovieEntity> searchMovie(String movieName, String category) {

		List<MovieEntity> result = searchMovieRepository.search(movieName, category);
		return result;
	}

	public void deleteMovie(int id) {
		movieRepository.deleteById(id);
	}

	public MovieEntity createMovie(String name, String description, String director, String category, String premiere,
			int time, String language, String format, int ageLimit, MultipartFile image) {
		var imagePath = storageService.store(image);

		var movie = MovieEntity.builder().name(name).description(description).director(director).category(category)
				.premiere(LocalDate.parse(premiere)).time(time).language(language).format(format).ageLimit(ageLimit)
				.image(imagePath).build();

		return movieRepository.save(movie);
	}

	public MovieEntity updateMovie(int id, String name, String description, String director, String category,
			String premiere, int time, String language, String format, int ageLimit) {
		var movie = movieRepository.getOne(id);
		movie.setName(name);
		movie.setDescription(description);
		movie.setDirector(director);
		movie.setCategory(category);
		movie.setPremiere(LocalDate.parse(premiere));
		movie.setTime(time);
		movie.setLanguage(language);
		movie.setFormat(format);
		movie.setAgeLimit(ageLimit);

		return movieRepository.save(movie);
	}

	public MovieEntity findById(int id) {
		return movieRepository.getOne(id);
	}

	public Set<String> getAllCategories() {
		return movieRepository.findAll().stream().map(movie -> movie.getCategory()).collect(Collectors.toSet());
	}

	public List<MovieEntity> getListMovieViewHighest() {
		return movieRepository.getListMovieViewHighest();
	}

	public List<MovieEntity> getListMovieLastest() {
		return movieRepository.getTopNewMovieLastest();
	}
}
