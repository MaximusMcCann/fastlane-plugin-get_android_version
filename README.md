# get_android_version plugin

[![fastlane Plugin Badge](https://rawcdn.githack.com/fastlane/fastlane/master/fastlane/assets/plugin-badge.svg)](https://rubygems.org/gems/fastlane-plugin-get_android_version)

## Getting Started

This project is a [fastlane](https://github.com/fastlane/fastlane) plugin. To get started with `fastlane-plugin-get_android_version`, add it to your project by running:

```bash
fastlane add_plugin get_android_version
```

## About get_android_version

Gets the android versionName, versionCode and appName (label) from the `AndroidManifest.xml` file located in the provided apk.

Usage:

```
get_android_version(apk: "path/to/your/file.apk")
```

Sets these keys

`GET_ANDROID_VERSION_NAME : String` = The versionName extracted from the apk's manifest file.

`GET_ANDROID_VERSION_CODE : String` = The versionCode extracted from the apk's manifest file. Hex values are converted to int strings.

`GET_ANDROID_VERSION_APP_NAME : String` = The appName (label) extracted from the apk's manifest file.

## Example

Check out the [example `Fastfile`](fastlane/Fastfile) to see how to use this plugin. Try it by cloning the repo, running `fastlane install_plugins` and `bundle exec fastlane test`.

**Note to author:** Please set up a sample project to make it easy for users to explore what your plugin does. Provide everything that is necessary to try out the plugin in this project (including a sample Xcode/Android project if necessary)

## Run tests for this plugin

To run both the tests, and code style validation, run

```
rake
```

To automatically fix many of the styling issues, use
```
rubocop -a
```

## Issues and Feedback

For any other issues and feedback about this plugin, please submit it to this repository.

## Troubleshooting

If you have trouble using plugins, check out the [Plugins Troubleshooting](https://github.com/fastlane/fastlane/blob/master/fastlane/docs/PluginsTroubleshooting.md) doc in the main `fastlane` repo.

## Using `fastlane` Plugins

For more information about how the `fastlane` plugin system works, check out the [Plugins documentation](https://github.com/fastlane/fastlane/blob/master/fastlane/docs/Plugins.md).

## About `fastlane`

`fastlane` is the easiest way to automate beta deployments and releases for your iOS and Android apps. To learn more, check out [fastlane.tools](https://fastlane.tools).

## Credit `apktools`

https://github.com/devunwired/apktools
