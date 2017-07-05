#
# Be sure to run `pod lib lint ZYImageDownloader.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'ZYImageDownloader'
  s.version          = '0.1.0'
  s.summary          = '简单封装SDWebImage用于批量下载图片.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = '简单封装SDWebImage用于批量下载图片.'

  s.homepage         = 'https://github.com/luzhiyongGit/ZYImageDownloader'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'luzhiyongGit' => 'luzhiyongmail@sohu.com' }
  s.source           = { :git => 'https://github.com/luzhiyongGit/ZYImageDownloader.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '7.0'

  s.source_files = 'ZYImageDownloader/Classes/**/*'
  
  # s.resource_bundles = {
  #   'ZYImageDownloader' => ['ZYImageDownloader/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'SDWebImage'
end
