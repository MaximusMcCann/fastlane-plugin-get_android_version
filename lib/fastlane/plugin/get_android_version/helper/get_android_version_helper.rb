module Fastlane
  module Helper
    class GetAndroidVersionHelper
      # class methods that you define here become available in your action
      # as `Helper::GetAndroidVersionHelper.your_method`
      #
      def self.show_message
        UI.message("Hello from the get_android_version plugin helper!")
      end
    end
  end
end
