module.exports = function (app) {
  app.post('/api/version', (req, res) => {
    // accepts JSON
    res.send('1.0');
  });
};
