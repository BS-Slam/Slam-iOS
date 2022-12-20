import UIKit

extension UITextField {
    func addLeftPadding() {
       let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: self.frame.height))
       self.leftView = paddingView
       self.leftViewMode = ViewMode.always
   }
    func addRightPadding() {
       let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 60, height: self.frame.height))
       self.rightView = paddingView
       self.rightViewMode = ViewMode.always
   }
}
