Pod::Spec.new do |s|

s.platform                 = :ios
s.ios.deployment_target    = '7.1'
s.name                     = "IHakulaInfrastructure"
s.author                   = { "Wayde Sun" => "wsun191@gmail.com" }
s.homepage                 = "https://github.com/wayde191/IHakulaInfrastructure"
s.summary                  = "IHakulaInfrastructure shoudl be prepared when you want to use all IHakula components."
s.version                  = "0.1.0"
s.source                = { :git => "https://github.com/wayde191/IHakulaInfrastructure.git", :tag => "#{s.version}"}

s.requires_arc             = true
s.framework                = "UIKit", "Foundation"

s.source_files  = "#{s.name}/*.{h}"

s.subspec 'DB' do |db|
    db.source_files = '#{s.name}/DB/*.{h,m}'
end

end