# frozen_string_literal: true

require_relative "lib/urban_news/version"

Gem::Specification.new do |spec|
  spec.name = "urban_news"
  spec.version = UrbanNews::VERSION
  spec.authors = ["Heidi Hlavinka"]
  spec.email = ["hchlav@gmail.com"]

  spec.summary = "Urban News is an article aggregator."
  spec.description = "Urban News finds the latest research articles on urban issues affecting Houston, Texas and the nation."
  spec.homepage = "https://github.com/heidihlav/urban_news.git"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "'https://rubygems.org/'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/heidihlav/urban_news.git"
  spec.metadata["changelog_uri"] = "https://github.com/heidihlav/urban_news/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "pry"
  spec.add_dependency "nokogiri"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
