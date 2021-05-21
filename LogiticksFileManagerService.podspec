
Pod::Spec.new do |spec|
  spec.name         = "LogiticksFileManagerService"
  spec.version      = "0.0.1"
  spec.summary      = "Library for File Manager Services."
  spec.description  =  <<-DESC
  Used to write FileManger functionalities like Read,Write,Remove/Delete of files.
                   DESC

  spec.homepage     = "https://github.com/KiranLogiticiks/LogiticksFileManager"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author             = { "Kiran P Nair" => "kiran@logiticks.com" }
  
  spec.ios.deployment_target = "12.1"
  spec.swift_version = "5.0"
  spec.source       = { :git => "https://github.com/KiranLogiticiks/LogiticksFileManager.git", :tag => "#{spec.version}" }
  spec.source_files  = "LogiticksFileManagerService/**/*.swift"
end
