Pod::Spec.new do |s|

s.platform                 = :ios
s.ios.deployment_target    = '7.1'
s.version                  = "0.1.0"
s.name                     = "IHakulaInfrastructure"
s.author                   = { "Wayde Sun" => "wsun191@gmail.com" }
s.homepage                 = "https://github.com/wayde191/IHakulaInfrastructure"
s.summary                  = "IHakulaInfrastructure shoudl be prepared when you want to use all IHakula components."
s.source                = { :git => "https://github.com/wayde191/IHakulaInfrastructure.git", :tag => "#{s.version}"}
s.license               = { :type => "MIT", :file => "LICENSE" }

s.requires_arc             = true
s.framework                = "UIKit", "Foundation"

s.public_header_files = "#{s.name}/#{s.name}/**/*.{h}"
s.source_files  = "#{s.name}/#{s.name}/*.{h}"

s.subspec 'Common' do |cm|
    cm.source_files = "#{s.name}/#{s.name}/Common/*.{h,m}"
end

s.subspec 'Tools' do |tools|

    tools.subspec 'iHDebug' do |debug|
        debug.source_files = "#{s.name}/#{s.name}/Tools/iHDebug/*.{h,m}"
    end

    tools.subspec 'iHSingletonCloud' do |singleton|
        singleton.dependency "#{s.name}/Tools/iHDebug"
        singleton.source_files = "#{s.name}/#{s.name}/Tools/iHSingletonCloud/*.{h,m}"
    end

end

end