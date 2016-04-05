# Gulp Starter Middleman Asset Helpers

Source files should be in a `source` directory in the root of the project, **not** in `app/assets`. You'll also no longer be using the built in Middleman asset helpers like `javascript_include_tag` and the like. Instead, you'll use a set of **gulp_asset_helpers** with regular markup.

#### app/helpers/gulp_asset_helper.rb
In production (`npm run production`), filenames get hashed so you can cache them forever. When the file or any of it's referenced assets changes, the hash changes. This works just like the Middleman asset pipeline, and we have similar helpers to ensure that the correct filenames are referenced in production:

```ruby
gulp_asset_path('image/asset.jpg') # -> /image/logo-n39o4orb81.png
gulp_js_path('app.js')             # -> /javascripts/app-f43e9abc11.js
gulp_css_path('app.css')           # -> /stylesheets/app-d29e4cdb76.css
gulp_image_path('logo.png')          # -> /images/logo-n39o4orb81.png
```

So instead of this:
```erb
<%= image_tag 'logo.png', alt: 'logo' %>
```

You would do this:
```ruby
<img src="<%= gulp_image_path('logo.png') %>" alt="logo">
```

Instead of this:
```erb
<%= stylesheet_link_tag :site %>
```

You would do this:
```erb
<%= stylesheet_link_tag gulp_css_path('site.css') %>
```

##### Sprite helper
There's also a `<%= sprite('id') %>` helper included for use with the `svgSpriteTask` task. It looks like:

```
def sprite(id, classes = "", viewBox = "0 0 24 24")
  "<svg class='sprite -#{id} #{classes}' aria-hidden='true' preserveAspectRatio viewBox='#{viewBox}'><use xlink:href='#{gulp_image_path('sprites.svg')}##{id}' /></use></svg>".html_safe
end
```
