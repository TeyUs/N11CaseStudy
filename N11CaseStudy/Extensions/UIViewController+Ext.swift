//
//  UIViewController+Ext.swift
//  N11CaseStudy
//
//  Created by Teyhan Uslu on 23.07.2024.
//

import UIKit

extension UIViewController {
    func makeAlert(message: String, title: String = "") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
