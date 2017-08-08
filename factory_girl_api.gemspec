$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "factory_girl_api/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "factory_girl_api"
  s.version     = FactoryGirlApi::VERSION
  s.authors     = ["Philip Ingram"]
  s.email       = ["philip.d.ingram@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of FactoryGirlApi."
  s.description = "TODO: Description of FactoryGirlApi."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.3"

  s.add_development_dependency "sqlite3"
end
