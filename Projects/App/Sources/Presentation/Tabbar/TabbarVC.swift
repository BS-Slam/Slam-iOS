import UIKit
import SnapKit
import Then
import Tabman
import Pageboy

final class TabBarVC: TabmanViewController{
    
    private var viewControllers: Array<UIViewController> = []
    
    private let homeVC = HomeVC(.init(coordinator: .init(navigationController: .init(), window: .init())))
    private let homeVC2 = HomeVC(.init(coordinator: .init(navigationController: .init(), window: .init())))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers.append(homeVC)
        viewControllers.append(homeVC2)

        let bar = TMBar.TabBar().then{
            $0.backgroundView.style = .blur(style: .light)
            $0.layout.transitionStyle = .snap
            $0.buttons.customize { (button) in
                button.selectedTintColor = .white
                button.tintColor = .gray
            }
        }
        addBar(bar, dataSource: self, at: .bottom)
        setUp()
    }
    
    func setUp(){
        self.dataSource = self
        view.backgroundColor = .white
    }
}

extension TabBarVC: PageboyViewControllerDataSource, TMBarDataSource {

    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }

    func viewController(for pageboyViewController: PageboyViewController,
                        at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }
    
    

    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }

    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        
        let calendarImage = TMBarItem(title: "")
        calendarImage.image = UIImage(systemName: "calendar")
        
        let schoolMealImage = TMBarItem(title: "")
        schoolMealImage.image = UIImage(systemName: "fork")
        
        let scheduleImage = TMBarItem(title: "")
        scheduleImage.image = UIImage(systemName: "list.bullet.rectangle.portrait")
        
        
        // MARK: - return tabBar
        switch index {
                case 0:
                    return calendarImage
                case 1:
                    return schoolMealImage
                case 2:
                    return scheduleImage
        default:
            return TMBarItem(title: "")
        }
    }
}
