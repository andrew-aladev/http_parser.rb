Gem::Specification.new do |s|
  s.name = "midori_http_parser"
  s.version = "0.6.1.3"
  s.summary = "Simple callback-based HTTP request/response parser"
  s.description = "Fast Ruby Parser inpired by Node"
  s.platform = 'ruby'
  s.authors = ["Delton Ding"]
  s.email   = ["delton@heckpsi.com"]
  s.license = 'MIT'

  s.homepage = "https://github.com/midori-rb/http_parser.rb"
  s.files = `git ls-files`.split("\n") + Dir['ext/ruby_http_parser/vendor/**/*']

  s.require_paths = ["lib"]
  s.extensions    = ["ext/ruby_http_parser/extconf.rb"]

  s.add_development_dependency 'rake-compiler', '>= 0.7.9'
  s.add_development_dependency 'rspec', '>= 3'
  s.add_development_dependency 'json', '>= 1.4.6'
  s.add_development_dependency 'benchmark_suite'
  s.add_development_dependency 'ffi'

  s.add_development_dependency 'yajl-ruby', '>= 0.8.1' unless RUBY_PLATFORM =~ /java/
end
