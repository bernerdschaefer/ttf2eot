spec = Gem::Specification.new do |s|
  s.name = "ttf2eot"
  s.summary = s.description = "Convert TTF fonts to EOT fonts"
  s.author = "Bernerd Schaefer"
  s.email = "bj.schaefer@gmail.com"
  s.version = "0.1"
  s.platform = Gem::Platform::RUBY
  s.extensions << 'ext/ttf2eot_ext/extconf.rb'
  s.files = %w(Rakefile) + Dir.glob("lib/**/*.rb") + Dir.glob("ext/**/*.{cpp,h,rb}")

  s.add_development_dependency "rake-compiler"
end
