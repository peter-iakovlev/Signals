Pod::Spec.new do |s|

  s.name         = "SSignalKit"
  s.version      = "0.0.1"
  s.summary      = "An experimental Rx- and RAC-3.0-inspired FRP framework"
  s.homepage     = "https://github.com/PauloMigAlmeida/Signals"
  s.license      = "MIT"

  s.authors            = { "Peter Iakovlev" => '', "Paulo Miguel Almeida" => "paulo.ubuntu@gmail.com" }
  s.social_media_url   = 'http://twitter.com/PauloMigAlmeida'

  s.platform     = :ios, "6.0"

  s.source       = { :git => "https://github.com/PauloMigAlmeida/Signals.git", :tag => "0.0.1" }
  s.source_files  = "SSignalKit/**/*.{h,m}"
  s.requires_arc = true

end
