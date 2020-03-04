//
//  SecondViewController.swift
//  dev-test
//
//  Created by donadona on 2020/03/04.
//  Copyright © 2020 lalala. All rights reserved.
//

import UIKit
import MXSegmentedControl

class SecondViewController: UIViewController {
    @IBOutlet private var segmentedControl: MXSegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        segmentedControl.append(title: "Swift")
            .set(titleColor: .black, for: .selected)
        segmentedControl.append(title: "iOS")
            .set(titleColor: .black, for: .selected)
        segmentedControl.append(title: "Other")
            .set(titleColor: .black, for: .selected)

        segmentedControl.indicator.lineView.backgroundColor = .orange
        segmentedControl.addTarget(self, action: #selector(changeIndex(segmentedControl:)), for: .valueChanged)
    }

    @objc
    func changeIndex(segmentedControl: MXSegmentedControl) {
        switch segmentedControl.selectedIndex {
        case 0:
            segmentedControl.indicator.lineView.backgroundColor = .orange
        case 1:
            segmentedControl.indicator.lineView.backgroundColor = .blue
        case 2:
            segmentedControl.indicator.lineView.backgroundColor = .systemPink
        default:
            break
        }
    }
}
