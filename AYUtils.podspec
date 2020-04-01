Pod::Spec.new do |s|
s.name         = "AYUtils"
s.version      = "0.0.8"
s.summary      = "AYUtils"
s.description  = <<-DESC
AYUtils工具类
DESC
s.homepage     = "https://github.com/lsy076/AYUtils"
s.license      = { :type => "MIT", :file => "LICENSE" }
s.author             = { "赖盛源" => "756486059@qq.com" }
s.platform     = :ios, "8.0"
s.source       = { :git => "https://github.com/lsy076/AYUtils.git", :tag => s.version }
s.source_files = "AYUtils/AYUtils/**/*.{h,m}"
s.requires_arc = true
s.dependency 'MBProgressHUD'
end