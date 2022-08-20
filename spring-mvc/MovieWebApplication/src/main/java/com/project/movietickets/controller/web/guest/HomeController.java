package com.project.movietickets.controller.web.guest;

import java.time.LocalDate;
import java.util.List;
import java.util.Set;

import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.movietickets.entity.MovieEntity;
import com.project.movietickets.model.Movie;
import com.project.movietickets.repository.CityRepository;
import com.project.movietickets.service.MovieService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class HomeController {
	private final MovieService movieService;
	private final CityRepository cityRepository;

	@GetMapping(value = "/")
	public String index(Model model, @RequestParam(value = "page", defaultValue = "0") int page,
			@RequestParam(value = "limit", defaultValue = "3") int limit) {
		List<MovieEntity> hotMovies = movieService.getListMovieViewHighest();
		List<MovieEntity> newMovies = movieService.getListMovieLastest();
		Movie movies = new Movie();
		movies.setPage(page);
		movies.setTotalPage((int) Math.ceil((double) (movieService.getTotalItem()) / limit));
		if (page > 0) page = page - 1;
		Pageable pageable = PageRequest.of(page, limit);
		List<MovieEntity> allMovies = movieService.getAllMovieByPage(pageable).toList();
		Set<String> categories = movieService.getAllCategories();

		model.addAttribute("hotMovies", hotMovies);
		model.addAttribute("newMovies", newMovies);
		model.addAttribute("allMovies", allMovies);
		model.addAttribute("movies", movies);
		model.addAttribute("date", LocalDate.now().toString());
		model.addAttribute("categories", categories);
		model.addAttribute("cityId", cityRepository.findFirstByNameNotNull().getId());

		return "index";
	}
}
