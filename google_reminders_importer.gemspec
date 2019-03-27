# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "google_reminders_importer/version"

Gem::Specification.new do |spec|
  spec.name          = "google_reminders_importer"
  spec.version       = GoogleRemindersImporter::VERSION
  spec.authors       = ["Rick Peyton"]
  spec.email         = ["peytorb@gmail.com"]

  spec.summary       = %q{Turn a Google Reminders export into an array of Google Reminder objects}
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
