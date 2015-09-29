//
//  MainWindowController.swift
//  Dice
//
//  Created by Stephen Skubik-Peplaski on 9/23/15.
//  Copyright © 2015 Stephen Skubik-Peplaski. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController {
    
    override var windowNibName: String {
        return "MainWindowController"
    }

    override func windowDidLoad() {
        super.windowDidLoad()

        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }
    
    // MARK: - Actions
    
    var configurationWindowController: ConfigurationWindowController?
    
    @IBAction func showDieConfiguration(sender: AnyObject?) {
        if let window = window, let dieView = window.firstResponder as? DieView {
            
            //Create and configure the window controller to present as a sheet
            let windowController = ConfigurationWindowController()
            windowController.configuration = DieConfiguration(color: dieView.color, rolls: dieView.numberOfTimesToRoll)
            window.beginSheet(windowController.window!, completionHandler: { response in
                if response == NSModalResponseOK {
                    let configuration = self.configurationWindowController!.configuration
                    dieView.color = configuration.color
                    dieView.numberOfTimesToRoll = configuration.rolls
                }
                self.configurationWindowController = nil
                }
            )
            configurationWindowController = windowController
        }
    }
}
