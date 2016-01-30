cask 'android-studio-canary' do
  version '2.0.0.8-143.2563049'
  sha256 '9ec8e4b26806e1890c8214bf058b1b86a110675e0caa1b0643c9f625c54e9c7c'
  
  url "https://dl.google.com/dl/android/studio/ide-zips/#{version.sub(%r{-.*}, '')}/android-studio-ide-#{version.sub(%r{.*?-}, '')}-mac.zip"
  name 'Android Studio Canary'
  homepage 'https://sites.google.com/a/android.com/tools/download/studio/canary'
  license :apache

  # To prevent a conflict with Android Studio 1.5, we should rename Android Studio to Android Studio 2
  # For more information, please visit : http://tools.android.com/tips/using-multiple-android-studio-versions
  # Please note that Android Studio 2.0 Preview, use a different folder for user data and settings than Android Studio 1.5
  app 'Android Studio.app', :target => 'Android Studio 2.app'

  zap delete: [
                '~/Library/Preferences/AndroidStudio*',
                '~/Library/Preferences/com.google.android.studio.plist',
                '~/Library/Application Support/AndroidStudio*',
                '~/Library/Logs/AndroidStudio*',
                '~/Library/Caches/AndroidStudio*',
              ],
      rmdir:  '~/AndroidStudioProjects'

  caveats do
    depends_on_java
  end
end