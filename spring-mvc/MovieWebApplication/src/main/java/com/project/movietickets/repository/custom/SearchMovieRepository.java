package com.project.movietickets.repository.custom;

import java.util.List;

import com.project.movietickets.entity.MovieEntity;

public interface SearchMovieRepository {
    List<MovieEntity> search(String movieName, String category);
}
