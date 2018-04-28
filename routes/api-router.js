const version = (req, res) => {
  res.send('1.0');
};

export default (router) => {
  router.post('/api/version', version);
};
