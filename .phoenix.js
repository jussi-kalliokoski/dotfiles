function splitCurrentWindowToLeft () {
  var window = Window.focused();
  var screen = window.screen();
  var frame = screen.frame();
  var width = Math.floor(frame.width / 2);
  window.setFrame({
    x: frame.x,
    y: frame.y,
    width: width,
    height: frame.height,
  });
}

function splitCurrentWindowToRight () {
  var window = Window.focused();
  var screen = window.screen();
  var frame = screen.frame();
  var width = Math.floor(frame.width / 2);
  window.setFrame({
    x: frame.x + frame.width - width,
    y: frame.y,
    width: width,
    height: frame.height,
  });
}

function splitCurrentWindowToTop () {
  var window = Window.focused();
  var screen = window.screen();
  var frame = screen.frame();
  var height = Math.floor(frame.height / 2);
  window.setFrame({
    x: frame.x,
    y: frame.y,
    width: frame.width,
    height: height,
  });
}

function splitCurrentWindowToBottom () {
  var window = Window.focused();
  var screen = window.screen();
  var frame = screen.frame();
  var height = Math.floor(frame.height / 2);
  window.setFrame({
    x: frame.x,
    y: frame.y + frame.height - height,
    width: frame.width,
    height: height,
  });
}

function moveCurrentWindowTo (yPos, xPos) {
  return function () {
    var window = Window.focused();
    var screen = window.screen();
    var frame = screen.frame();
    var windowFrame = window.frame();

    var x = ({
      left: frame.x,
      center: frame.x + Math.floor(frame.width / 2) - Math.floor(windowFrame.width / 2),
      right: frame.x + frame.width - windowFrame.width,
    })[xPos];

    var y = ({
      top: frame.y,
      center: frame.y + Math.floor(frame.height / 2) - Math.floor(windowFrame.height / 2),
      bottom: frame.y + frame.height - windowFrame.height,
    })[yPos];

    window.setTopLeft({ x: x, y: y });
  }
}

var HYPER = ['cmd', 'alt', 'ctrl', 'shift'];

var handlers = [
  new Key('left', HYPER, splitCurrentWindowToLeft),
  new Key('right', HYPER, splitCurrentWindowToRight),
  new Key('up', HYPER, splitCurrentWindowToTop),
  new Key('down', HYPER, splitCurrentWindowToBottom),
  new Key('keypad1', HYPER, moveCurrentWindowTo('bottom', 'left')),
  new Key('keypad2', HYPER, moveCurrentWindowTo('bottom', 'center')),
  new Key('keypad3', HYPER, moveCurrentWindowTo('bottom', 'right')),
  new Key('keypad4', HYPER, moveCurrentWindowTo('center', 'left')),
  new Key('keypad5', HYPER, moveCurrentWindowTo('center', 'center')),
  new Key('keypad6', HYPER, moveCurrentWindowTo('center', 'right')),
  new Key('keypad7', HYPER, moveCurrentWindowTo('top', 'left')),
  new Key('keypad8', HYPER, moveCurrentWindowTo('top', 'center')),
  new Key('keypad9', HYPER, moveCurrentWindowTo('top', 'right')),
];
