
import UIKit
import Then
import SnapKit
import RxSwift
import RxCocoa
import Tabman
import InputBarAccessoryView
import MessageKit

final class ChatVC: MessagesViewController{
    
    var messageList: [MockMessage] = [] {
        didSet {
            self.messagesCollectionView.reloadData()
            self.messagesCollectionView.scrollToLastItem()
        }
    }

    lazy var formatter = DateFormatter().then{
        $0.dateStyle = .medium
        $0.locale = Locale(identifier: "ko_kr")
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        DispatchQueue.main.async {
            self.messageList = MockMessage.getMessages()
        }


        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        messagesCollectionView.messageCellDelegate = self
        messageInputBar.delegate = self

        setupInput()
        setupButton()
        messagesCollectionView.backgroundColor = SlamAsset.Colors.slamBackgroundColor.color
        scrollsToLastItemOnKeyboardBeginsEditing = true
        maintainPositionOnKeyboardFrameChanged = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    private func setupInput(){
        messageInputBar.inputTextView.tintColor = .red
        messageInputBar.inputTextView.backgroundColor = .white
    }

    private func setupButton(){
        messageInputBar.sendButton.title = "보내기"
        messageInputBar.sendButton.tintColor = SlamAsset.Colors.slamMainColor.color
    }
}

// MARK: - MessagesDataSource
extension ChatVC: MessagesDataSource {
    func currentSender() -> SenderType {
        return userType.me.data
    }

    func otherSender() -> SenderType {
        return userType.you.data
    }

    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
        return messageList.count
    }

    func messageForItem(at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messageList[indexPath.section]
    }


    func cellTopLabelAttributedText(for message: MessageType, at indexPath: IndexPath) -> NSAttributedString? {
        if indexPath.section % 3 == 0 {
            return NSAttributedString(
                string: MessageKitDateFormatter.shared.string(from: message.sentDate),
                attributes: [
                    .font: UIFont.boldSystemFont(ofSize: 10),
                    .foregroundColor: UIColor.darkGray
                ]
            )
        }
        return nil
    }


    func messageTopLabelAttributedText(for message: MessageType, at indexPath: IndexPath) -> NSAttributedString? {
        let name = message.sender.displayName
        return NSAttributedString(string: name, attributes: [.font: UIFont.preferredFont(forTextStyle: .caption1)])
    }


    func messageBottomLabelAttributedText(for message: MessageType, at indexPath: IndexPath) -> NSAttributedString? {
        let dateString = formatter.string(from: message.sentDate)
        return NSAttributedString(string: dateString, attributes: [.font: UIFont.preferredFont(forTextStyle: .caption2)])
    }
}

// MARK: - MessagesDisplayDelegate
extension ChatVC: MessagesDisplayDelegate {

    func textColor(
        for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView
    ) -> UIColor {
        isFromCurrentSender(message: message) ? .white : .darkText
    }

    func backgroundColor(
        for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView
    ) -> UIColor {
        isFromCurrentSender(message: message) ? .white : .white
    }
    
    func messageStyle(
        for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView
    ) -> MessageStyle {
        let corner: MessageStyle.TailCorner = isFromCurrentSender(message: message) ? .bottomRight : .bottomLeft
        return .bubbleTail(corner, .curved)
    }

    func configureAvatarView(
        _ avatarView: AvatarView, for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView
    ) {
        avatarView.set( avatar: Avatar(initials: message.sender.senderId == "001" ? "😊" : "🥳") )
    }
}

extension ChatVC: MessagesLayoutDelegate {

    func cellTopLabelHeight(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> CGFloat {
        indexPath.section % 3 == 0 ? 10 : 0
    }

    func messageTopLabelHeight(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> CGFloat {
        16
    }

    func messageBottomLabelHeight(for message: MessageType, at indexPath: IndexPath, in messagesCollectionView: MessagesCollectionView) -> CGFloat {
        16
    }
}
// MARK: - InputBarAccessoryViewDelegate
extension ChatVC: InputBarAccessoryViewDelegate {
    
    func inputBar(_ inputBar: InputBarAccessoryView, didPressSendButtonWith text: String) {
        let attributedText = NSAttributedString(
            string: text, attributes: [.font: UIFont.systemFont(ofSize: 15), .foregroundColor: UIColor.black])
        let message = MockMessage(attributedText: attributedText, sender: currentSender(), messageId: UUID().uuidString, date: Date())
        self.messageList.append(message)

        self.messageInputBar.inputTextView.text = String()
        self.messageInputBar.invalidatePlugins()
        self.messagesCollectionView.scrollToLastItem()
    }

}

extension ChatVC {
    func closeKeyboard(){
        self.messageInputBar.inputTextView.resignFirstResponder()
        self.messagesCollectionView.scrollToLastItem()
    }
}

extension ChatVC: MessageCellDelegate {
    func didTapBackground(in cell: MessageCollectionViewCell) {
        closeKeyboard()
    }

    func didTapMessage(in cell: MessageCollectionViewCell) {
        closeKeyboard()
    }

    func didTapAvatar(in cell: MessageCollectionViewCell) {
        closeKeyboard()
    }

    func didTapMessageTopLabel(in cell: MessageCollectionViewCell) {
        closeKeyboard()
    }
    func didTapMessageBottomLabel(in cell: MessageCollectionViewCell) {
        closeKeyboard()
    }
}
