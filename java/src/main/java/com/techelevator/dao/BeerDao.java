package com.techelevator.dao;

import com.techelevator.model.Beer;

import java.util.List;

public interface BeerDao {
    List<Beer> listAll();

    List<Beer> getListByBrewery(int breweryId);

    Beer getBeerById(int beerId);

    Beer findByName(String name);

    Beer create(Beer beerToCreate);

    void deleteBeer(int beerId);
}