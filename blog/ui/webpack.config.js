const path = require('path');
const ExtractTextPlugin = require('extract-text-webpack-plugin');


const config = {
    entry: './src/app',
    output: {
        path: __dirname,
        filename: '../static/js/bundle.js',
    },
    module: {
        loaders: [
            {
                test: /.jsx?$/,
                loaders: ['babel-loader'],
                exclude: /node_modules/,
            },
            {
                test: /\.scss$/,
                loader: ExtractTextPlugin.extract('style', 'css!sass')
            }
        ]
    },
    plugins: [
        new ExtractTextPlugin('../static/css/bundle.css')
    ],
    resolve: {
        extensions: ['', '.jsx', '.js', '.scss'],
        root: [path.join(__dirname, './src')]
    }
};

module.exports = config
