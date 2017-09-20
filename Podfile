source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

def marvelAPIClientPods
	pod 'BothamNetworking', :git => "https://github.com/Karumi/BothamNetworking", :branch => "swift4"
	pod 'CryptoSwift'
	pod 'SwiftyJSON'
end

def marvelAPIClientPodsTest
    pod 'Nocilla'
    pod 'Nimble', :git => "https://github.com/Quick/Nimble.git", :branch => "master"
end

target 'MarvelAPIClient' do
	marvelAPIClientPods
end

target 'MarvelAPIClientTests' do
	marvelAPIClientPods    
	marvelAPIClientPodsTest
end

