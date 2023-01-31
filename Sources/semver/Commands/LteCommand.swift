import ArgumentParser
import SemanticVersioning

extension Semver {
  struct Lte: ParsableCommand {
    static var configuration = CommandConfiguration(
      commandName: "lte",
      abstract: "Compare versions with `<=` opearator."
    )
    
    @OptionGroup
    var arguments: CompareArgumentGroup
  }
}

extension Semver.Lte: PrintableCommand {
  func executeWithOutput() throws -> String {
    let version1 = try Version(from: arguments.version1)
    let version2 = try Version(from: arguments.version2)
    
    if version1 <= version2 {
      return "1"
    } else {
      return "0"
    }
  }
}
