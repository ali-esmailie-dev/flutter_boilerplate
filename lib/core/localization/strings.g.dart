/// Generated file. Do not edit.
///
/// Original: lib/core/localization
/// To regenerate, run: `dart run slang`
///
/// Locales: 2
/// Strings: 62 (31 per locale)
///
/// Built on 2023-11-06 at 11:39 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, _StringsEn> {
	en(languageCode: 'en', build: _StringsEn.build),
	fa(languageCode: 'fa', build: _StringsFa.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, _StringsEn> build;

	/// Gets current instance managed by [LocaleSettings].
	_StringsEn get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
_StringsEn get t => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class Translations {
	Translations._(); // no constructor

	static _StringsEn of(BuildContext context) => InheritedLocaleData.of<AppLocale, _StringsEn>(context).translations;
}

/// The provider for method B
class TranslationProvider extends BaseTranslationProvider<AppLocale, _StringsEn> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, _StringsEn> of(BuildContext context) => InheritedLocaleData.of<AppLocale, _StringsEn>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	_StringsEn get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, _StringsEn> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	@Deprecated('Use [AppLocaleUtils.supportedLocales]') static List<Locale> get supportedLocales => instance.supportedLocales;
	@Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, _StringsEn> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class _StringsEn implements BaseTranslations<AppLocale, _StringsEn> {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsEn.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final _StringsEn _root = this; // ignore: unused_field

	// Translations
	String hello({required Object name}) => 'Hello ${name}';
	String get loremIpsum => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';
	String get smallLoremIpsum => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.';
	String get language => 'Language';
	String get theme => 'Theme';
	String get save => 'Save';
	late final _StringsLoginEn login = _StringsLoginEn._(_root);
	String get emptyData => 'Transaction not found';
	String get throwException => 'An error has occurred!';
	String get tryAgain => 'Try again';
	String get noInternet => 'No internet connection.';
	String get showMore => 'Show more';
	String get showLess => 'Show less';
	String get enterOtpCode => 'Please enter the OTP';
	String otpToPhone({required Object number}) => 'We sent verification code via SMS to ${number}';
	String remainTimeOtp({required Object time}) => 'Resend OTP code in ${time}';
	String get invalidMobile => 'Mobile phone number is invalid';
	String get limited => 'Account limited, try later';
	String get blocked => 'Account blocked';
	String get invalidOtp => 'Invalid OTP!';
	String get seeMore => 'See more';
	String get turnOfVpn => 'Turn of vpn';
	String version({required Object version}) => 'Version: ${version}';
	String get cancel => 'Cancel';
	String get skip => 'Skip';
	String get enterToApp => 'EnterToApp';
	String get next => 'Next';
	String get copied => 'Copied successfully.';
	String textInputValidationErrorMessage({required Object field}) => 'The ${field} field information is not valid.';
	String get notFound => 'Page Not Found';
}

// Path: login
class _StringsLoginEn {
	_StringsLoginEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get success => 'Logged in successfully';
	String get fail => 'Logged in failed';
}

// Path: <root>
class _StringsFa implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsFa.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.fa,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <fa>.
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final _StringsFa _root = this; // ignore: unused_field

	// Translations
	@override String hello({required Object name}) => 'سلام ${name}';
	@override String get loremIpsum => 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد. کتابهای زیادی در شصت و سه درصد گذشته، حال و آینده شناخت فراوان جامعه و متخصصان را می طلبد تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی و فرهنگ پیشرو در زبان فارسی ایجاد کرد. در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها و شرایط سخت تایپ به پایان رسد وزمان مورد نیاز شامل حروفچینی دستاوردهای اصلی و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.';
	@override String get smallLoremIpsum => 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است.';
	@override String get language => 'زبان';
	@override String get theme => 'تم';
	@override String get save => 'ذخیره';
	@override late final _StringsLoginFa login = _StringsLoginFa._(_root);
	@override String get emptyData => 'اطلاعاتی برای نمایش یافت نشد';
	@override String get throwException => 'خطا رخ داده است!';
	@override String get tryAgain => 'تلاش مجدد';
	@override String get noInternet => 'ارتباط با اینترنت برقرار نیست.';
	@override String get showMore => 'مشاهده بیشتر';
	@override String get showLess => 'مشاهده کمتر';
	@override String get enterOtpCode => 'کد تایید را وارد کنید';
	@override String otpToPhone({required Object number}) => 'ما کد تایید را به شماره ${number} ارسال کردیم.';
	@override String remainTimeOtp({required Object time}) => 'زمان مانده برای دریافت مجدد کد ${time} ثانیه';
	@override String get invalidMobile => 'شماره تلفن همراه نامعتبر است';
	@override String get limited => 'حساب کاربری شما محدود شده است';
	@override String get blocked => 'حساب کاربری شما مسدود شده است';
	@override String get invalidOtp => 'کد تایید نامعتبر است!';
	@override String get seeMore => 'مشاهده بیشتر';
	@override String get turnOfVpn => 'برای عملکر بهتر VPN خود را خاموش کنید';
	@override String version({required Object version}) => 'نسخه: ${version}';
	@override String get cancel => 'لغو';
	@override String get skip => 'رد کردن';
	@override String get enterToApp => 'ورود به اپ';
	@override String get next => 'بعدی';
	@override String get copied => 'با موفقیت کپی شد.';
	@override String textInputValidationErrorMessage({required Object field}) => 'اطلاعات فیلد ${field} معتبر نمی‌باشد.';
	@override String get notFound => 'صفحه مورد نظر یافت نشد.';
}

