import webpack from 'webpack';
import webpackDevMiddleware from 'webpack-dev-middleware';
import webpackHotMiddleware from 'webpack-hot-middleware';
import webpackConfig from './config-development.babel';

export default (app) => {
  const webpackCompiler = webpack(webpackConfig);

  // Use dev middleware
  app.use(webpackDevMiddleware(webpackCompiler, {
    // Defines the level of messages to log
    logLevel: 'warn',
    // Public path to bind the middleware to
    publicPath: webpackConfig.output.publicPath,
  }));

  // Use webpack hot reloading
  app.use(webpackHotMiddleware(webpackCompiler));
};
