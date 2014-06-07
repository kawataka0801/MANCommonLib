Pod::Spec.new do |s|

  s.name         = "MANCommonLib"
  s.version      = "0.0.1"
  s.summary      = "common classes in student and tutor app"
  s.homepage     = "http://github.com/kawataka0801/MANCommonLib"
  s.author             = { "kawataka0801" => "kawataka0801@gmail.com" }
  s.platform     = :ios
  s.source       = { :git => "https://github.com/kawataka0801/MANCommonLib.git", :tag => "v0.0.1" }
  s.requires_arc = true
  s.source_files  = "MANCommonLib/.*"

  s.subspec 'ApiErrorHandleHelper' do |ss|
    ss.source_files  = "MANCommonLib/ApiErrorHandleHelper.{h,m}"
  end

  s.subspec 'ApiManager' do |ss|
    ss.source_files  = "MANCommonLib/ApiManager.{h,m}"
  end

  s.subspec 'BackgroundTaskKillImageView' do |ss|
    ss.source_files  = "MANCommonLib/BackgroundTaskKillImageView.{h,m}"
    ss.resources = "MANCommonLib/BackgroundTaskKillImageView.xib"
  end

  s.subspec 'LteToWifiImageView' do |ss|
    ss.source_files  = "MANCommonLib/LteToWifiImageView.{h,m}"
    ss.resources = "MANCommonLib/LteToWifiImageView.xib"
  end

  s.subspec 'CustomTextView' do |ss|
    ss.source_files  = "MANCommonLib/CustomTextView.{h,m}"
  end

  s.subspec 'DeviceChecker' do |ss|
    ss.source_files  = "MANCommonLib/DeviceChecker.{h,m}"
  end

  s.subspec 'MBSimpleAlertUtility' do |ss|
    ss.source_files  = "MANCommonLib/MBSimpleAlertUtility.{h,m}"
  end

  s.subspec 'StoryboardClassMaker' do |ss|
    ss.source_files  = "MANCommonLib/StoryboardClassMaker.{h,m}"
  end

  s.subspec 'NSString' do |ss|
    ss.source_files  = "MANCommonLib/NSString*.{h,m}"
  end

  s.subspec 'UIAlertView' do |ss|
    ss.source_files  = "MANCommonLib/UIAlertView*.{h,m}"
  end


end
