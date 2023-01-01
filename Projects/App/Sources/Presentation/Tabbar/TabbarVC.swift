import UIKit
import SnapKit
import Then
import Tabman
import Pageboy

final class TabBarVC: TabmanViewController{
    
    private var viewControllers: Array<UIViewController> = []
    
    private let feedVC = FeedVC(.init(coordinator: .init(navigationController: .init(), window: .init())))
    private let homeVC = HomeVC(.init(coordinator: .init(navigationController: .init(), window: .init())))
    private let chatVC = ChatVC()
    
    
    private let tempView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tempView)
        tempView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalTo(110)
        }
        
        viewControllers.append(feedVC)
        viewControllers.append(homeVC)
        viewControllers.append(chatVC)

        let bar = TMBar.TabBar().then{
            $0.backgroundView.style = .blur(style: .dark)
            $0.layout.transitionStyle = .snap
            $0.layout.alignment = .centerDistributed
            $0.buttons.customize { (button) in
                button.selectedTintColor = .white
                button.tintColor = .gray
                button.font = UIFont(name: "Helvetica-Bold", size: 15)
            }
            $0.layout.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 21, right: 0)
            $0.indicator.tintColor = .red
        }
        addBar(bar, dataSource: self, at: .custom(view: tempView, layout: nil))
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
        
        let feed = TMBarItem(title: "피드")
        
        let home = TMBarItem(title: "홈")
        
        let chat = TMBarItem(title: "채팅방")
        
        
        // MARK: - return tabBar
        switch index {
                case 0:
                    return feed
                case 1:
                    return home
                case 2:
                    return chat
        default:
            return TMBarItem(title: "")
        }
    }
}
