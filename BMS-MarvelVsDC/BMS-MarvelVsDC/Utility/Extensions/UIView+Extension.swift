//
//  UIView+Extension.swift
//  BMS-MarvelVsDC
//
//  Created by Nausheen Khan on 27/01/23.
//

import UIKit

extension UIView{
    /// Make rounded edges of view
    func addRoundCorner(value: CGFloat){
        self.layer.cornerRadius = value
        self.layer.masksToBounds = true
    }
    
    /// Make border color to the view
    func addBorder(color: UIColor = .black , width: CGFloat = 1){
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }
    
    /// Resposible to create and manage UIView from `Nib` file from any class.
    /// Use
    /// let view : CustomView = .fromNib()
    ///
    /// - returns:Same Nib Class
    class func fromNib<T: UIView>(nibName: String?=nil, index:Int = 0) -> T{
        return Bundle.main.loadNibNamed(nibName ?? String(describing: T.self), owner: nil, options: nil)![index] as! T
    }
    
    /// Embed Leading, Trailing, Top and Bottom constraints
    ///
    /// - parameter view: UIView to be embeded
    /// - parameter atIndex: index for the view layering
    /// - parameter topConstant: top constraint spacing constant
    /// - parameter bottomConstant: bottom constraint spacing constant
    /// - parameter leftConstant: left constraint spacing constant
    /// - parameter rightConstant: right constraint spacing constant
    func addEmbededSubview(_ view: UIView, atIndex: Int?=nil, topConstant: CGFloat = 0, bottomConstant: CGFloat = 0, leftConstant: CGFloat = 0, rightConstant: CGFloat = 0){
        
        view.translatesAutoresizingMaskIntoConstraints = false
        if let atIndex = atIndex{
            self.insertSubview(view, at: atIndex)
        }else{
            self.addSubview(view)
        }
        let topConstraints = NSLayoutConstraint.init(item: self, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: topConstant)
        let bottomConstraints = NSLayoutConstraint.init(item: self, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: bottomConstant)
        let leftConstraints = NSLayoutConstraint.init(item: self, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: leftConstant)
        let rightConstraints = NSLayoutConstraint.init(item: self, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: rightConstant)
        
        self.addConstraints([topConstraints,bottomConstraints,leftConstraints,rightConstraints])
    }
    
}

//MARK: Loader
extension UIView{
    func showLoaderView() {
        let loader = UIActivityIndicatorView(style: .medium)
        loader.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        loader.color = .gray
        loader.center = self.center
        self.addSubview(loader)
        loader.startAnimating()
        self.bringSubviewToFront(loader)
    }
    
    func hideLoaderView(){
        for view in self.subviews where view is UIActivityIndicatorView{
            view.removeFromSuperview()
        }
    }
}
