#
# Be sure to run `pod lib lint VerticallyButton.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'VerticallyButton'
  s.version          = '0.1.1'
  s.summary          = 'Vertically aligned components.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
UIButton that have vertically aligned components.
                       DESC

  s.homepage         = 'https://github.com/zeushin/VerticallyButton'
  s.screenshots      = 'https://raw.githubusercontent.com/zeushin/VerticallyButton/master/Screenshots/VerticallyButton.png', 'https://raw.githubusercontent.com/zeushin/VerticallyButton/master/Screenshots/VerticallyButton.gif'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Masher Shin' => 'zeushin@gmail.com' }
  s.source           = { :git => 'https://github.com/zeushin/VerticallyButton.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/masher_s'

  s.ios.deployment_target = '8.0'

  s.source_files = 'VerticallyButton/Classes/**/*'
  
  # s.resource_bundles = {
  #   'VerticallyButton' => ['VerticallyButton/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'Foundation'
  # s.dependency 'AFNetworking', '~> 2.3'
end
