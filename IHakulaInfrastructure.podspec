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

s.subspec 'Kits' do |kit|
    kit.dependency "#{s.name}/Tools/TouchJSON"
    kit.source_files = "#{s.name}/#{s.name}/Kits/*.{h,m}"
end

s.subspec 'Tools' do |tools|

    tools.subspec 'iHDebug' do |debug|
        debug.source_files = "#{s.name}/#{s.name}/Tools/iHDebug/*.{h,m}"
    end

    tools.subspec 'iHMemory' do |memory|
        memory.source_files = "#{s.name}/#{s.name}/Tools/iHMemory/*.{h,m}"
    end

    tools.subspec 'TouchJSON' do |json|
        json.source_files = "#{s.name}/#{s.name}/Tools/TouchJSON/**/*.{h,m}"
    end

    tools.subspec 'iHSingletonCloud' do |singleton|
        singleton.dependency "#{s.name}/Tools/iHDebug"
        singleton.source_files = "#{s.name}/#{s.name}/Tools/iHSingletonCloud/*.{h,m}"
    end

    tools.subspec 'iHFileManager' do |file|
        file.dependency "#{s.name}/Tools/iHDebug"
        file.source_files = "#{s.name}/#{s.name}/Tools/iHFileManager/*.{h,m}"
    end

    tools.subspec 'iHLog' do |log|
        log.dependency "#{s.name}/Common"
        log.dependency "#{s.name}/Kits"
        log.dependency "#{s.name}/Tools/iHDebug"
        log.dependency "#{s.name}/Tools/iHSingletonCloud"
        log.dependency "#{s.name}/Tools/iHFileManager"
        log.dependency "#{s.name}/Tools/iHMemory"

        log.source_files = "#{s.name}/#{s.name}/Tools/iHFileManager/*.{h,m}"
    end

    tools.subspec 'iHPubSub' do |pubsub|
        pubsub.dependency "#{s.name}/Tools/iHLog"
        pubsub.dependency "#{s.name}/Tools/iHSingletonCloud"
        pubsub.source_files = "#{s.name}/#{s.name}/Tools/iHPubSub/*.{h,m}"
    end

end

end