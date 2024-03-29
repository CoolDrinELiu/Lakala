# frozen_string_literal: true

require_relative "lib/lakala/version"

Gem::Specification.new do |spec|
  spec.name = "lakala"
  spec.version = Lakala::VERSION
  spec.authors = ["drineliu"]
  spec.email = ["drine.liu@external.tablecheck.com"]

  spec.summary = "Lakala gem"
  spec.description = "Lakala gem with some basic features"
  spec.homepage = "https://github.com/tablecheck/Lakala"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end

  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "webmock", "~> 3.19", '>= 3.19.1'
end
