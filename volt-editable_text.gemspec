# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'volt/editable_text'

Gem::Specification.new do |spec|
  spec.name          = "volt-editable_text"
  spec.version       = Volt::EditableText::VERSION
  spec.authors       = ["Ryan Stout"]
  spec.email         = ["ryan@agileproductions.com"]
  spec.summary       = %q{Volt component that gives a :editable_text control which shows text, and lets you edit the text when it is clicked on.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "volt", "~> 0.8.23"
  spec.add_development_dependency "rake"
end
