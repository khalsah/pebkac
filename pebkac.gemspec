Gem::Specification.new do |s|
  s.name        = 'pebkac'
  s.version     = '0.0.1'
  s.authors     = ['Hargobind S. Khalsa']
  s.email       = ['khalsah@gmail.com']
  s.summary     = %q{Raise exceptions with i18n messages}
  s.license     = 'MIT'

  s.files         = `git ls-files`.split("\n")
  s.require_paths = ['lib']

  s.add_runtime_dependency 'i18n', '~> 0.6.0'
end
