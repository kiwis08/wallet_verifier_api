#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint wallet_verifier_api.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'wallet_verifier_api'
  s.version          = '0.0.8'
  s.summary          = 'Verifier API Plugin for iOS Digital ID Verification'
  s.description      = <<-DESC
Verifier API Plugin for iOS Digital ID Verification
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Santiago Quihui' => 'santiagoquihui@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '13.0'
  s.ios.deployment_target = '13.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
