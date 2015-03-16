class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    # Motion::Speech::Speaker.speak Reading.new("Hello World", "Welcome to the best app ever"), rate: 0.2, pitch: 0.5, volume: 0.8

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = ReadingsViewController.new
    @window.makeKeyAndVisible

    true
  end
end
