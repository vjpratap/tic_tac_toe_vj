
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "tic_tac_toe_vj/version"

Gem::Specification.new do |spec|
  spec.name          = "tic_tac_toe_vj"
  spec.version       = TicTacToeVj::VERSION
  spec.authors       = ["Vijay Pratap Singh"]
  spec.email         = ["vijayprsingh619@gmail.com"]

  spec.summary       = "A simple terminal tic tak toe game"
  spec.description   = "You can play tic tak toe game by using this gem"
  spec.homepage      = "https://github.com/vjpratap/tic_tac_toe_vj"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.8"
end
