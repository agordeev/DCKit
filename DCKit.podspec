Pod::Spec.new do |s|
  s.name        = "DCKit"
  s.version     = "1.0.7"
  s.summary     = "Set of iOS controls, which have useful IBInspectable properties. Written on Swift."
  s.homepage    = "https://github.com/agordeev/DCKit"
  s.license     = { :type => "MIT" }
  s.authors     = { "andrew8712" => "andrew8712@gmail.com" }

  s.requires_arc = true
  s.ios.deployment_target = "8.0"
  s.source   = { :git => "https://github.com/agordeev/DCKit.git", :tag => s.version.to_s}
  s.source_files = "DCKit/**/*.swift"
end
