source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

def marvelAPIClientPods
	pod 'BothamNetworking', :git => "https://github.com/Karumi/BothamNetworking", :branch => "master"
	pod 'CryptoSwift'
end

def marvelAPIClientPodsTest
    pod 'Nocilla'
    pod 'Nimble'
end

target 'MarvelAPIClient' do
	marvelAPIClientPods
end

target 'MarvelAPIClientTests' do
	marvelAPIClientPods    
	marvelAPIClientPodsTest
end

