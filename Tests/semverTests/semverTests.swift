import ArgumentParser
import XCTest
@testable import semver

final class semverTests: XCTestCase {
  // MARK: - increment command
  
  func testIncrementMajor() throws {
    let incrementVersion = try execute(Semver.Increment.self, ["--major", "1.0.0"])
    XCTAssertEqual(incrementVersion, "2.0.0")
  }
  
  func testIncrementMinor() throws {
    let incrementVersion = try execute(Semver.Increment.self, ["--minor", "1.0.0"])
    XCTAssertEqual(incrementVersion, "1.1.0")
  }
  
  func testIncrementPatch() throws {
    let incrementVersion = try execute(Semver.Increment.self, ["--patch", "1.0.0"])
    XCTAssertEqual(incrementVersion, "1.0.1")
  }
  
  // MARK: - gt command
  
  func testGt() throws {
    XCTAssertEqual(try execute(Semver.Gt.self, ["1.0.1", "1.0.0"]), "1")
    XCTAssertEqual(try execute(Semver.Gt.self, ["1.0.0", "1.0.0"]), "0")
    XCTAssertEqual(try execute(Semver.Gt.self, ["1.0.0", "1.0.1"]), "0")
  }
  
  // MARK: - gte command
  
  func testGte() throws {
    XCTAssertEqual(try execute(Semver.Gte.self, ["1.0.1", "1.0.0"]), "1")
    XCTAssertEqual(try execute(Semver.Gte.self, ["1.0.0", "1.0.0"]), "1")
    XCTAssertEqual(try execute(Semver.Gte.self, ["1.0.0", "1.0.1"]), "0")
  }
  
  // MARK: - lt command
  
  func testLt() throws {
    XCTAssertEqual(try execute(Semver.Lt.self, ["1.0.1", "1.0.0"]), "0")
    XCTAssertEqual(try execute(Semver.Lt.self, ["1.0.0", "1.0.0"]), "0")
    XCTAssertEqual(try execute(Semver.Lt.self, ["1.0.0", "1.0.1"]), "1")
  }
  
  // MARK: - lte command
  
  func testLte() throws {
    XCTAssertEqual(try execute(Semver.Lte.self, ["1.0.1", "1.0.0"]), "0")
    XCTAssertEqual(try execute(Semver.Lte.self, ["1.0.0", "1.0.0"]), "1")
    XCTAssertEqual(try execute(Semver.Lte.self, ["1.0.0", "1.0.1"]), "1")
  }
}

extension semverTests {
  func execute<Command>(_ type: Command.Type, _ arguments: [String]) throws -> Command.Output where Command: ParsableCommand, Command: PrintableCommand {
    let subCommand: String = {
      switch type {
      case is Semver.Increment.Type:
        return "increment"
      case is Semver.Gt.Type:
        return "gt"
      case is Semver.Gte.Type:
        return "gte"
      case is Semver.Lt.Type:
        return "lt"
      case is Semver.Lte.Type:
        return "lte"
      default:
        return ""
      }
    }()
    
    let command = try XCTUnwrap(Semver.parseAsRoot([subCommand] + arguments) as? Command)
    return try command.executeWithOutput()
  }
}
