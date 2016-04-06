# Middleman + Gulp Starter
A demo showing how to use Middleman v4 with Gulp Starter

<a href="https://youtu.be/-io8EeB3GHI" target="_blank"><img src="http://d.pr/i/13Fxy+" width="600"/></a>

Watch the screencast: https://youtu.be/-io8EeB3GHI

1. `bundle install`
2. `npm install`
3. `middleman serve`

## Revving Assets
You'll no longer be using the built in Middleman asset helpers like `javascript_include_tag` and the like. Instead, you'll use a set of **gulp_asset_helpers** with regular markup. Filenames get hashed so you can cache them forever. [Learn more](helpers/README.md)

You can disable asset revving in production on the `config.json` at the bottom.

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
