//
//  StartVC.swift
//  iosApp
//
//  Created by Nurgun Nalyiakhov on 19.05.2023.
//  Copyright © 2023 orgName. All rights reserved.
//

import UIKit

class StartVC: UIViewController {
    var customView: StartView {
        return view as! StartView
    }

    weak var matrixButton: UIButton! { return customView.matrixButton }
    weak var generatorButton: UIButton! { return customView.generatorButton }

    override func loadView() {
        self.view = StartView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        matrixButton.addTarget(self, action: #selector(toMatrix), for: .touchUpInside)
        generatorButton.addTarget(self, action: #selector(toGenerator), for: .touchUpInside)
    }
    
    @objc fileprivate func toMatrix() {
        let matrixVC = MatrixVC()
        present(matrixVC, animated: true)
    }
    
    @objc fileprivate func toGenerator() {
        let generatorVC = GeneratorVC()
        present(generatorVC, animated: true)
    }
}
