require 'rubygems/package_task'
require 'rake/extensiontask'
require 'rake/javaextensiontask'

def gemspec
  @clean_gemspec ||= eval(File.read(File.expand_path('../../midori_http_parser.gemspec', __FILE__)))
end

Gem::PackageTask.new(gemspec) do |pkg|
end

Rake::ExtensionTask.new("ruby_http_parser", gemspec) do |ext|
  unless RUBY_PLATFORM =~ /mswin|mingw/
    ext.cross_compile = true
    ext.cross_platform = ['x86-mingw32', 'x86-mswin32-60']

    # inject 1.8/1.9 pure-ruby entry point
    ext.cross_compiling do |spec|
      spec.files += ['lib/ruby_http_parser.rb']
    end
  end
end

file 'lib/ruby_http_parser.rb' do |t|
  File.open(t.name, 'wb') do |f|
    f.write <<-eoruby
RUBY_VERSION =~ /(\\d+.\\d+)/
require "\#{$1}/ruby_http_parser"
    eoruby
  end
  at_exit{ FileUtils.rm t.name if File.exists?(t.name) }
end

if Rake::Task.task_defined?(:cross)
  task :cross => 'lib/ruby_http_parser.rb'
end
