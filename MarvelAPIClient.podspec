Pod::Spec.new do |s|
  s.name         = "MarvelAPIClient"
  s.version      = "0.0.1"
  s.summary      = "Marvel API Client implementation written in Swift."
  s.author       = "GoKarumi S.L."
  s.homepage     = "https://github.com/karumi/MarvelAPIClient"
  s.license      = "Apache License V2.0"
  
  s.platform     = :ios
  s.platform     = :ios, "8.0"

  s.source       = { :git => "git@github.com:Karumi/MarvelApiClient.git", :tag => s.version }
  s.source_files = "Classes", "MarvelApiClient/*.swift"

  s.requires_arc = true

  s.dependency "BothamNetworking"
  s.dependency "CryptoSwift"
  s.dependency "SwiftyJSON"

end
