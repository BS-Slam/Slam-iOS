import ProjectDescription

extension Project{
    public static func excutable(
        name: String,
        platform: Platform,
        packages: [Package] = [],
        product: Product = .app,
        deploymentTarget: DeploymentTarget = .iOS(targetVersion: "13.5", devices: [.iphone, .iphone]),
        dependencies: [TargetDependency]
    ) -> Project {
        return Project(
            name: name,
            organizationName: publicOrganizationName,
            packages: packages,
            targets: [
                Target(
                    name: name,
                    platform: platform,
                    product: product,
                    bundleId: "\(publicOrganizationName).\(name)",
                    deploymentTarget: deploymentTarget,
                    infoPlist: .file(path: Path("Projects/App/Support/Info.plist")),
                    sources: ["Projects/App/Sources/**"],
                    resources: ["Projects/App/Resources/**"],
                    entitlements: Path("Projects/App/Support/\(name).entitlements"),
                    dependencies: dependencies
                )
            ]
        )
    }
}
