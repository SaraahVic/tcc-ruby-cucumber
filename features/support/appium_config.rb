require 'appium_lib'

@capabilitie = {
  caps: {
    platformName: 'Android',
    deviceName: 'Android Emulator',
    app: '/path/to/your/app.apk',
    appPackage: 'com.example.android',
    appActivity: 'MainActivity'
  }
}