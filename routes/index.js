import express from 'express';

import apiRouter from './api';
import publicRouter from './public';

const router = express.Router();

// Use routes from other files
apiRouter(router);
publicRouter(router);

export default router;
