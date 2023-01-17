import ArgumentParser

@main
struct SemanticVersioningCLI: ParsableCommand {
  static var configuration = CommandConfiguration(
    commandName: "semver",
    subcommands: [Up.self]
  )
  
  func run() throws {
    print("semver")
  }
}
