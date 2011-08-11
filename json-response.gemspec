# -*- encoding: utf-8 -*-
require File.expand_path('../lib/json_response', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Matte Noble"]
  gem.email         = ["me@mattenoble.com"]
  gem.description   = %q{Define factories to be built as JSON.}
  gem.summary       = %q{Define factories to be built as JSON.}

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "json-response"
  gem.require_paths = ["lib"]
  gem.version       = JSONResponse::VERSION

  gem.add_development_dependency "rspec", "~> 2.6.0"
end
