
import Foundation
import UIKit

class BaseVC: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        configureVC()
        addView()
        setLayout()
    }
    func setUp(){}
    func configureVC(){}
    func addView(){}
    func setLayout(){}
}
