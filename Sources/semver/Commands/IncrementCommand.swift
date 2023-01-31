import ArgumentParser
import SemanticVersioning

extension Semver {
  struct Increment: ParsableCommand {
    static var configuration = CommandConfiguration(
      commandName: "increment",
      abstract: "Increment version."
    )
    
    @Flag
    var versionElement: SemanticVersioningElement
    
    @Argument(help: "Target version for incremental. ex) `1.0.0`.")
    var version: String
  }
}

extension Semver.Increment: PrintableCommand {
  func executeWithOutput() throws -> Version {
    let version = try Version(from: version)
    return version.increment(versionElement)
  }
}
