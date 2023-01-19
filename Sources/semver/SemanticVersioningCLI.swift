import ArgumentParser

@main
struct SemanticVersioningCLI: ParsableCommand {
  static var configuration = CommandConfiguration(
    commandName: "semver",
    subcommands: [Increment.self]
  )
  
  func run() throws {
    print("semver")
  }
}
