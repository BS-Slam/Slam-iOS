
import UIKit
import Then
import SnapKit
import RxSwift
import RxCocoa
import Tabman
import InputBarAccessoryView
import MessageKit
import AVFoundation

final class ChatVC: MessagesViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate{
    
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
    
    private let challengeView = UIView().then{
        $0.backgroundColor = UIColor(red: 0.145, green: 0.145, blue: 0.145, alpha: 1)
        $0.layer.cornerRadius = 18
    }
    
    private let challengeLabel = UILabel().then{
        $0.text = "가장 웃긴 사진을 찍으세요."
        $0.font = UIFont(name: "Helvetica", size: 15)
        $0.textColor = .white
    }
    
    private let cameraButton = UIButton().then{
        $0.setTitle("촬영", for: .normal)
        $0.setTitleColor(UIColor.darkGray, for: .normal)
        $0.titleLabel?.font = UIFont(name: "Helvetica", size: 13)
        $0.addTarget(self, action: #selector(cameraButtonDidTap),for: .touchUpInside)
        //$0.isEnabled = false
    }
    
    private let megaPhoneButton = UIBarButtonItem(image: UIImage(systemName: "megaphone"), style: .plain, target: self, action: "didtap")
    
    private let showchallengeButton = UIBarButtonItem(image: UIImage(systemName: "list.bullet.clipboard.fill"), style: .plain, target: self, action: "didtap")
    
    private let lineButton = UIBarButtonItem(image: UIImage(systemName: "line.3.horizontal"), style: .plain, target: self, action: "didtap")
    
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
        addView()
        setLayout()
        
        var backbutton = UIButton(type: .custom)
        backbutton.setImage(UIImage(named: "BackButton.png"), for: .normal)
        backbutton.setTitle("Back", for: .normal)
        backbutton.setTitleColor(backbutton.tintColor, for: .normal)
        //backbutton.addTarget(self, action: "backAction", for: .touchUpInside)

        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backbutton)
        self.navigationItem.rightBarButtonItems = [megaPhoneButton,showchallengeButton,lineButton]
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
    
    private func addView(){
        view.addSubview(challengeView)
        challengeView.addSubview(challengeLabel)
        challengeView.addSubview(cameraButton)
    }
    
    private func setLayout(){
        challengeView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(125)
            make.width.equalToSuperview().inset(20)
            make.height.equalTo(80)
        }
        challengeLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(24)
            make.width.equalTo(200)
            make.height.equalTo(18)
        }
        cameraButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalTo(challengeLabel.snp.right).offset(115)
            make.width.equalTo(60)
            make.height.equalTo(16)
        }
    }
    
    @objc func cameraButtonDidTap(){
        let camera = UIImagePickerController()
        camera.sourceType = .camera
        camera.allowsEditing = true
        camera.cameraDevice = .rear
        camera.cameraCaptureMode = .photo
        camera.delegate = self
        present(camera, animated: true, completion: nil)
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
