package com.cognizant.springlearn.service;


import com.cognizant.springlearn.model.Country;
import org.springframework.stereotype.Service;


@Service
public class CountryService {


    public Country getCountry(String code) {


        Country country = new Country();


        if(code.equalsIgnoreCase("IN")) {

            country.setCode("IN");
            country.setName("India");

        }


        return country;
    }
}