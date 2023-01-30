# SemanticVersioningCLI

CLI tools for Semantic Versioning.

## Features

### `semver info`

Print version information.

`semver info <version> [--format <format>]` or `semver <version> [--format <format>]`

```sh
swift run semver 1.0.0-beta.1

# buildMetaData : <null>
# major : 1
# minor : 0
# nextMajor : 2.0.0
# nextMinor : 1.1.0
# nextPatch : 1.0.1
# patch : 0
# preRelease : beta.1
```

Print with JSON format.

```sh
swift run semver 1.0.0-beta.1 --format json

# {"buildMetaData":null,"major":1,"minor":0,"nextMajor":"2.0.0","nextMinor":"1.1.0","nextPatch":"1.0.1","patch":0,"preRelease":"beta.1"}
```

Pipe with `jq` .

```sh
swift run semver 1.0.0-beta.1 --format json | jq '.nextPatch'

# "1.0.1"
```

### `semver increment`

Increment version.

`semver increment --major --minor --patch <version>`

```sh
# increment major version
swift run semver increment --major 1.0.0-beta.1

# 2.0.0
```

```sh
# increment minor version
swift run semver increment --minor 1.0.0-beta.1

# 1.1.0
```

```sh
# increment patch version
swift run semver increment --patch 1.0.0-beta.1

# 1.0.1
```

### `semver gt`, `semver gte`

Compare versions with `>`, `>=` .

`semver gt <version1> <version2>`, `semver gte <version1> <version2>`

If `<version1>` is greater than (or equal to) `<version2>`, `1` is printed. Otherwise, `0` is printed.

```sh
swift run semver gt 1.0.0 1.0.1

# 0
```

```sh
swift run semver gt 1.1.0 1.0.1

# 1
```

```sh
swift run semver gte 1.0.0 1.0.0

# 1
```

### `semver lt`, `semver lte`

Compare versions with `<`, `<=` .

`semver lt <version1> <version2>`, `semver lte <version1> <version2>`

If `<version1>` is less than (or equal to) `<version2>`, `0` is printed. Otherwise, `1` is printed.

```sh
swift run semver lt 1.0.0 1.0.1

# 1
```

```sh
swift run semver lt 1.1.0 1.0.1

# 0
```

```sh
swift run semver lte 1.0.0 1.0.0

# 1
```

## Requirements

- Swift 5.5 or later
- macOS 10.13+ or iOS 11.0+ or watchOS 4.0+ or tvOS 11.0+

## Supported Platforms

- Apple Platforms
- Linux
