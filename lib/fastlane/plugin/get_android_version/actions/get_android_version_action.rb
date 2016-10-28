module Fastlane
  module Actions
    module SharedValues
      GET_ANDROID_VERSION_NAME = :GET_ANDROID_VERSION_NAME
      GET_ANDROID_VERSION_CODE = :GET_ANDROID_VERSION_CODE
      GET_ANDROID_VERSION_APP_NAME = :GET_ANDROID_VERSION_APP_NAME
    end
    class GetAndroidVersionAction < Action
      def self.run(params)
        require 'apktools/apkxml'

        apk_file = params[:apk]

        # NOTE!! ALL CREDIT DUE HERE: https://github.com/devunwired/apktools/blob/master/bin/get_app_version.rb

        # Load the XML data
        parser = ApkXml.new(apk_file)
        parser.parse_xml("AndroidManifest.xml", false, true)

        elements = parser.xml_elements

        versionCode = nil
        versionName = nil
        appName = nil

        elements.each do |element|
          if element.name == "manifest"
            element.attributes.each do |attr|
              if attr.name == "versionCode"
                versionCode = attr.value
              elsif attr.name == "versionName"
                versionName = attr.value
              end
            end
          elsif element.name == "application"
            element.attributes.each.do |attr|
              if attr.name == "label"
                appName == attr.value
              end
            end
          end
        end

        if versionCode =~ /^0x[0-9A-Fa-f]+$/ #if is hex
          versionCode = versionCode.to_i(16)
        end

        Actions.lane_context[SharedValues::GET_ANDROID_VERSION_NAME] = "#{versionName}"
        Actions.lane_context[SharedValues::GET_ANDROID_VERSION_CODE] = "#{versionCode}"
        Actions.lane_context[SharedValues::GET_ANDROID_VERSION_APP_NAME] = "#{appName}"

        UI.message("extracted versionName: #{versionName} & versionCode: #{versionCode} & appName: #{appName}")
      end

      def self.description
        "gets the android versionName and versionCode and appName (label) from manifest file"
      end

      def self.authors
        ["MaximusMcCann"]
      end

      def self.return_value
        # If your method provides a return value, you can describe here what it does
      end

      def self.details
        # Optional:
        "gets the android versionName and versionCode and appName (label) from manifest file"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :apk,
                                  env_name: "GET_ANDROID_VERSION_APK",
                               description: "The apk to get the versionName and versionCode from",
                                  optional: false,
                                      type: String)
        ]
      end

      def self.output
        [
          ['GET_ANDROID_VERSION_NAME', 'The versionName extracted from the apk\'s manifest file.'],
          ['GET_ANDROID_VERSION_CODE', 'The versionCode extracted from the apk\'s manifest file. Hex values are converted to ints.']
          ['GET_ANDROID_VERSION_APP_NAME', 'The appNmae extracted from the apk\'s manifest file.']
        ]
      end

      def self.is_supported?(platform)
        platform == :android
        # Adjust this if your plugin only works for a particular platform (iOS vs. Android, for example)
        # See: https://github.com/fastlane/fastlane/blob/master/fastlane/docs/Platforms.md
      end
    end
  end
end
