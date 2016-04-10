# This environment is invoked by default when running `middleman server`
activate :external_pipeline,
  name: :gulp,
  command: "npm run gulp",
  source: GULP_CONFIG['root']['dest'],
  latency: 1
