Pod::Spec.new do |s|
  s.name        = "DCKit"
  s.version     = "1.0.2"
  s.summary     = "Set of iOS controls, which have useful IBInspectable properties. Written on Swift."
  s.homepage    = "https://github.com/andrew8712/DCKit"
  s.license     = { :type => "MIT" }
  s.authors     = { "andrew8712" => "andrew8712@gmail.com" }

  s.requires_arc = true
  s.ios.deployment_target = "8.0"
  s.source   = { :git => "https://github.com/andrew8712/DCKit.git", :tag => "1.0.2"}
  s.source_files = "Classes/**/*.swift"
end
