# Read from Gulp Starter's config.json file
# and rev-manifest file (if present)
require './lib/gulp'

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

# General configuration

###
# Helpers
###

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

# Build-specific configuration
configure :build do
  # Minify HTML
  activate :minify_html do |html|
    html.remove_quotes = false
    html.remove_intertag_spaces = true
  end

  # Ignore the CSS file Middleman normally generates
  # Middleman expects `site.css.scss` → `site.css`
  # We strip the `.css` to prevent Gulp generating `site.css.css`
  ignore 'stylesheets/site'

  # Ignore static files
  ignore 'static/*'

  # Check to see if file revving is enabled
  rev_manifest = REV_MANIFEST if defined?(REV_MANIFEST)

  # If file revving is enabled we need to ignore the original files
  # as they will still get copied by Middleman
  if rev_manifest
    rev_manifest.each do |key, value|
      ignore key
    end

    # Ignore the actual manifest file itself
    ignore 'rev-manifest.json'
  end
end

# Initialise Gulp Starter when running `middleman build` and `middleman serve`
activate :external_pipeline,
  name: :gulp,
  command: build? ? 'npm run production' : 'npm run gulp',
  source: GULP_CONFIG['root']['dest'],
  latency: 1
