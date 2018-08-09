
Pod::Spec.new do |s|

s.name         = "MRKSwift"
s.version      = "0.0.1"
s.summary      = "This framework is a useful way of developing MVVM apps with the help of RXclear"
s.description  = "Some useful tools for MVVM development"
s.homepage     = "https://github.com/furoresu/MRKSwift"
# s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"


# ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

s.license      = "MIT"
# s.license      = { :type => "MIT", :file => "FILE_LICENSE" }


# ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
s.author             = { "MRKTrace" => "mrktrace@gmail.com" }
s.social_media_url   = "http://twitter.com/OfficiaMRKTrace"

# ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
s.platform     = :ios, "9.0"
s.swift_version = "3.2"

# ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
s.source       = { :git => "https://github.com/furoresu/MRKSwift.git", :tag => "0.0.1" }


# ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
s.source_files  = "MRKSwift/src/ui/**/*.swift", "MRKSwift/src/core/**/*.swift", "MRKSwift/res/**/*.swift"

# ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
s.dependency 'RxSwift' , '4.2.0'
s.dependency 'RxCocoa' , '4.2.0'
s.dependency 'ObjectMapper' , '3.3.0'
s.dependency 'Alamofire' , '4.7.3'
s.dependency 'RxAlamofire' , '4.2.0'

end
