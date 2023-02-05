//
//  Util.swift
//  Weather
//
//  Created by Marcel Camargos on 04/02/23.
//

import UIKit

fileprivate var aView: UIView?

extension UIViewController {
    
    func showSpinner() {
        aView = UIView(frame: self.view.bounds)
        aView?.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        
        let uiActivityIndicatior = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        uiActivityIndicatior.center = (aView ?? UIView()).center
        uiActivityIndicatior.startAnimating()
        aView?.addSubview(uiActivityIndicatior)
        self.view.addSubview(aView ?? UIView())
    }
    
    func removeSpinner() {
        aView?.removeFromSuperview()
        aView = nil
    }
}
