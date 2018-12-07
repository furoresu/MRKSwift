
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

	# ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
	s.dependency 'RxSwift' , '4.2.0'
	s.dependency 'RxCocoa' , '4.2.0'
	s.dependency 'ObjectMapper' , '3.3.0'
	s.dependency 'Alamofire' , '4.7.3'
	s.dependency 'RxAlamofire' , '4.2.0'


	# ――― Sub specs ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

	s.subspec 'MVVM' do |mvvm|
		mvvm.source_files  = 	"MRKSwift/src/ui/viewModel/MRKGenericViewControllerViewModel.swift",
								"MRKSwift/src/core/extension/Rx/Rx+UIViewController.swift"
	end

	s.subspec 'Navigation' do |nav|
		nav.dependency "MRKSwift/MVVM"
		nav.source_files  = "MRKSwift/src/ui/viewModel/MRKGenericNavigationViewModel.swift",
							"MRKSwift/src/core/utils/transition/MRKTransitionRule.swift",
							"MRKSwift/res/transitions/*.swift"
	end

	s.subspec 'Representers' do |rep|
		rep.source_files  =	"MRKSwift/src/core/extension/UICollectionView/*.swift",
							"MRKSwift/src/core/extension/UITableView/*.swift",
							"MRKSwift/src/core/extension/UIView/*.swift"
	end

	s.subspec 'MapUtils' do |map|
		map.dependency "MRKSwift/MVVM"
		map.dependency "MRKSwift/Representers"
		map.source_files  = "MRKSwift/src/ui/viewModel/MRKGenericMapViewModel.swift",
							"MRKSwift/src/ui/representer/MRKMapRepresenter.swift",
							"MRKSwift/src/ui/representer/MRKMapClusterRepresenter.swift"
	end
end
