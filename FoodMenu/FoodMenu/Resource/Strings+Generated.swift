// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// list.bullet
  internal static let favoriteIcon = L10n.tr("Localizable", "favoriteIcon", fallback: "list.bullet")
  /// Favorite
  internal static let favoriteTabTitle = L10n.tr("Localizable", "favoriteTabTitle", fallback: "Favorite")
  /// Favourite
  internal static let favoriteTitle = L10n.tr("Localizable", "favoriteTitle", fallback: "Favourite")
  /// Localizable.strings
  ///   FoodMenu
  /// 
  ///   Created by Bach Nghiem on 06/10/2023.
  internal static let homeIcon = L10n.tr("Localizable", "homeIcon", fallback: "house")
  /// Home
  internal static let homeTabTitle = L10n.tr("Localizable", "homeTabTitle", fallback: "Home")
  /// Food Menu
  internal static let homeTitle = L10n.tr("Localizable", "homeTitle", fallback: "Food Menu")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
