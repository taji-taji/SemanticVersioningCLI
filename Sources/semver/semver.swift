import ArgumentParser

@main
struct Semver: ParsableCommand {
  static var configuration = CommandConfiguration(
    commandName: "semver",
    subcommands: [
      Increment.self,
      Info.self,
    ],
    defaultSubcommand: Info.self
  )
}
