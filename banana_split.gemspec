# encoding: utf-8
require File.expand_path('../lib/banana_split/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name    = 'banana_split'
  gem.version = BananaSplit::VERSION::STRING
  gem.date    = Time.now.strftime('%Y-%m-%d')
  
  gem.summary = "AB testing for Rails"
  gem.description = "Description not written yet."
  
  gem.authors  = ['Dennis Plougman Buus', 'Rasmus Rønn Nielsen']
  gem.email    = 'rasmusrnielsen@gmail.com'
#  gem.homepage = ''
  
  gem.rubyforge_project = nil
  gem.has_rdoc = true
#  gem.rdoc_options = ['--main', 'README.rdoc', '--charset=UTF-8']
#  gem.extra_rdoc_files = ['README.rdoc', 'LICENSE', 'CHANGELOG.rdoc']
  
  gem.files = Dir['{bin,lib,rails,test,spec}/**/*', 'README*', 'LICENSE*']

  gem.add_dependency 'rails', '~> 3.2'
end
