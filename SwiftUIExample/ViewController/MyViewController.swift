//
//  MyViewController.swift
//  SwiftUIExample
//
//  Created by 최최광현 on 2023/07/16.
//

import UIKit

protocol MyViewControllerDelegate: AnyObject {
    func didTouchCenterButton()
}


class MyViewController: UIViewController {
    private let centerButton = UIButton()
    
    weak var delegate: MyViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        centerButton.setTitle("중심", for: .normal)
        centerButton.setTitleColor(.black, for: .normal)
        centerButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(centerButton)
        
        NSLayoutConstraint.activate([
            centerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            centerButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            centerButton.widthAnchor.constraint(equalToConstant: 100),
            centerButton.heightAnchor.constraint(equalToConstant: 100),
        ])
        
        centerButton.addTarget(self, action: #selector(didTouchCenterButton), for: .touchUpInside)
    }
    
    @objc
    private func didTouchCenterButton() {
        delegate?.didTouchCenterButton()
    }
}