// Path: login
class _StringsLoginFa implements _StringsLoginEn {
	_StringsLoginFa._(this._root);

	@override final _StringsFa _root; // ignore: unused_field

	// Translations
	@override String get success => 'لاگین موفق';
	@override String get fail => 'لاگین ناموفق';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on _StringsEn {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'hello': return ({required Object name}) => 'Hello ${name}';
			case 'loremIpsum': return 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';
			case 'smallLoremIpsum': return 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.';
			case 'language': return 'Language';
			case 'theme': return 'Theme';
			case 'save': return 'Save';
			case 'login.success': return 'Logged in successfully';
			case 'login.fail': return 'Logged in failed';
			case 'emptyData': return 'Transaction not found';
			case 'throwException': return 'An error has occurred!';
			case 'tryAgain': return 'Try again';
			case 'noInternet': return 'No internet connection.';
			case 'showMore': return 'Show more';
			case 'showLess': return 'Show less';
			case 'enterOtpCode': return 'Please enter the OTP';
			case 'otpToPhone': return ({required Object number}) => 'We sent verification code via SMS to ${number}';
			case 'remainTimeOtp': return ({required Object time}) => 'Resend OTP code in ${time}';
			case 'invalidMobile': return 'Mobile phone number is invalid';
			case 'limited': return 'Account limited, try later';
			case 'blocked': return 'Account blocked';
			case 'invalidOtp': return 'Invalid OTP!';
			case 'seeMore': return 'See more';
			case 'turnOfVpn': return 'Turn of vpn';
			case 'version': return ({required Object version}) => 'Version: ${version}';
			case 'cancel': return 'Cancel';
			case 'skip': return 'Skip';
			case 'enterToApp': return 'EnterToApp';
			case 'next': return 'Next';
			case 'copied': return 'Copied successfully.';
			case 'textInputValidationErrorMessage': return ({required Object field}) => 'The ${field} field information is not valid.';
			case 'notFound': return 'Page Not Found';
			default: return null;
		}
	}
}

extension on _StringsFa {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'hello': return ({required Object name}) => 'سلام ${name}';
			case 'loremIpsum': return 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد. کتابهای زیادی در شصت و سه درصد گذشته، حال و آینده شناخت فراوان جامعه و متخصصان را می طلبد تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی و فرهنگ پیشرو در زبان فارسی ایجاد کرد. در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها و شرایط سخت تایپ به پایان رسد وزمان مورد نیاز شامل حروفچینی دستاوردهای اصلی و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.';
			case 'smallLoremIpsum': return 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است.';
			case 'language': return 'زبان';
			case 'theme': return 'تم';
			case 'save': return 'ذخیره';
			case 'login.success': return 'لاگین موفق';
			case 'login.fail': return 'لاگین ناموفق';
			case 'emptyData': return 'اطلاعاتی برای نمایش یافت نشد';
			case 'throwException': return 'خطا رخ داده است!';
			case 'tryAgain': return 'تلاش مجدد';
			case 'noInternet': return 'ارتباط با اینترنت برقرار نیست.';
			case 'showMore': return 'مشاهده بیشتر';
			case 'showLess': return 'مشاهده کمتر';
			case 'enterOtpCode': return 'کد تایید را وارد کنید';
			case 'otpToPhone': return ({required Object number}) => 'ما کد تایید را به شماره ${number} ارسال کردیم.';
			case 'remainTimeOtp': return ({required Object time}) => 'زمان مانده برای دریافت مجدد کد ${time} ثانیه';
			case 'invalidMobile': return 'شماره تلفن همراه نامعتبر است';
			case 'limited': return 'حساب کاربری شما محدود شده است';
			case 'blocked': return 'حساب کاربری شما مسدود شده است';
			case 'invalidOtp': return 'کد تایید نامعتبر است!';
			case 'seeMore': return 'مشاهده بیشتر';
			case 'turnOfVpn': return 'برای عملکر بهتر VPN خود را خاموش کنید';
			case 'version': return ({required Object version}) => 'نسخه: ${version}';
			case 'cancel': return 'لغو';
			case 'skip': return 'رد کردن';
			case 'enterToApp': return 'ورود به اپ';
			case 'next': return 'بعدی';
			case 'copied': return 'با موفقیت کپی شد.';
			case 'textInputValidationErrorMessage': return ({required Object field}) => 'اطلاعات فیلد ${field} معتبر نمی‌باشد.';
			case 'notFound': return 'صفحه مورد نظر یافت نشد.';
			default: return null;
		}
	}
}
