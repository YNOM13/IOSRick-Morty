# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'RickAndMortyIOS' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for RickAndMortyIOS
  pod 'Alamofire', '5.0'
  pod 'Moya'
  pod 'ObjectMapper'
  pod 'Kingfisher'
  pod 'SnapKit'
  pod 'SkeletonView'
  pod 'RealmSwift'
  pod 'CCBottomRefreshControl'
  pod 'AlamofireNetworkActivityLogger'
  pod 'ShiftTransitions'
  pod 'lottie-ios'

end

post_install do |installer|
    installer.generated_projects.each do |project|
        project.targets.each do |target|
            target.build_configurations.each do |config|
                config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
            end
        end
    end
end
