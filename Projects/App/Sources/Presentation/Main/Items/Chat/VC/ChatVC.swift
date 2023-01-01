
import UIKit
import Then
import SnapKit
import RxSwift
import RxCocoa
import Tabman
import InputBarAccessoryView
import MessageKit

final class ChatVC: MessagesViewController{
    
    private var messages = [Message]()
        private let selfSender = Sender(photoURLString: "",
                                        senderId: "1",
                                        displayName: "junxhwa")
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messages.append(Message(sender: selfSender, messageId: "Mock Id 1", sentDate: Date(), kind: .text("Hello, World!")))
        messages.append(Message(sender: selfSender, messageId: "Mock Id 2", sentDate: Date(), kind: .text("Hello, World! Hey, There!")))
        
        view.backgroundColor = SlamAsset.Colors.slamBackgroundColor.color
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesDisplayDelegate = self
        messagesCollectionView.messagesLayoutDelegate = self
    }
}

extension ChatVC: MessagesDataSource, MessagesLayoutDelegate, MessagesDisplayDelegate {
    func currentSender() -> MessageKit.SenderType {
        return selfSender
    }
    
    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessageKit.MessagesCollectionView) -> MessageKit.MessageType {
        return messages[indexPath.section]
    }
    
    func numberOfSections(in messagesCollectionView: MessageKit.MessagesCollectionView) -> Int {
        return messages.count
    }
}
