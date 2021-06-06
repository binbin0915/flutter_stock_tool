import Cocoa
import FlutterMacOS

class MainFlutterWindow: NSWindow {
  override func awakeFromNib() {
//    let flutterViewController = FlutterViewController.init()
//    let windowFrame = self.frame
//    self.contentViewController = flutterViewController
//    self.setFrame(windowFrame, display: true)
//
//    RegisterGeneratedPlugins(registry: flutterViewController)
//
//    super.awakeFromNib()
    

    //修改窗口大小
    let flutterViewController = FlutterViewController.init()
    let windowFrame = self.frame
    self.contentViewController = flutterViewController
    self.setFrame(windowFrame, display: false)
    self.setContentSize(NSSize(width: 140, height: 200))
    let window:NSWindow! = self.contentView?.window
    window.styleMask.remove(.resizable)
    window.titleVisibility = .hidden

    RegisterGeneratedPlugins(registry: flutterViewController)
         
    super.awakeFromNib()
    
  }
}
