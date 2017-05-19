# coding: utf-8
Gem::Specification.new do |spec|
  spec.name          = "mathn"
  spec.version       = "0.1.0"
  spec.authors          = ["Keiju ISHITSUKA"]
  spec.email            = [nil]

  spec.summary          = "Deprecated library that extends math operations."
  spec.description      = "Deprecated library that extends math operations."
  spec.homepage      = "https://github.com/ruby/mathn"
  spec.license          = "BSD-2-Clause"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.extensions    = ["ext/mathn/complex/extconf.rb", "ext/mathn/rational/extconf.rb"]
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rake-compiler"
end
