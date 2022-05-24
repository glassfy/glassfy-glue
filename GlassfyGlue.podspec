#
# Be sure to run `pod lib lint GlassfyGlue.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'GlassfyGlue'
  s.version          = '1.3.0-beta1'
  s.summary          = 'Glassfy Glue'

  s.homepage         = 'https://github.com/glassfy/glassfy-glue.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'marcopifferi' => 'piff@glassfy.io' }
  s.source           = { :git => 'https://github.com/glassfy/glassfy-glue.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'
  s.osx.deployment_target = '10.15'


  s.source_files = 'Public/*.h','Sources/*.{h,m}'
  
  s.public_header_files = 'Public/*.h'
  s.dependency 'Glassfy', '1.3.1'
end
