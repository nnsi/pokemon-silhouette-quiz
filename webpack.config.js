var webpack = require('webpack');

module.exports = {
  entry: ['@babel/polyfill', './app/index'],
  output: {
    path: __dirname + '/docs',
    filename: 'bundle.js'
  },
  plugins: [
    new webpack.ProvidePlugin({
      riot: 'riot'
    })
  ],
  module: {
    rules: [
      { test: /\.js$|\.tag$/, exclude: /node_modules/, loader: 'babel-loader' },
      { test: /\.tag$/, exclude: /node_modules/, loader: 'riotjs-loader', query: { type: 'none' }, enforce: 'pre' }
    ]
  },
  devServer: {
    contentBase: './docs'
  }
};