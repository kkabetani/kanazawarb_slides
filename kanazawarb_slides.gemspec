# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kanazawarb_slides/version'

Gem::Specification.new do |spec|
  spec.name          = "kanazawarb_slides"
  spec.version       = KanazawarbSlides::VERSION
  spec.authors       = ["kkabetani"]
  spec.email         = ["k.kabetani@gmail.com"]
  spec.description   = %q{kanazawa.rb slides url collector}
  spec.summary       = %q{kanazawa.rb slides url collector}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "nokogiri" 
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 2.14.1"
end
