import MessageKit
import UIKit
import InputBarAccessoryView

struct User: SenderType {
    var senderId: String
    let displayName: String
}

enum userType {
    case me
    case you

    var data: SenderType {
        switch self {
        case .me:
            return User(senderId: "001", displayName: "Me")
        case .you:
            return User(senderId: "002", displayName: "You")
        }
    }
}

struct MockMessage: MessageType {

    var messageId: String
    var sender: SenderType
    var sentDate: Date
    var kind: MessageKind

    private init(kind: MessageKind, sender: SenderType, messageId: String, date: Date) {
        self.kind = kind
        self.sender = sender
        self.messageId = messageId
        self.sentDate = date
    }

    init(text: String, sender: SenderType, messageId: String, date: Date) {
        self.init(kind: .text(text), sender: sender, messageId: messageId, date: date)
    }

    init(attributedText: NSAttributedString, sender: SenderType, messageId: String, date: Date) {
        self.init(kind: .attributedText(attributedText), sender: sender, messageId: messageId, date: date)
    }

    static func getMessages() -> [MockMessage] {
        return [
            createMessage(text: "이번 챌린지는 뭐죠?", user: .me),
            createMessage(text: "정말 기대된다! ㅋㅋ", user: .me),
            createMessage(text: "근데 정말 집에 가고 싶다", user: .you),
            createMessage(text: "저도요", user: .me),
            createMessage(text: "후후후", user: .you),
        ]
    }

    static func createMessage(text: String, user: userType) -> MockMessage {
        let attributedText = NSAttributedString(
            string: text,
            attributes: [.font: UIFont.systemFont(ofSize: 15), .foregroundColor: UIColor.black]
        )
        return MockMessage(attributedText: attributedText, sender: user.data, messageId: UUID().uuidString, date: Date())
    }
}
