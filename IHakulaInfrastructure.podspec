Pod::Spec.new do |s|

# 1
s.platform = :ios
s.ios.deployment_target = '7.1'
s.name = "Base"
s.summary = "IHakulaBase shoudl be prepared when you want to use all IHakula components."
s.requires_arc = true

# 2
s.version = "0.9.0"

# 3
s.license = { :type => "MIT", :file => "LICENSE" }

# 4 - Replace with your name and e-mail address
s.author = { "Wayde Sun" => "wsun191@gmail.com" }

# 5 - Replace this URL with your own Github page's URL (from the address bar)
s.homepage = "https://github.com/wayde191/IHakulaBase"

# 6 - Replace this URL with your own Git URL from "Quick Setup"
s.source = { :git => "https://github.com/wayde191/IHakulaBase.git", :tag => "#{s.version}"}

# 7
s.framework = "UIKit", "Foundation"

# 8
s.source_files = "Base/*.{h}", "Base/**/*.{h,m}", "Base/**/**/*.{h,m}"

end