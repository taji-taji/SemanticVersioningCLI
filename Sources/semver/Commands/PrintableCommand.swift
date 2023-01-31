import ArgumentParser

protocol PrintableCommand {
  associatedtype Output
  func executeWithOutput() throws -> Output
  func run() throws
}

extension PrintableCommand where Self: ParsableCommand {
  func run() throws {
    let output = try executeWithOutput()
    print(output)
  }
}
