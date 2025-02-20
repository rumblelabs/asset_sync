# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

require "asset_sync/version"

Gem::Specification.new do |s|
  s.name        = "asset_sync"
  s.version     = AssetSync::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Simon Hamilton", "David Rice", "Phil McClure", "Toby Osbourn"]
  s.email       = ["shamilton@rumblelabs.com", "me@davidjrice.co.uk", "pmcclure@rumblelabs.com", "tosbourn@rumblelabs.com"]
  s.homepage    = "https://github.com/AssetSync/asset_sync"
  s.summary     = %q{Synchronises Assets in a Rails 3 application and Amazon S3/Cloudfront and Rackspace Cloudfiles}
  s.description = %q{After you run assets:precompile your compiled assets will be synchronised with your S3 bucket.}

  s.license = 'MIT'

  s.add_dependency("fog-core")
  s.add_dependency('unf')
  s.add_dependency('activemodel', ">= 4.1.0")
  s.add_dependency('mime-types', ">= 2.99")

  s.add_development_dependency "rspec"
  s.add_development_dependency "bundler"
  s.add_development_dependency "coveralls", ">= 0.7"

  s.add_development_dependency('mime-types', ">= 3.0")

  s.add_development_dependency "fog-aws"
  s.add_development_dependency "gitlab-fog-azure-rm"
  s.add_development_dependency "fog-backblaze"

  s.add_development_dependency "uglifier"
  s.add_development_dependency "appraisal"

  s.add_development_dependency "gem-release"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.metadata = {
    "bug_tracker_uri"   => "#{s.homepage}/issues",
    "changelog_uri"     => "#{s.homepage}/blob/master/CHANGELOG.md",
    "source_code_uri"   => s.homepage,
  }
end
