# Middleman + Gulp Starter
Build static sites using [Middleman](https://middlemanapp.com/) with [Gulp Starter](https://github.com/vigetlabs/gulp-starter).

<a href="https://youtu.be/-io8EeB3GHI" target="_blank"><img src="http://d.pr/i/13Fxy+" width="600"/></a>

Watch the screencast: https://youtu.be/-io8EeB3GHI

## Installation
1. Clone the repo &mdash; `git clone git@github.com:craigmdennis/middleman-gulp-starter.git`
1. Run setup &mdash; `bin/setup`

Setup installs Bundler, Gem dependencies and NPM dependencies.

## Developing using Middleman + Gulp Starter
1. Run `middleman serve` to use the `environments/development` config

Middleman will launch Gulp Starter as an external pipeline, in development mode.

## Production builds
1. Run `middleman build` to use the `environments/production` config

Middleman will minify HTML and Gulp starter will handle everything else

## Running Middleman without Gulp Starter
There may be [instances where you want to run the standard Middleman tasks without initiating Gulp Starter](https://github.com/craigmdennis/middleman-gulp-starter/pull/17#issue-147191865). To do that you simply need to pass in another environment. It doesn't even need to exist.

`middleman serve -e debug`

Now you can create `environments/debug` and add your own custom config in there.

## Revving Assets
You'll no longer be able to use the built in Middleman asset helpers like `javascript_include_tag` on their own. Instead, you'll have to add a set of **gulp_asset_helpers**. Filenames get hashed so you can cache them forever. [Learn more](helpers/README.md)

```ruby
gulp_asset_path('image/asset.jpg') # -> /image/logo-n39o4orb81.png
gulp_js_path('app.js')             # -> /javascripts/app-f43e9abc11.js
gulp_css_path('app.css')           # -> /stylesheets/app-d29e4cdb76.css
gulp_image_path('logo.png')        # -> /images/logo-n39o4orb81.png
```

So instead of this:
```erb
<%= image_tag 'logo.png', alt: 'logo' %>
```

You would do this:
```erb
<%= image_tag gulp_image_path('logo.png'), alt: 'logo' %>
```

Instead of this:
```erb
<%= stylesheet_link_tag :site %>
```

You would do this:
```erb
<%= stylesheet_link_tag gulp_css_path('site.css') %>
```

You can disable asset revving in production on the [`config.json`](https://github.com/craigmdennis/middleman-gulp-starter/blob/master/gulpfile.js/config.json#L78) at the bottom.

## Contributing
Please make sure to submit PRs to the latest feature branch.

## Release History
Please consult the [official changelog](https://github.com/craigmdennis/middleman-gulp-starter/blob/master/CHANGELOG.md)
