Pod::Spec.new do |s|
  s.name     = 'DataEx'
  s.version  = '0.1.0'
  s.summary  = 'Phunware DataEx'
  s.homepage = 'https://github.com/phunware/maas-dataex-ios-sdk'
  s.authors  = { 'Phunware' => 'info@phunware.com' }
  s.license  = { :type => 'Copyright', :text => 'Copyright 2019 by Phunware Inc. All rights reserved.' }
  s.source   = { :git => "https://github.com/phunware/maas-dataex-ios-sdk.git", :tag => "v#{s.version}" }
  s.platform = :ios, '13.0'
  s.swift_version = '5.0'

  s.vendored_frameworks = "Frameworks/DataEx.xcframework"

  s.ios.dependency 'PWCore', '3.9.1'
end
