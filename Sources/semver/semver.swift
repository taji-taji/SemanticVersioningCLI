import ArgumentParser

@main
struct Semver: ParsableCommand {
  static var configuration = CommandConfiguration(
    commandName: "semver",
    subcommands: [
      Info.self,
      Increment.self,
      Gt.self,
      Gte.self,
      Lt.self,
      Lte.self,
    ],
    defaultSubcommand: Info.self
  )
}
