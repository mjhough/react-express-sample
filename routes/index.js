import express from 'express';

import apiRouter from './api-router';
import publicRouter from './public-router';

const router = express.Router();

// Use routes from other files
apiRouter(router);
publicRouter(router);

export default router;
