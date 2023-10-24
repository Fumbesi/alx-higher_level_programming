#!/usr/bin/node
const request = require('request');

const movieId = process.argv[2];
const apiUrl = `https://swapi-api.alx-tools.com/api/films/${movieId}`;

request(apiUrl, (error, response, body) => {
  if (!error && response.statusCode === 200) {
    const movieData = JSON.parse(body);

    if (movieData.characters.length === 0) {
      console.log('No characters found for this movie.');
      return;
    }

    // Create an array to store character URLs in the same order as the list in /films/ response
    const characterUrls = movieData.characters;

    // Function to fetch and print character names
    const fetchAndPrintCharacterName = (characterUrl) => {
      request(characterUrl, (charError, charResponse, charBody) => {
        if (!charError && charResponse.statusCode === 200) {
          const characterData = JSON.parse(charBody);
          console.log(characterData.name);
          // Remove the URL from the array after printing the name
          characterUrls.shift();
          // Check if there are more character URLs to fetch
          if (characterUrls.length > 0) {
            fetchAndPrintCharacterName(characterUrls[0]);
          }
        } else {
          console.error('Error fetching character data:', charError);
        }
      });
    };

    // Start fetching and printing character names from the first character URL
    fetchAndPrintCharacterName(characterUrls[0]);
  } else {
    console.error('Error fetching movie data:', error);
  }
});
