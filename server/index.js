import http from 'http';

import app from '../app';

function log(message) {
  process.stdout.write(`${message}\n`);
}

// PORT normalizer
function normalizePort(val) {
  const port = parseInt(val, 10);

  if (Number.isNaN(port)) {
    return val;
  }

  if (port >= 0) {
    return port;
  }

  return false;
}

// Get PORT from env
const port = normalizePort(process.env.PORT || 3000);
app.set('port', port);

// Create HTTP server
const server = http.createServer(app);
let availablePort = port;

// Listen to PORT
function startServer(serverPort) {
  server.listen(serverPort);
}

// Listen to HTTP server error
function onError(error) {
  if (error.syscall !== 'listen') {
    throw error;
  }

  const bind = `${typeof port === 'string' ? 'Pipe' : 'ports'} ${port}`;

  // Handle specific listen errors with friendly messages
  switch (error.code) {
    case 'EACCES':
      log(`${bind} requires elevated privileges`);
      process.exit(1);
      break;

    case 'EADDRINUSE':
      if (availablePort - port < 10) {
        availablePort += 1;
        startServer(availablePort);
      } else {
        log(`${bind} is already in use`);
        process.exit(1);
      }
      break;

    default:
      throw error;
  }
}

// Listen to HTTP listening event
function onListening() {
  const addr = server.address();
  const bind = `${
    typeof addr === 'string' ? 'pipe' : 'port'
  } ${
    typeof addr === 'string' ? addr : addr.port
  }`;
  log(`Server is listening on ${bind}`);
  log(`Visit: http://localhost:${addr.port}`);
}

// Start server
server.on('error', onError);
server.on('listening', onListening);

startServer(availablePort);
