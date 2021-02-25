require_relative "lib/email_tracker/version"

Gem::Specification.new do |spec|
  spec.name        = "email_tracker"
  spec.version     = EmailTracker::VERSION
  spec.authors     = ["Alex Dubov"]
  spec.email       = ["alex@alexdub.me"]
  spec.homepage    = "http://github.com/adubov1/email_tracker"
  spec.summary     = "Tracks emails"
  spec.description = "MMD Email Tracker"
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"



  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", ">= 6.0.0"
  spec.add_dependency "que", "~> 0.14.3"
  spec.add_dependency "httparty", "~> 0.18.1"
end
