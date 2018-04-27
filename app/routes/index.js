const publicRoutes = require('./public_routes');
const apiRoutes = require('./api_routes');

module.exports = function (app) {
  publicRoutes(app);
  apiRoutes(app);
  // Other routes in the future
};
