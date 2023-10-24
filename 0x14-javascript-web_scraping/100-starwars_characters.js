#!/usr/bin/node
const request = require('request');

const movieId = process.argv[2];
const apiUrl = `https://swapi-api.alx-tools.com/api/films/${movieId}`;

request(apiUrl, (error, response, body) => {
  if (!error && response.statusCode === 200) {
    const movieData = JSON.parse(body);

    // Ensure characters are present
    if (movieData.characters.length === 0) {
      console.log('No characters found for this movie.');
    } else {
      // Iterate over the characters and print one character name per line
      movieData.characters.forEach((characterUrl) => {
        request(characterUrl, (charError, charResponse, charBody) => {
          if (!charError && charResponse.statusCode === 200) {
            const characterData = JSON.parse(charBody);
            console.log(characterData.name);
          } else {
            console.error('Error fetching character data:', charError);
          }
        });
      });
    }
  } else {
    console.error('Error fetching movie data:', error);
  }
});
