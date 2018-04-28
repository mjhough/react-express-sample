const index = (req, res) => {
  res.render('index');
};

export default (router) => {
  router.get('/', index);
};

