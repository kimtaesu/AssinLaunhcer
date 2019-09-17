//
//  AssinLauncherViewController.swift
//  AssinLauncher
//
//  Created by tskim on 15/09/2019.
//  Copyright © 2019 hucet. All rights reserved.
//

import UIKit

open class AssinLauncherViewController: UIViewController {
    @IBOutlet weak var assinMarkView: DMarkView!
    private var completionBlock: (() -> Void)?

    open override class func awakeFromNib() {
        super.awakeFromNib()
    }
    public init(block: (() -> Void)?) {
        defer { self.completionBlock = block }
        super.init(nibName: AssinLauncherViewController.nibName, bundle: Bundle(for: AssinLauncherViewController.self))
    }

    required public init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override public func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 0.3, qos: .userInitiated, flags: .barrier) {
            self.assinMarkView.startAnimation({
                DispatchQueue.main.asyncAfter(wallDeadline: .now() + 0.5, qos: .userInitiated, flags: .barrier) {
                    self.completionBlock?()
                }
            })
        }
    }

    public func setCompletionBlock(_ block: (() -> Void)?) {
        self.completionBlock = block
    }
    override public var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
}

extension AssinLauncherViewController {
    private static var nibName: String {
        return String(describing: Self.self)
    }
}
