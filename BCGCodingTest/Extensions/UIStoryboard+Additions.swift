//
//  Storyboard+Extensions.swift
//
//
//  Created by Mams Abdul Salam, Mohammed Sadiq (Cognizant)
//

import UIKit

extension UIStoryboard {
    enum Storyboard: String {
        case main

        var fileName: String {
            switch self {
            case .main:
                return "Main"
            }
        }
    }

    convenience init(storyBoard: Storyboard, bundle: Bundle? = nil) {
        self.init(name: storyBoard.fileName, bundle: bundle)
    }

    class func storyBoard(_ storyBoard: Storyboard, bundle: Bundle? = nil) -> UIStoryboard {
        return UIStoryboard(name: storyBoard.fileName, bundle: bundle)
    }

    func instantiateViewController<T: UIViewController>() -> T {
        guard let viewController = self.instantiateViewController(withIdentifier: T.storyboardIdentifier) as? T else {
            fatalError("Couldn't instantiate view controller with identifier \(T.storyboardIdentifier) ")
        }
        return viewController
    }
}

protocol StoryboardIdentifiable {
    static var storyboardIdentifier: String { get }
}

extension StoryboardIdentifiable where Self: UIViewController {
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
}

extension UIViewController: StoryboardIdentifiable {}
