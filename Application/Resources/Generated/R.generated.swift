//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap { Locale(identifier: $0) } ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)

  /// Find first language and bundle for which the table exists
  fileprivate static func localeBundle(tableName: String, preferredLanguages: [String]) -> (Foundation.Locale, Foundation.Bundle)? {
    // Filter preferredLanguages to localizations, use first locale
    var languages = preferredLanguages
      .map { Locale(identifier: $0) }
      .prefix(1)
      .flatMap { locale -> [String] in
        if hostingBundle.localizations.contains(locale.identifier) {
          if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
            return [locale.identifier, language]
          } else {
            return [locale.identifier]
          }
        } else if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
          return [language]
        } else {
          return []
        }
      }

    // If there's no languages, use development language as backstop
    if languages.isEmpty {
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages = [developmentLocalization]
      }
    } else {
      // Insert Base as second item (between locale identifier and languageCode)
      languages.insert("Base", at: 1)

      // Add development language as backstop
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages.append(developmentLocalization)
      }
    }

    // Find first language for which table exists
    // Note: key might not exist in chosen language (in that case, key will be shown)
    for language in languages {
      if let lproj = hostingBundle.url(forResource: language, withExtension: "lproj"),
         let lbundle = Bundle(url: lproj)
      {
        let strings = lbundle.url(forResource: tableName, withExtension: "strings")
        let stringsdict = lbundle.url(forResource: tableName, withExtension: "stringsdict")

        if strings != nil || stringsdict != nil {
          return (Locale(identifier: language), lbundle)
        }
      }
    }

    // If table is available in main bundle, don't look for localized resources
    let strings = hostingBundle.url(forResource: tableName, withExtension: "strings", subdirectory: nil, localization: nil)
    let stringsdict = hostingBundle.url(forResource: tableName, withExtension: "stringsdict", subdirectory: nil, localization: nil)

    if strings != nil || stringsdict != nil {
      return (applicationLocale, hostingBundle)
    }

    // If table is not found for requested languages, key will be shown
    return nil
  }

  /// Load string from Info.plist file
  fileprivate static func infoPlistString(path: [String], key: String) -> String? {
    var dict = hostingBundle.infoDictionary
    for step in path {
      guard let obj = dict?[step] as? [String: Any] else { return nil }
      dict = obj
    }
    return dict?[key] as? String
  }

  static func validate() throws {
    try font.validate()
    try intern.validate()
  }

  #if os(iOS) || os(tvOS)
  /// This `R.storyboard` struct is generated, and contains static references to 2 storyboards.
  struct storyboard {
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    /// Storyboard `Main`.
    static let main = _R.storyboard.main()

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "Main", bundle: ...)`
    static func main(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.main)
    }
    #endif

    fileprivate init() {}
  }
  #endif

  /// This `R.color` struct is generated, and contains static references to 4 colors.
  struct color {
    /// Color `AccentColor`.
    static let accentColor = Rswift.ColorResource(bundle: R.hostingBundle, name: "AccentColor")
    /// Color `blue`.
    static let blue = Rswift.ColorResource(bundle: R.hostingBundle, name: "blue")
    /// Color `darkGray`.
    static let darkGray = Rswift.ColorResource(bundle: R.hostingBundle, name: "darkGray")
    /// Color `lightGray`.
    static let lightGray = Rswift.ColorResource(bundle: R.hostingBundle, name: "lightGray")

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "AccentColor", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func accentColor(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.accentColor, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "blue", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func blue(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.blue, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "darkGray", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func darkGray(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.darkGray, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIColor(named: "lightGray", bundle: ..., traitCollection: ...)`
    @available(tvOS 11.0, *)
    @available(iOS 11.0, *)
    static func lightGray(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
      return UIKit.UIColor(resource: R.color.lightGray, compatibleWith: traitCollection)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "AccentColor", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func accentColor(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.accentColor.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "blue", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func blue(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.blue.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "darkGray", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func darkGray(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.darkGray.name)
    }
    #endif

    #if os(watchOS)
    /// `UIColor(named: "lightGray", bundle: ..., traitCollection: ...)`
    @available(watchOSApplicationExtension 4.0, *)
    static func lightGray(_: Void = ()) -> UIKit.UIColor? {
      return UIKit.UIColor(named: R.color.lightGray.name)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.file` struct is generated, and contains static references to 3 files.
  struct file {
    /// Resource file `SF-Pro-Display-Bold.otf`.
    static let sfProDisplayBoldOtf = Rswift.FileResource(bundle: R.hostingBundle, name: "SF-Pro-Display-Bold", pathExtension: "otf")
    /// Resource file `SF-Pro-Display-Medium.otf`.
    static let sfProDisplayMediumOtf = Rswift.FileResource(bundle: R.hostingBundle, name: "SF-Pro-Display-Medium", pathExtension: "otf")
    /// Resource file `SF-Pro-Display-Regular.otf`.
    static let sfProDisplayRegularOtf = Rswift.FileResource(bundle: R.hostingBundle, name: "SF-Pro-Display-Regular", pathExtension: "otf")

    /// `bundle.url(forResource: "SF-Pro-Display-Bold", withExtension: "otf")`
    static func sfProDisplayBoldOtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.sfProDisplayBoldOtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "SF-Pro-Display-Medium", withExtension: "otf")`
    static func sfProDisplayMediumOtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.sfProDisplayMediumOtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "SF-Pro-Display-Regular", withExtension: "otf")`
    static func sfProDisplayRegularOtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.sfProDisplayRegularOtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    fileprivate init() {}
  }

  /// This `R.font` struct is generated, and contains static references to 3 fonts.
  struct font: Rswift.Validatable {
    /// Font `SFProDisplay-Bold`.
    static let sfProDisplayBold = Rswift.FontResource(fontName: "SFProDisplay-Bold")
    /// Font `SFProDisplay-Medium`.
    static let sfProDisplayMedium = Rswift.FontResource(fontName: "SFProDisplay-Medium")
    /// Font `SFProDisplay-Regular`.
    static let sfProDisplayRegular = Rswift.FontResource(fontName: "SFProDisplay-Regular")

    /// `UIFont(name: "SFProDisplay-Bold", size: ...)`
    static func sfProDisplayBold(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: sfProDisplayBold, size: size)
    }

    /// `UIFont(name: "SFProDisplay-Medium", size: ...)`
    static func sfProDisplayMedium(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: sfProDisplayMedium, size: size)
    }

    /// `UIFont(name: "SFProDisplay-Regular", size: ...)`
    static func sfProDisplayRegular(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: sfProDisplayRegular, size: size)
    }

    static func validate() throws {
      if R.font.sfProDisplayBold(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'SFProDisplay-Bold' could not be loaded, is 'SF-Pro-Display-Bold.otf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.sfProDisplayMedium(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'SFProDisplay-Medium' could not be loaded, is 'SF-Pro-Display-Medium.otf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.sfProDisplayRegular(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'SFProDisplay-Regular' could not be loaded, is 'SF-Pro-Display-Regular.otf' added to the UIAppFonts array in this targets Info.plist?") }
    }

    fileprivate init() {}
  }

  /// This `R.image` struct is generated, and contains static references to 8 images.
  struct image {
    /// Image `background`.
    static let background = Rswift.ImageResource(bundle: R.hostingBundle, name: "background")
    /// Image `guide1`.
    static let guide1 = Rswift.ImageResource(bundle: R.hostingBundle, name: "guide1")
    /// Image `guide2`.
    static let guide2 = Rswift.ImageResource(bundle: R.hostingBundle, name: "guide2")
    /// Image `guide3`.
    static let guide3 = Rswift.ImageResource(bundle: R.hostingBundle, name: "guide3")
    /// Image `guide4`.
    static let guide4 = Rswift.ImageResource(bundle: R.hostingBundle, name: "guide4")
    /// Image `icActivePage`.
    static let icActivePage = Rswift.ImageResource(bundle: R.hostingBundle, name: "icActivePage")
    /// Image `icCross`.
    static let icCross = Rswift.ImageResource(bundle: R.hostingBundle, name: "icCross")
    /// Image `icUnActivePage`.
    static let icUnActivePage = Rswift.ImageResource(bundle: R.hostingBundle, name: "icUnActivePage")

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "background", bundle: ..., traitCollection: ...)`
    static func background(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.background, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "guide1", bundle: ..., traitCollection: ...)`
    static func guide1(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.guide1, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "guide2", bundle: ..., traitCollection: ...)`
    static func guide2(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.guide2, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "guide3", bundle: ..., traitCollection: ...)`
    static func guide3(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.guide3, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "guide4", bundle: ..., traitCollection: ...)`
    static func guide4(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.guide4, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "icActivePage", bundle: ..., traitCollection: ...)`
    static func icActivePage(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.icActivePage, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "icCross", bundle: ..., traitCollection: ...)`
    static func icCross(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.icCross, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "icUnActivePage", bundle: ..., traitCollection: ...)`
    static func icUnActivePage(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.icUnActivePage, compatibleWith: traitCollection)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.nib` struct is generated, and contains static references to 1 nibs.
  struct nib {
    /// Nib `GuideCVC`.
    static let guideCVC = _R.nib._GuideCVC()

    #if os(iOS) || os(tvOS)
    /// `UINib(name: "GuideCVC", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.guideCVC) instead")
    static func guideCVC(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.guideCVC)
    }
    #endif

    static func guideCVC(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> GuideCVC? {
      return R.nib.guideCVC.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? GuideCVC
    }

    fileprivate init() {}
  }

  /// This `R.reuseIdentifier` struct is generated, and contains static references to 1 reuse identifiers.
  struct reuseIdentifier {
    /// Reuse identifier `GuideCVC`.
    static let guideCVC: Rswift.ReuseIdentifier<GuideCVC> = Rswift.ReuseIdentifier(identifier: "GuideCVC")

    fileprivate init() {}
  }

  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }

    fileprivate init() {}
  }

  fileprivate class Class {}

  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    #if os(iOS) || os(tvOS)
    try nib.validate()
    #endif
    #if os(iOS) || os(tvOS)
    try storyboard.validate()
    #endif
  }

  #if os(iOS) || os(tvOS)
  struct nib: Rswift.Validatable {
    static func validate() throws {
      try _GuideCVC.validate()
    }

    struct _GuideCVC: Rswift.NibResourceType, Rswift.ReuseIdentifierType, Rswift.Validatable {
      typealias ReusableType = GuideCVC

      let bundle = R.hostingBundle
      let identifier = "GuideCVC"
      let name = "GuideCVC"

      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> GuideCVC? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? GuideCVC
      }

      static func validate() throws {
        if UIKit.UIImage(named: "guide6", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'guide6' is used in nib 'GuideCVC', but couldn't be loaded.") }
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }
  #endif

  #if os(iOS) || os(tvOS)
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      #if os(iOS) || os(tvOS)
      try launchScreen.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try main.validate()
      #endif
    }

    #if os(iOS) || os(tvOS)
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UIViewController

      let bundle = R.hostingBundle
      let name = "LaunchScreen"

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct main: Rswift.StoryboardResourceType, Rswift.Validatable {
      let bundle = R.hostingBundle
      let mainVC = StoryboardViewControllerResource<MainVC>(identifier: "MainVC")
      let name = "Main"

      func mainVC(_: Void = ()) -> MainVC? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: mainVC)
      }

      static func validate() throws {
        if UIKit.UIImage(named: "background", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'background' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "icActivePage", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'icActivePage' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "icCross", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'icCross' is used in storyboard 'Main', but couldn't be loaded.") }
        if UIKit.UIImage(named: "icUnActivePage", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'icUnActivePage' is used in storyboard 'Main', but couldn't be loaded.") }
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
        if _R.storyboard.main().mainVC() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'mainVC' could not be loaded from storyboard 'Main' as 'MainVC'.") }
      }

      fileprivate init() {}
    }
    #endif

    fileprivate init() {}
  }
  #endif

  fileprivate init() {}
}
