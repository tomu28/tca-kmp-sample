# tca-kmp-sample

## Getting Started

### KMP開発環境構築

このプロジェクトでは[Kotlin Multiplatform for mobile](https://kotlinlang.org/docs/multiplatform-mobile-getting-started.html)を採用しています。  
まず最初に、上記リンク先を参考にしてKMPの開発環境を構築してください。原則、Android Studioのstable最新版を使用して開発をおこないます。

開発環境が構築できたら、プロジェクトをチェックアウトしてアプリが実行できるか確認してください。


### iOS側のSetup
- Build Kotlin Multiplatform Mobile XCFramework for iOS

```sh
  make bootstrap
```

### Open project with Xcode

```sh
  make open
```

### Run

Xcode起動後、`File`→ `Packages` → `Reset Package Caches`を行い、`TcaKmpSampleApp` Schemeを指定し、Run(⌘ + R)

### Build KMP Frameworks

KMP モジュールに変更があり、それをiOS側に反映したい場合は以下のコマンドを実行します。

```sh
  make debug-build-kmp-framework
```

## Requirements

- Xcode 15.3 or Later

## Deployment Target

- iOS 16.6 +

## Source Code

### Architecture

[The Composable Architecture](https://github.com/pointfreeco/swift-composable-architecture)

### Project Structure

Feature based module definition.

## Development Tools

- [SwiftFormat](https://github.com/apple/swift-format)
