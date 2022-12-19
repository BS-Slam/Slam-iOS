import ProjectDescription
import ProjectDescriptionHelpers

let projectName = "Slam"
let orginazationIden = "Slam.Slam"

let project = Project.excutable(
    name: projectName,
    platform: .iOS,
    packages: [
        .Then,
        .SnapKit,
        .Tabman,
        .Alamofire,
        .Kingfisher,
        .RxSwift,
    ],
    product: .app,
    deploymentTarget: .iOS(targetVersion: "13.5", devices: [.iphone, .ipad]),
    dependencies: [
        .SPM.Then,
        .SPM.SnapKit,
        .SPM.Tabman,
        .SPM.Alamofire,
        .SPM.Kingfisher,
        .SPM.RxSwift,
        .SPM.RxCococa
    ]
)
