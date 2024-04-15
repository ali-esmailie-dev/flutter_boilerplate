/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsAnimationsGen {
  const $AssetsAnimationsGen();

  /// File path: assets/animations/not-found.json
  String get notFound => 'assets/animations/not-found.json';

  /// File path: assets/animations/zp-loading.json
  String get zpLoading => 'assets/animations/zp-loading.json';

  /// List of all assets
  List<String> get values => [notFound, zpLoading];
}

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/IRANYekanX-Bold.ttf
  String get iRANYekanXBold => 'assets/fonts/IRANYekanX-Bold.ttf';

  /// File path: assets/fonts/IRANYekanX-Regular.ttf
  String get iRANYekanXRegular => 'assets/fonts/IRANYekanX-Regular.ttf';

  /// File path: assets/fonts/IRANYekanXFaNum-Bold.ttf
  String get iRANYekanXFaNumBold => 'assets/fonts/IRANYekanXFaNum-Bold.ttf';

  /// File path: assets/fonts/IRANYekanXFaNum-Regular.ttf
  String get iRANYekanXFaNumRegular =>
      'assets/fonts/IRANYekanXFaNum-Regular.ttf';

  /// List of all assets
  List<String> get values => [
        iRANYekanXBold,
        iRANYekanXRegular,
        iRANYekanXFaNumBold,
        iRANYekanXFaNumRegular
      ];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/github_logo.png
  AssetGenImage get githubLogo =>
      const AssetGenImage('assets/icons/github_logo.png');

  /// File path: assets/icons/instagram_logo.png
  AssetGenImage get instagramLogo =>
      const AssetGenImage('assets/icons/instagram_logo.png');

  /// File path: assets/icons/pause.svg
  String get pause => 'assets/icons/pause.svg';

  /// File path: assets/icons/play.svg
  String get play => 'assets/icons/play.svg';

  /// File path: assets/icons/telegram_logo.png
  AssetGenImage get telegramLogo =>
      const AssetGenImage('assets/icons/telegram_logo.png');

  /// File path: assets/icons/whatsapp_logo.png
  AssetGenImage get whatsappLogo =>
      const AssetGenImage('assets/icons/whatsapp_logo.png');

  /// File path: assets/icons/youtube_logo.png
  AssetGenImage get youtubeLogo =>
      const AssetGenImage('assets/icons/youtube_logo.png');

  /// List of all assets
  List<dynamic> get values => [
        githubLogo,
        instagramLogo,
        pause,
        play,
        telegramLogo,
        whatsappLogo,
        youtubeLogo
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/sample.svg
  String get sample => 'assets/images/sample.svg';

  /// List of all assets
  List<String> get values => [sample];
}

class Assets {
  Assets._();

  static const $AssetsAnimationsGen animations = $AssetsAnimationsGen();
  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
