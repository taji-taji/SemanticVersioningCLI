import ArgumentParser

enum OutputFormat: String, ExpressibleByArgument {  
  case plain
  case json
}
