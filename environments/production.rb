# Initialise Gulp Starter when running `middleman build`
activate :external_pipeline,
  name: :gulp,
  command: "npm run production",
  source: GULP_CONFIG['root']['dest'],
  latency: 1

# Ignore the CSS file Middleman normally generates
# Middleman expects `site.css.scss` → `site.css`
# We strip the `.css` to prevent Gulp generating `site.css.css`
ignore 'stylesheets/site'

# Ignore static files
ignore 'icons/*'
ignore 'static/*'

# Check to see if file revving is enabled
rev_manifest = REV_MANIFEST if defined?(REV_MANIFEST)

# If file revving is enabled we need to ignore the original files
# as they will still get copied by Middleman
if rev_manifest
  rev_manifest.each do |key, value|
    ignore key
  end
end

# Ignore the actual manifest file
ignore 'rev-manifest.json'

# HTML Optimisation
activate :minify_html do |html|
  html.remove_quotes = false
  html.remove_intertag_spaces = true
  html.remove_http_protocol = true
end
