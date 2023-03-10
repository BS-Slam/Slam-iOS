import ProjectDescription

extension TargetDependency{
    public struct SPM {}
}

public extension TargetDependency.SPM{
    static let SnapKit = TargetDependency.package(product: "SnapKit")
    static let Then = TargetDependency.package(product: "Then")
    static let Tabman = TargetDependency.package(product: "Tabman")
    static let Alamofire = TargetDependency.package(product: "Alamofire")
    static let Kingfisher = TargetDependency.package(product: "Kingfisher")
    static let RxSwift = TargetDependency.package(product: "RxSwift")
    static let RxCococa = TargetDependency.package(product: "RxCocoa")
    static let FirebaseAuth = TargetDependency.package(product: "FirebaseAuth")
    static let FirebaseAnalytics = TargetDependency.package(product: "FirebaseAnalytics")
    static let firebaseCrashlytics = TargetDependency.package(product: "FirebaseCrashlytics")
    static let FirebaseFirestore = TargetDependency.package(product: "FirebaseFirestore")
    static let FirebaseStorage = TargetDependency.package(product: "FirebaseStorage")
    static let FirebaseDatabase = TargetDependency.package(product: "FirebaseDatabase")
    static let MessageKit = TargetDependency.package(product: "MessageKit")
    static let JGProgressHUD = TargetDependency.package(product: "JGProgressHUD")
    static let Scaledrone = TargetDependency.package(product: "Scaledrone")
}

public extension Package {
    static let SnapKit = Package.remote(
        url: "https://github.com/SnapKit/SnapKit.git",
        requirement: .upToNextMajor(from: "5.6.0")
    )
    static let Then = Package.remote(
        url: "https://github.com/devxoul/Then.git",
        requirement: .upToNextMajor(from: "3.0.0")
    )
    static let Tabman = Package.remote(
        url: "https://github.com/uias/Tabman",
        requirement: .upToNextMajor(from: "2.12.0")
    )
    static let Alamofire = Package.remote(
        url: "https://github.com/Alamofire/Alamofire",
        requirement: .upToNextMajor(from: "5.6.2"))
    static let Kingfisher = Package.remote(
        url: "https://github.com/onevcat/Kingfisher",
        requirement: .upToNextMajor(from: "7.4.1"))
    static let RxSwift = Package.remote(
        url: "https://github.com/ReactiveX/RxSwift",
        requirement: .upToNextMajor(from: "6.5.0"))
    static let Firebase = Package.remote(
        url: "https://github.com/firebase/firebase-ios-sdk.git",
        requirement: .upToNextMajor(from: "8.0.0"))
    static let MessageKit = Package.remote(
        url: "https://github.com/MessageKit/MessageKit",
        requirement: .upToNextMajor(from: "3.8.0"))
    static let JGProgressHUD = Package.remote(
        url: "https://github.com/JonasGessner/JGProgressHUD",
        requirement: .upToNextMajor(from: "2.2.0"))
    static let Scaledrone = Package.remote(
        url: "https://github.com/ScaleDrone/Scaledrone-Swift",
        requirement: .upToNextMajor(from: "0.5.2"))
}
