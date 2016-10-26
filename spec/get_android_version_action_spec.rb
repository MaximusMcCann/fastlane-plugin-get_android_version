describe Fastlane::Actions::GetAndroidVersionAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The get_android_version plugin is working!")

      Fastlane::Actions::GetAndroidVersionAction.run(nil)
    end
  end
end
