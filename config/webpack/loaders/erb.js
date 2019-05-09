<% if Gem.win_platform? %>
module.exports = {
  test: /\.erb$/,
  enforce: 'pre',
  exclude: /node_modules/,
  use: [{
    loader: 'rails-erb-loader',
    options: {
      runner: (/^win/.test(process.platform) ? 'ruby ' : '') + 'bin/rails runner'
    }
  }]
}
<% else %>
module.exports = {
  module: {
    rules: [
      {
        test: /\.erb$/,
        enforce: 'pre',
        loader: 'rails-erb-loader'
      },
    ]
  }
}
};
<% end %>