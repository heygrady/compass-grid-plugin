# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "compass/grid/version"

Gem::Specification.new do |s|
  s.name        = 'compass-grid'
  s.version     = Compass::Grid::VERSION
  s.platform    = Gem::Platform::RUBY
  s.summary     = "Compass extension based on the 1KB CSS Grid"
  s.description = "Compass extension based on the 1KB CSS Grid designed to utilize Sass and Compass to remove unnecessary classes from the HTML markup and make customization easier."
  s.homepage    = 'https://github.com/heygrady/1KB-SCSS-Grid'
  s.authors     = ["Grady Kuhnline"]
  s.email       = ["github@heygrady.net"]

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency("compass")
end