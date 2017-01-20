# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sym/version'
BASH_COMPLETION = File.read("#{lib}/../bin/sym.bash-completion")
Gem::Specification.new do |spec|
  spec.name          = 'sym'
  spec.version       = Sym::VERSION
  spec.authors       = ['Konstantin Gredeskoul']
  spec.email         = %w(kigster@gmail.com)

  spec.summary       = %q{Simple tool to encrypt/decrypt data using symmetric aes-256-cbc encryption with a private key and an IV vector}
  spec.description   = %q{Store sensitive data safely as encrypted strings or entire files, using symmetric aes-256-cbc encryption/decryption with a secret key and an IV vector, and YAML-friendly base64-encoded encrypted result.}
  spec.homepage      = 'https://github.com/kigster/sym'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 2.2'
  spec.post_install_message = "

Please copy and paste the following BASH function into your ~/.bashrc or
equivalent, in order to enable command completion:

#{BASH_COMPLETION}

Thank you for installing Sym!
   -- KG (github.com/kigster)
"

  spec.add_dependency 'colored2', '~> 2.0'
  spec.add_dependency 'slop', '~> 4.3'
  spec.add_dependency 'activesupport'
  spec.add_dependency 'highline', '~> 1.7'
  spec.add_dependency 'clipboard', '~> 1.1'
  spec.add_dependency 'coin', '~> 0.1.8'

  spec.add_development_dependency 'codeclimate-test-reporter', '~> 1.0'
  spec.add_development_dependency 'simplecov'
  spec.add_development_dependency 'aruba'
  spec.add_development_dependency 'bundler', '~> 1'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '~> 3'
  spec.add_development_dependency 'yard'
end
