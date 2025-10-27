# Font Setup Guide

## ✅ Using Google Fonts (Noto Sans JP)

This app now uses **Noto Sans JP** via the `google_fonts` package - a free, high-quality Japanese font that's perfect for production use.

---

## What Changed

### Before (Hiragino Sans - Proprietary)
- Required manual font files
- macOS/iOS only font
- License restrictions
- Manual asset management

### After (Noto Sans JP - Free & Open Source)
- Automatically downloaded from Google Fonts
- Works on all platforms
- No license restrictions
- No manual asset management needed

---

## Setup Instructions

### 1. Install Dependencies

Run the following command in your terminal:

```bash
flutter pub get
```

This will install the `google_fonts` package.

### 2. Restart the App

Since we're changing fonts, you need to fully restart the app (not just hot reload):

```bash
# Stop the app and restart it
flutter run
```

Or use the restart button in your IDE.

### 3. Done! 🎉

The font will be automatically downloaded and cached on first run. After that, it works offline.

---

## Technical Details

### AppTheme Configuration

The `AppTheme` class now uses Google Fonts:

```dart
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Font Family
  static String get fontFamily => GoogleFonts.notoSansJp().fontFamily ?? 'Noto Sans JP';
  
  // Text styles use this fontFamily
  static TextStyle heading1({Color? color, FontWeight? fontWeight}) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: 28,
      fontWeight: fontWeight ?? FontWeight.w700,
      color: color ?? textPrimaryColor,
      letterSpacing: -0.5,
    );
  }
  // ... more styles
}
```

### Theme Data

```dart
static ThemeData get lightTheme {
  final textTheme = GoogleFonts.notoSansJpTextTheme();
  
  return ThemeData(
    fontFamily: fontFamily,
    textTheme: textTheme,
    // ... other theme settings
  );
}
```

---

## About Noto Sans JP

### Features
- ✅ **Excellent Japanese Support** - Designed specifically for Japanese text
- ✅ **Multiple Weights** - Thin (100) to Black (900)
- ✅ **Free & Open Source** - SIL Open Font License
- ✅ **Professional Quality** - Designed by Google
- ✅ **Cross-Platform** - Works on Android, iOS, Web, Desktop

### Font Weights Available
- **100 (Thin)** - Very light
- **300 (Light)** - Light
- **400 (Regular)** - Normal text
- **500 (Medium)** - Slightly bold
- **600 (Semi-Bold)** - Headings
- **700 (Bold)** - Strong emphasis
- **900 (Black)** - Extra strong

### Comparison with Hiragino Sans

| Feature | Hiragino Sans | Noto Sans JP |
|---------|---------------|--------------|
| Cost | Proprietary ($$) | Free |
| License | Restricted | Open Source |
| Platform | macOS/iOS | All platforms |
| Setup | Manual files | Auto-download |
| Quality | Excellent | Excellent |
| Japanese | Native | Designed for JP |

---

## How It Works

### First Launch
1. App starts
2. Google Fonts package detects Noto Sans JP is needed
3. Downloads font from Google's servers
4. Caches it locally
5. Applies the font

### Subsequent Launches
1. Font is already cached
2. Loads instantly
3. Works offline

---

## Internet Connection

### First Run
- **Requires internet** to download the font
- Takes a few seconds (small download)

### After First Run
- **Works offline** - font is cached
- No network requests needed

---

## Troubleshooting

### Font Not Loading?

1. **Check Internet Connection** (first run only)
   ```bash
   # Test connection
   ping google.com
   ```

2. **Clear Flutter Cache**
   ```bash
   flutter clean
   flutter pub get
   ```

3. **Full Restart** (not hot reload)
   ```bash
   flutter run
   ```

### Want to Use a Different Font?

Edit `lib/shared/theme/app_theme.dart`:

```dart
// Change from Noto Sans JP to another font
static String get fontFamily => GoogleFonts.roboto().fontFamily ?? 'Roboto';
```

Available Japanese fonts:
- `GoogleFonts.notoSansJp()` - Recommended ✅
- `GoogleFonts.notoSerifJp()` - Serif style
- `GoogleFonts.sawarabiGothic()` - Gothic style
- `GoogleFonts.kosugiMaru()` - Rounded style

Browse all: https://fonts.google.com

---

## File Sizes

### Noto Sans JP
- **Per Weight**: ~1-2 MB
- **Total (all weights)**: ~8-10 MB
- **Cached locally** after first download

The app only downloads the weights you actually use, so the real size is smaller.

---

## License

**Noto Sans JP** is licensed under the SIL Open Font License 1.1
- ✅ Free for commercial use
- ✅ Can be bundled with apps
- ✅ Can be modified
- ✅ No attribution required (but appreciated)

Full license: https://scripts.sil.org/OFL

---

## Performance

### Impact on App Size
- **Debug**: No impact (fonts downloaded at runtime)
- **Release**: Minimal (only used weights are bundled)

### Loading Time
- **First launch**: +1-3 seconds (one-time download)
- **Subsequent launches**: No impact (cached)

### Memory Usage
- Similar to any system font
- Efficiently cached by Flutter

---

## Production Considerations

### Should You Pre-Bundle Fonts?

For production apps, consider bundling fonts in the app to avoid:
- First-launch delay
- Internet dependency
- Potential Google Fonts API issues

To bundle:
1. Download Noto Sans JP from Google Fonts
2. Add to `fonts/` directory
3. Update `pubspec.yaml`
4. Remove `google_fonts` dependency

For now, using `google_fonts` is perfect for development and most production use cases.

---

## Summary

✅ **No manual setup needed**
✅ **Works on all platforms**
✅ **Free & high quality**
✅ **Automatic font management**
✅ **Professional Japanese typography**

Just run `flutter pub get` and restart your app!

---

## References

- [Google Fonts Package](https://pub.dev/packages/google_fonts)
- [Noto Sans JP on Google Fonts](https://fonts.google.com/noto/specimen/Noto+Sans+JP)
- [Flutter Typography Guide](https://docs.flutter.dev/cookbook/design/fonts)
