Pod::Spec.new do |s|

s.platform                 = :ios
s.ios.deployment_target    = '7.1'
s.version                  = "0.1.8"
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

s.subspec 'Additions' do |ad|
    ad.source_files = "#{s.name}/#{s.name}/Additions/**/*.{h,m}"
end

s.subspec 'Common' do |cm|
    cm.source_files = "#{s.name}/#{s.name}/Common/*.{h,m}"
end

s.subspec 'Kits' do |kit|
    kit.dependency "#{s.name}/Tools/TouchJSON"
    kit.source_files = "#{s.name}/#{s.name}/Kits/*.{h,m}"
end

s.subspec 'DB' do |db|
    db.dependency "#{s.name}/Kits"
    db.dependency "#{s.name}/Tools/iHDebug"
    db.dependency "#{s.name}/Tools/iHSingletonCloud"
    db.dependency "#{s.name}/Tools/iHNetworkMonitor"

    db.source_files = "#{s.name}/#{s.name}/DB/*.{h,m}"
end

s.subspec 'Tools' do |tools|

    tools.subspec 'iHDebug' do |debug|
        debug.source_files = "#{s.name}/#{s.name}/Tools/iHDebug/*.{h,m}"
    end

    tools.subspec 'iHMemory' do |memory|
        memory.source_files = "#{s.name}/#{s.name}/Tools/iHMemory/*.{h,m}"
    end

    tools.subspec 'iHAlertView' do |alert|
        alert.source_files = "#{s.name}/#{s.name}/Tools/iHAlertView/*.{h,m}"
    end

    tools.subspec 'TouchJSON' do |json|
        json.source_files = "#{s.name}/#{s.name}/Tools/TouchJSON/**/*.{h,m}"
    end

    tools.subspec 'XMLParser' do |xml|
        xml.source_files = "#{s.name}/#{s.name}/Tools/XMLParser/**/*.{h,m}"
    end

    tools.subspec 'iHSingletonCloud' do |singleton|
        singleton.dependency "#{s.name}/Tools/iHDebug"
        singleton.source_files = "#{s.name}/#{s.name}/Tools/iHSingletonCloud/*.{h,m}"
    end

    tools.subspec 'iHFileManager' do |file|
        file.dependency "#{s.name}/Tools/iHDebug"
        file.source_files = "#{s.name}/#{s.name}/Tools/iHFileManager/*.{h,m}"
    end

    tools.subspec 'iHImageCompresser' do |compresser|
        compresser.dependency "#{s.name}/Additions"
        compresser.dependency "#{s.name}/Tools/iHDebug"

        compresser.source_files = "#{s.name}/#{s.name}/Tools/iHImageCompresser/*.{h,m}"
    end

    tools.subspec 'iHLog' do |log|
        log.dependency "#{s.name}/Common"
        log.dependency "#{s.name}/Kits"
        log.dependency "#{s.name}/Tools/iHDebug"
        log.dependency "#{s.name}/Tools/iHSingletonCloud"
        log.dependency "#{s.name}/Tools/iHFileManager"
        log.dependency "#{s.name}/Tools/iHMemory"

        log.source_files = "#{s.name}/#{s.name}/Tools/iHLog/*.{h,m}"
    end

    tools.subspec 'iHPubSub' do |pubsub|
        pubsub.dependency "#{s.name}/Tools/iHLog"
        pubsub.dependency "#{s.name}/Tools/iHSingletonCloud"
        pubsub.source_files = "#{s.name}/#{s.name}/Tools/iHPubSub/*.{h,m}"
    end

    tools.subspec 'iHNetworkMonitor' do |mo|
        mo.dependency "#{s.name}/Tools/iHDebug"
        mo.dependency "#{s.name}/Tools/iHSingletonCloud"
        mo.dependency "#{s.name}/Tools/iHLog"
        mo.dependency "#{s.name}/Tools/iHPubSub"

        mo.source_files = "#{s.name}/#{s.name}/Tools/iHNetworkMonitor/*.{h,m}"
    end

    tools.subspec 'iHEngine' do |mo|
        mo.dependency "#{s.name}/Kits"
        mo.dependency "#{s.name}/Common"
        mo.dependency "#{s.name}/DB"
        mo.dependency "#{s.name}/Tools/iHSingletonCloud"
        mo.dependency "#{s.name}/Tools/iHLog"
        mo.dependency "#{s.name}/Tools/iHNetworkMonitor"

        mo.source_files = "#{s.name}/#{s.name}/Tools/iHEngine/*.{h,m,plist}"
    end

end

end