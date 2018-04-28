import path from 'path';
import webpack from 'webpack';

export default {
  mode: 'production',
  devtool: 'source-map',
  entry: ['babel-polyfill', path.join(process.cwd(), 'src/index')],
  output: {
    filename: 'bundle.js',
    path: path.join(process.cwd(), 'public', 'js'),
    publicPath: '/js',
  },
  plugins: [
    new webpack.optimize.OccurrenceOrderPlugin(true),
  ],
  resolve: {
    extensions: ['.js', '.jsx'],
  },
  module: {
    rules: [
      {
        test: /\.js(x)?$/,
        use: {
          loader: 'babel-loader',
          options: {
            plugins: ['transform-inline-environment-variables'],
          },
        },
        exclude: /node_modules/,
      },
      {
        test: /\.json$/,
        use: 'json-loader',
      },
      {
        test: /\.(s)?css$/,
        use: ['style-loader', 'css-loader', 'sass-loader'],
      },
      {
        test: /\.svg$/,
        use: 'svg-inline-loader',
      },
      {
        test: /\.(jpe?g|png|gif|ico)$/i,
        use: 'file-loader',
      },
    ],
  },
  target: 'web',
};
