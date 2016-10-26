# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fastlane/plugin/get_android_version/version'

Gem::Specification.new do |spec|
  spec.name          = 'fastlane-plugin-get_android_version'
  spec.version       = Fastlane::GetAndroidVersion::VERSION
  spec.author        = %q{MaximusMcCann}
  spec.email         = %q{mxmccann@gmail.com}

  spec.summary       = %q{gets the android versionName and versionCode from the `AndroidManifest.xml` file located in the provided apk}
  spec.homepage      = "https://github.com/MaximusMcCann/fastlane-plugin-get_android_version"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*"] + %w(README.md LICENSE)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  # spec.add_dependency 'your-dependency', '~> 1.0.0'
  spec.add_dependency 'apktools'

  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'fastlane', '>= 1.106.2'
end
