const { environment } = require('@rails/webpacker')
const erb =  require('./loaders/erb')

environment.loaders.prepend('erb', erb)
const webpack = require('webpack');
environment.plugins.prepend(
    'Provide',
    new webpack.ProvidePlugin({
        $: 'jquery',
        jQuery: 'jquery',
        jquery: 'jquery',
        'window.jQuery': 'jquery',
        Popper: ['popper.js', 'default']
    })
)

module.exports = environment
