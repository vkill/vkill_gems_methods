# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "vkill_gems_methods/version"

Gem::Specification.new do |s|
  s.name        = "vkill_gems_methods"
  s.version     = VkillGemsMethods::VERSION
  s.authors     = ["vkill"]
  s.email       = ["vkill.net@gmail.com"]
  s.homepage    = ""
  s.summary     = "vkill'gems public methods"
  s.description = "vkill'gems public methods"

  s.rubyforge_project = "vkill_gems_methods"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency 'bundler'
  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
  s.add_development_dependency "guard-rspec"
  s.add_dependency "activesupport", "~> 3.0"
end

