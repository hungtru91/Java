package com.project.movietickets.repository.custom;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.project.movietickets.entity.MovieEntity;

import lombok.extern.log4j.Log4j2;

@Repository
@Log4j2
public class SearchMovieRepositoryImpl implements SearchMovieRepository {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public List<MovieEntity> search(String movieName, String category) {

    	StringBuilder sqlBuilder;
        if (category != null && !category.equals("ALL")){
            sqlBuilder = new StringBuilder("select movies.* from movies\n" +
                    "where movies.name LIKE '" + movieName + "%'\n" + 
            		"and movies.category = '" + category + "'");
        } else {
            sqlBuilder = new StringBuilder("select movies.* from movies\n" +
                    "where movies.name LIKE '" + movieName + "%'");
        }
        
        log.info(sqlBuilder.toString());

        Query query = entityManager.createNativeQuery(sqlBuilder.toString(), MovieEntity.class);

        return query.getResultList();
    }
}
