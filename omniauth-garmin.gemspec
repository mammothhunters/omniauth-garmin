require File.expand_path("../lib/omniauth-garmin/version", __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "omniauth-garmin"
  gem.version       = OmniAuth::Garmin::VERSION

  gem.authors       = ["Pablo Pascual", "Xavier Vila"]
  gem.email         = ["pablo@mhunters.com", "xavier@mhunters.com"]
  gem.description   = "A OAuth (1.0/1.0a) strategy for Garmin."
  gem.summary       = gem.description
  gem.homepage      = "https://github.com/mammothhunters/omniauth-garmin"
  gem.license       = "MIT"

  gem.add_dependency "omniauth-oauth", "~> 1.1.0"
  gem.add_development_dependency "bundler", "~> 1.9"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.require_paths = ["lib"]
end
