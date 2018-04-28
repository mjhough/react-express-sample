// const bodyParser = require('body-parser');
// const cookieParser = require('cookie-parser');
// const dotenv = require('dotenv');
// const express = require('express');
// const logger = require('morgan').logger;
// const path = require('path');

// const webpackDevServer = require('./webpack/dev-server');
import bodyParser from 'body-parser';
import cookieParser from 'cookie-parser';
import dotenv from 'dotenv';
import express from 'express';
import logger from 'morgan';
import path from 'path';

import webpackDevServer from './webpack/dev-server';
import routes from './routes';

dotenv.config({ silent: true });


// Express app setup
const app = express();


// View engine
app.set('views', path.join(__dirname, './views'));
app.set('view engine', 'pug');

// Include webpack-dev-server for development only
if (process.env.NODE_ENV !== 'production') webpackDevServer(app);


// Morgan logger
app.use(logger('combined'));

// Body parser
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));

// Cookie parser
app.use(cookieParser());


// Server static files from public folder
app.use(express.static(path.join(__dirname, './public')));


// Use routes
app.use('/', routes);


// 404 error catcher - forwards to error handler
app.use((req, res, next) => {
  const err = new Error('Not Found');
  err.status = 404;
  next(err);
});

// Error handler
app.use((err, req, res, next) => {
  res.status(err.status || 500);
  res.render('error', {
    message: err.message,
    error: app.get('env') === 'development' ? err : {},
  });
  next();
});


export default app;
