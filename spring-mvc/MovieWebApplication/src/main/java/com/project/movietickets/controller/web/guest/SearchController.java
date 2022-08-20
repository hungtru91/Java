package com.project.movietickets.controller.web.guest;

import com.project.movietickets.entity.MovieEntity;
import com.project.movietickets.model.Report;
import com.project.movietickets.repository.CityRepository;
import com.project.movietickets.service.MovieService;
import com.project.movietickets.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.time.LocalDate;
import java.util.List;
import java.util.Set;

@Controller
@RequiredArgsConstructor
@RequestMapping("/")
public class SearchController {
	private final MovieService movieService;
	private final CityRepository cityRepository;

	@GetMapping(value = "/search")
	public ModelAndView index(@RequestParam(value = "movieName", required = false) String movieName,
			@RequestParam(value = "category", required = false) String category, ModelAndView modelAndView) {
		modelAndView.setViewName("index");

		Set<String> categories = movieService.getAllCategories();
		List<MovieEntity> searchMovies = movieService.searchMovie(movieName, category);
		modelAndView.addObject("categories", categories);
		modelAndView.addObject("date", LocalDate.now().toString());
		modelAndView.addObject("cityId", cityRepository.findFirstByNameNotNull().getId());
		modelAndView.addObject("allMovies", searchMovies);

		return modelAndView;
	}
}
