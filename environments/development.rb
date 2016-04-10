# Invoke this environment by appending `-e gulp` from the command line.
# Example: `middleman server -e gulp`
activate :external_pipeline,
  name: :gulp,
  command: "npm run gulp",
  source: GULP_CONFIG['root']['dest'],
  latency: 1
