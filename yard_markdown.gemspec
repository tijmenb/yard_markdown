# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'yard_markdown/version'

Gem::Specification.new do |spec|
  spec.name          = "yard_markdown"
  spec.version       = YardMarkdown::VERSION
  spec.authors       = ["Tijmen Brommet"]
  spec.email         = ["tijmen@gmail.com"]

  spec.summary       = %q{Create gem docs that look nice on GitHub}
  spec.description   = %q{Output a Markdown file for your YARD documentation.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "yard", "~> 0.9.5"

  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.5"
end
