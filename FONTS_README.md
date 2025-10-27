# Font Setup - Noto Sans JP

## ✅ Using Free, Professional Japanese Font

This app uses **Noto Sans JP** - a free, high-quality Japanese font from Google Fonts.

---

## 🎨 About Noto Sans JP

- ✅ **Free & Open Source** - No licensing costs
- ✅ **Professional Quality** - Designed by Google for Japanese text
- ✅ **Auto-Download** - No manual font files needed
- ✅ **All Platforms** - Works on Android, iOS, Web, Desktop
- ✅ **Excellent Readability** - Perfect for Japanese UI

### Font Weights Available
- 100 (Thin)
- 300 (Light)
- 400 (Regular) - Body text
- 500 (Medium) - Labels
- 600 (Semi-Bold) - Headings
- 700 (Bold) - Strong emphasis
- 900 (Black) - Extra bold

---

## 🚀 Setup (Already Done!)

Everything is already configured. Just run:

```bash
flutter pub get
flutter run
```

### What Happens on First Launch:
1. App detects Noto Sans JP is needed
2. Downloads font from Google (~2-3 MB) - **requires internet**
3. Caches it locally for offline use
4. Applies beautiful Japanese typography

### After First Launch:
- ✅ Works **offline**
- ✅ Loads **instantly**
- ✅ No more downloads

---

## 📦 Technical Details

### Configuration

**pubspec.yaml:**
```yaml
dependencies:
  google_fonts: ^6.1.0  # Auto-download fonts
```

**app_theme.dart:**
```dart
import 'package:google_fonts/google_fonts.dart';

static String get fontFamily => GoogleFonts.notoSansJp().fontFamily ?? 'Noto Sans JP';

static ThemeData get lightTheme {
  final baseTextTheme = GoogleFonts.notoSansJpTextTheme();
  return ThemeData(
    fontFamily: fontFamily,
    textTheme: baseTextTheme,
    // ... other settings
  );
}
```

---

## 🎯 Typography Usage

### All text uses AppTheme methods:

```dart
// Headings
AppTheme.heading1()  // 28px Bold
AppTheme.heading2()  // 24px Bold
AppTheme.heading3()  // 20px Semi-Bold

// Titles
AppTheme.title1()    // 18px Semi-Bold - App bars
AppTheme.title2()    // 16px Semi-Bold - Card titles
AppTheme.title3()    // 14px Semi-Bold

// Body
AppTheme.bodyLarge()  // 16px Regular - Main content
AppTheme.bodyMedium() // 14px Regular - Details
AppTheme.bodySmall()  // 13px Regular - Small text

// Labels & Buttons
AppTheme.labelMedium()  // 12px Medium - Tags
AppTheme.buttonLarge()  // 16px Semi-Bold - Buttons
```

---

## 📱 Where It's Used

### Booking List Screen
- Guest names: `title2()`
- Room numbers: `heading2()`
- Dates: `bodySmall()`
- Status badges: `labelMedium()`

### Settings Screen
- Section headers: `heading3()`
- Setting titles: `title2()`
- Descriptions: `bodyMedium()`

### Booking Details
- App bar: `title1()`
- Labels: `labelMedium()`
- Values: `bodyLarge()`
- Notes: `bodyMedium()`

### All Screens
Consistent, professional Japanese typography everywhere!

---

## 🌐 Internet Requirements

### First Launch Only
- **Needs**: Internet connection
- **Duration**: 2-3 seconds
- **Size**: ~2-3 MB (only used weights)
- **Frequency**: One time only

### After First Launch
- **No internet needed** - font is cached
- **Works offline**
- **Loads instantly**

---

## 🔧 Troubleshooting

### Font Not Loading?

**Solution 1: Check Internet** (first launch only)
```bash
ping google.com
```

**Solution 2: Clean & Rebuild**
```bash
flutter clean
flutter pub get
flutter run
```

**Solution 3: Full Restart**
- Don't use hot reload
- Use full restart (stop and run again)

### Want a Different Font?

Easy to change in `lib/shared/theme/app_theme.dart`:

```dart
// Change from Noto Sans JP to another font:

// Option 1: Another Japanese font
static String get fontFamily => GoogleFonts.sawarabiGothic().fontFamily ?? 'Sawarabi Gothic';

// Option 2: Sans-serif
static String get fontFamily => GoogleFonts.roboto().fontFamily ?? 'Roboto';

// Option 3: Rounded
static String get fontFamily => GoogleFonts.kosugiMaru().fontFamily ?? 'Kosugi Maru';
```

Browse all Google Fonts: https://fonts.google.com

---

## 📊 Comparison with Hiragino Sans

| Feature | Hiragino Sans | Noto Sans JP |
|---------|---------------|--------------|
| **Quality** | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ |
| **Cost** | $100-500 | ✅ **Free** |
| **License** | Proprietary | ✅ **Open Source** |
| **Setup** | Manual files | ✅ **Auto-download** |
| **Platforms** | All (with files) | ✅ **All (built-in)** |
| **Maintenance** | Manual updates | ✅ **Auto-managed** |
| **Japanese** | Excellent | ✅ **Excellent** |

**Result:** Noto Sans JP is professional, free, and easier to use!

---

## ✅ What's Done

- ✅ Google Fonts package installed
- ✅ Noto Sans JP configured
- ✅ All screens updated to use AppTheme
- ✅ Typography system complete
- ✅ 10 files using consistent fonts
- ✅ Professional Japanese design

---

## 🎉 You're All Set!

Just run:
```bash
flutter pub get
flutter run
```

The font will automatically download on first launch and your app will have beautiful Japanese typography!

---

## 📚 Resources

- **Noto Sans JP**: https://fonts.google.com/noto/specimen/Noto+Sans+JP
- **Google Fonts Flutter**: https://pub.dev/packages/google_fonts
- **Flutter Typography**: https://docs.flutter.dev/cookbook/design/fonts

---

**Enjoy your beautiful, professional Japanese typography! 🎨✨**

