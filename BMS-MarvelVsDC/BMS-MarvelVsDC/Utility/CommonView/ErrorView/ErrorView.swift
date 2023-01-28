//
//  ErrorView.swift
//
//  Created by Nausheen Khan on 08/01/23.
//

import UIKit

class ErrorView: UIView {

    @IBOutlet weak var labelErrorMsg: UILabel!
    
    var didClickRetry: (()->())?
    
    //MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateViewWithData(errorMessage: String){
        labelErrorMsg.text = errorMessage
    }
    
    @IBAction func btnRetryClicked(_ sender: UIButton){
        self.didClickRetry?()
    }
}
