#!/usr/bin/node

const axios = require('axios');

const url = process.argv[2];

axios.get(url)
  .then((response) => {
    console.log('code:', response.status);
  })
  .catch((error) => {
    if (error.response) {
      console.log('code:', error.response.status);
    } else {
      console.error('Request failed:', error.message);
    }
  });
