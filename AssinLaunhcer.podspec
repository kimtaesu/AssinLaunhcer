Pod::Spec.new do |s|
  s.name                      = "AssinLaunhcer"
  s.version                   = "1.0.0"
  s.summary                   = "AssinLaunhcer"
  s.homepage                  = "https://github.com/kimtaesu/AssinLaunhcer.git"
  s.license                   = { :type => "MIT", :file => "LICENSE" }
  s.author                    = { "Assin" => "kimtaesoo188@gmail.com" }
  s.source                    = { :git => "https://github.com/kimtaesu/AssinLaunhcer.git", :tag => s.version.to_s }
  s.ios.deployment_target     = "8.0"
  s.source_files              = "Sources/**/*"
  s.frameworks                = "Foundation"
end
