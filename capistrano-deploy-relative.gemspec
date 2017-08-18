# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "capistrano-deploy-relative"
  s.version     = "0.1.0"
  s.licenses    = ["MIT"]
  s.authors     = ["Tom Hanoldt"]
  s.email       = ["tom@creative-workflow.berlin"]
  s.homepage    = "https://github.com/creative-workflow/capistrano-deploy-relative"
  s.summary     = %q{This gem overrides capistranos link tasks and replaces them by using relative paths. This could be usefull if you are in a shared hosting environment.}
  s.description = %q{This gem overrides capistranos link tasks and replaces them by using relative paths. This could be usefull if you are in a shared hosting environment.}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_dependency "capistrano", "~> 3.0"
end
