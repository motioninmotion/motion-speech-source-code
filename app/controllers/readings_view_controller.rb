class ReadingsViewController < UIViewController
  def loadView
    super

    view.backgroundColor = UIColor.whiteColor

    view.addSubview(@title_field = UITextField.new)
    view.addSubview(@content_field = UITextView.new)
    view.addSubview(@play_button = UIButton.buttonWithType(UIButtonTypeSystem))
    view.addSubview(@pause_button = UIButton.buttonWithType(UIButtonTypeSystem))
    view.addSubview(@stop_button = UIButton.buttonWithType(UIButtonTypeSystem))

    @title_field.frame = [[20, 50], [view.frame.size.width - 40, 30]]
    @title_field.placeholder = "Title"
    @title_field.layer.borderColor = UIColor.grayColor.CGColor
    @title_field.layer.borderWidth = 1.0

    @content_field.frame = [[20, 100], [view.frame.size.width - 40, 150]]
    @content_field.layer.borderColor = UIColor.grayColor.CGColor
    @content_field.layer.borderWidth = 1.0

    @play_button.setTitle("Play", forState: UIControlStateNormal)
    @play_button.frame = [[20, 280], [(view.frame.size.width - 40) / 3, 30]]

    @pause_button.setTitle("Pause", forState: UIControlStateNormal)
    @pause_button.frame = [[20 + ((view.frame.size.width - 40) / 3), 280], [(view.frame.size.width - 40) / 3, 30]]

    @stop_button.setTitle("Stop", forState: UIControlStateNormal)
    @stop_button.frame = [[20 + ((view.frame.size.width - 40) / 3 * 2), 280], [(view.frame.size.width - 40) / 3, 30]]
  end

  def viewWillAppear(animated)
    super
    @play_button.addTarget(self, action: 'play_button_tapped:', forControlEvents: UIControlEventTouchUpInside)
    @pause_button.addTarget(self, action: 'pause_button_tapped:', forControlEvents: UIControlEventTouchUpInside)
    @stop_button.addTarget(self, action: 'stop_button_tapped:', forControlEvents: UIControlEventTouchUpInside)
  end

  def play_button_tapped(_)
    if @speaker && @speaker.paused?
      @speaker.resume
    else
      @reading = Reading.new(@title_field.text, @content_field.text)
      @speaker = Motion::Speech::Speaker.speak @reading
    end
  end

  def pause_button_tapped(_)
    if @speaker
      @speaker.pause :immediate
    end
  end

  def stop_button_tapped(_)
    if @speaker
      @speaker.stop :immediate
    end
  end
end
