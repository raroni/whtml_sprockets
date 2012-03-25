# encoding: utf-8

Gem::Specification.new do |s|
  s.name            = "whtml_sprockets"
  s.version         = "0.0.3"
  s.authors         = "Rasmus Rønn Nielsen"
  s.email           = "rasmusrnielsen@gmail.com"
  s.homepage        = "http://rrn.dk"
  s.summary         = "WHTML template handler for Sprockets."
  s.description     = "whtml_sprockets exposes your WHTML templates to the browser throught Sprockets."
  s.require_paths   = ["lib"]
  s.add_dependency    "sprockets"
  s.files           = Dir["{lib}/**/*", "init.rb"]
end
