#
# Be sure to run `pod lib lint MSProgress.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MSProgress'
  s.version          = '0.0.1'
  s.summary          = 'MSProgress for toast'



  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/7General'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'wanghuizhou21@163.com' => 'wanghuizhou21@163.com' }
  s.source           = { :git => 'https://github.com/7General/MSProgress.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'MSProgress/Classes/**/*'
  
   s.resource_bundles = {
     'MSProgress' => ['MSProgress/Assets/**']
   }
   
   

  
end
