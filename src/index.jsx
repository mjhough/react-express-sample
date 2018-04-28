import React from 'react';
import PropTypes from 'prop-types';
import { render } from 'react-dom';

const MainApp = props => (
  <h1>{props.hello}</h1>
);

MainApp.propTypes = {
  hello: PropTypes.string,
};

MainApp.defaultProps = {
  hello: 'Hello Tolenno!',
};


render(<MainApp />, document.getElementById('app'));
