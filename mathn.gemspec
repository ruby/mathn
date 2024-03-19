# coding: utf-8
version = File.read(File.join(__dir__, "lib/mathn.rb"))[/^ *VERSION *= *"\K.*?(?=")/]

Gem::Specification.new do |spec|
  spec.name          = "mathn"
  spec.version       = version
  spec.authors          = ["Keiju ISHITSUKA"]
  spec.email            = ["keiju@ishitsuka.com"]

  spec.summary          = "Deprecated library that extends math operations."
  spec.description      = "Deprecated library that extends math operations."
  spec.homepage      = "https://github.com/ruby/mathn"
  spec.license          = "BSD-2-Clause"

  gemspec = File.basename(__FILE__)
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      f == gemspec or
        f.match(%r{\A(?:bin|test|spec|features|rakelib)/|\A(?:Gem|Rake)file|\.(?:git|travis)})
    end
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.required_ruby_version = ">= 2.5"
  spec.require_paths = ["lib"]

  spec.add_dependency "cmath"
end
