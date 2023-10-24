#!/usr/bin/node
const request = require('request');

const apiUrl = process.argv[2];
const characterId = 18; // Wedge Antilles character ID

request(apiUrl, (error, response, body) => {
  if (!error && response.statusCode === 200) {
    const filmsData = JSON.parse(body);
    const count = filmsData.results.reduce((acc, film) => {
      if (film.characters.includes(`https://swapi-api.alx-tools.com/api/people/${characterId}/`)) {
        return acc + 1;
      }
      return acc;
    }, 0);
    console.log(count.toString()); // Print the count as a string
  } else {
    console.error('Error:', error);
  }
});
