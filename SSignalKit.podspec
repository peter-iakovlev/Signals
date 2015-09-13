Pod::Spec.new do |s|

  s.name         = "SSignalKit"
  s.version      = "0.0.2"
  s.summary      = "An experimental Rx- and RAC-3.0-inspired FRP framework"
  s.homepage     = "https://github.com/PauloMigAlmeida/Signals"
  s.license      = "MIT"

  s.authors            = { "Peter Iakovlev" => '', "Paulo Miguel Almeida" => "paulo.ubuntu@gmail.com" }
  s.social_media_url   = 'http://twitter.com/PauloMigAlmeida'

  s.ios.deployment_target = "6.0"
  s.osx.deployment_target = "10.7"

  s.source       = { :git => "https://github.com/PauloMigAlmeida/Signals.git", :tag => s.version }
  s.source_files  = "SSignalKit/**/*.{h,m}"
  s.requires_arc = true

end
