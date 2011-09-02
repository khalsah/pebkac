Gem::Specification.new do |s|
  s.name        = 'pebkac'
  s.version     = '0.0.2'
  s.authors     = ['Hargobind S. Khalsa']
  s.email       = ['khalsah@gmail.com']
  s.summary     = %q{Raise exceptions with i18n messages}
  s.license     = 'MIT'

  s.homepage    = 'http://github.com/khalsah/pebkac'

  s.files         = `git ls-files`.split("\n")
  s.require_paths = ['lib']

  s.has_rdoc         = true
  s.extra_rdoc_files = ['README.rdoc']

  s.add_runtime_dependency 'i18n', '~> 0.6.0'
end
