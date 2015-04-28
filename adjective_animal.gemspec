# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'adjective_animal/version'

Gem::Specification.new do |spec|
  spec.name          = "adjective_animal"
  spec.version       = AdjectiveAnimal::VERSION
  spec.authors       = ["montch"]
  spec.email         = ["montch@gmail.com"]
  spec.summary       = %q{ Creates an adjective and an animal}
  spec.description   = %q{ No, really, that's all it does}
  spec.homepage      = "https://github.com/montch/adjective_animal"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-debugger"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "pry-rescue"
  spec.add_development_dependency "pry-stack_explorer"
end
