#
# Be sure to run `pod lib lint MSProgress.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |spec|
  spec.name             = 'MSProgress'
  spec.version          = '0.0.4'
  spec.summary          = 'MSProgress for toast'

  spec.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  spec.homepage         = 'https://github.com/7General'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'wanghuizhou21@163.com' => 'wanghuizhou21@163.com' }
  spec.source           = { :git => 'https://github.com/7General/MSProgress.git', :tag => spec.version.to_s }

  spec.ios.deployment_target = '10.0'

  spec.source_files = 'MSProgress/Classes/**/*'
  spec.resource     = 'MSProgress/Assets/MSProgress.bundle'

   
   

  
end
