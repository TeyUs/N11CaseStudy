//
//  UIStoryboard+Ext.swift
//  N11CaseStudy
//
//  Created by Teyhan Uslu on 21.07.2024.
//

import UIKit

extension UIStoryboard {
    static func loadViewController<T>() -> T where T: StoryboardLoadable, T: UIViewController {
        return UIStoryboard(name: T.storyboardName(),
                            bundle: nil).instantiateViewController(withIdentifier: T.storyboardIdentifier()) as! T
    }
}

