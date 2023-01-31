import ArgumentParser
import SemanticVersioning

extension Semver {
  struct Gte: ParsableCommand {
    static var configuration = CommandConfiguration(
      commandName: "gte",
      abstract: "Compare versions with `>=` operator."
    )
    
    @OptionGroup
    var arguments: CompareArgumentGroup
  }
}

extension Semver.Gte: PrintableCommand {
  func executeWithOutput() throws -> String {
    let version1 = try Version(from: arguments.version1)
    let version2 = try Version(from: arguments.version2)
    
    if version1 >= version2 {
      return "1"
    } else {
      return "0"
    }
  }
}
