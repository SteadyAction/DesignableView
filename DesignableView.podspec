Pod::Spec.new do |s|

  s.name             = "DesignableView"
  s.version          = "0.0.2"
  s.summary          = "Designable View for iOS"
  s.swift_version    = '4.0'

  s.description  = <<-DESC
  Designable View for iOS: Deisgn a view as you want
                   DESC

  s.homepage     = "https://github.com/SteadyAction/DesignableView"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"

  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author             = { "SteadyAction" => "steadyaction@gmail.com" }


  # s.platform     = :ios
  # s.platform     = :ios, "5.0"

  s.ios.deployment_target = "10.0"
  # s.osx.deployment_target = "10.7"
  # s.watchos.deployment_target = "2.0"
  # s.tvos.deployment_target = "9.0"

  s.source       = { :git => "https://github.com/SteadyAction/DesignableView.git", :tag => "#{s.version}" }
  s.source_files  = "Sources/*"

  # s.exclude_files = "Classes/Exclude"
  # s.public_header_files = "Classes/**/*.h"

  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # s.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"


  # s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end
