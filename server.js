const express = require('express');
// const MongoClient = require('mongodb').MongoClient;
const bodyParser = require('body-parser');

const app = express();

const PORT = 8000;

app.use(bodyParser.json());

require('./app/routes')(app, {});

app.listen(PORT, () => {
  console.log(`Helping people on port ${PORT}`);
});
