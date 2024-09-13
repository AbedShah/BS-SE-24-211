import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'he', 'ar'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? heText = '',
    String? arText = '',
  }) =>
      [enText, heText, arText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // LoginPage
  {
    'f29540ej': {
      'en': 'Sign In',
      'ar': 'تسجيل الدخول',
      'he': 'היכנס',
    },
    'xl32ijzh': {
      'en': 'Use the account below to sign in.',
      'ar': 'استخدم الحساب أدناه لتسجيل الدخول.',
      'he': 'השתמש בחשבון למטה כדי להיכנס.',
    },
    'oypr39w2': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
      'he': 'אֶלֶקטרוֹנִי',
    },
    'gp0aiivr': {
      'en': 'Password',
      'ar': 'كلمة المرور',
      'he': 'סִיסמָה',
    },
    'lxpib7bb': {
      'en': 'Sign In',
      'ar': 'تسجيل الدخول',
      'he': 'היכנס',
    },
    'nakt5232': {
      'en': 'Forgot Password',
      'ar': 'هل نسيت كلمة السر',
      'he': 'שכחת סיסמא',
    },
    '0ubsjt1e': {
      'en': 'Sign Up ',
      'ar': 'اشتراك',
      'he': 'הירשם',
    },
    'jj3ve6ph': {
      'en': 'Home',
      'ar': 'بيت',
      'he': 'בַּיִת',
    },
  },
  // profilePageOwner
  {
    '8xgefs6l': {
      'en': 'Account',
      'ar': 'حساب',
      'he': 'חֶשְׁבּוֹן',
    },
    'dgvxgzy3': {
      'en': 'Manage My Cars',
      'ar': 'إدارة سياراتي',
      'he': 'נהל את המכוניות שלי',
    },
    'dh3o6fau': {
      'en': 'Add Car',
      'ar': 'أضف سيارة',
      'he': 'הוסף רכב',
    },
    '5ae33ni8': {
      'en': 'My Orders',
      'ar': 'طلبياتي',
      'he': 'ההזמנות שלי',
    },
    'e9darx7g': {
      'en': 'Edit Profile',
      'ar': 'تعديل الملف الشخصي',
      'he': 'ערוך פרופיל',
    },
    'p52g8sms': {
      'en': 'Support',
      'ar': 'يدعم',
      'he': 'תְמִיכָה',
    },
    '1tlichmy': {
      'en': 'Delete User',
      'ar': 'حذف المستخدم',
      'he': 'מחק משתמש',
    },
    'kn0m0yv9': {
      'en': 'Profile',
      'ar': 'حساب تعريفي',
      'he': 'פּרוֹפִיל',
    },
    'vol4hihp': {
      'en': 'Home',
      'ar': 'بيت',
      'he': 'בַּיִת',
    },
  },
  // RegisterPage
  {
    'hubd6h9s': {
      'en': 'Create an account',
      'ar': 'إنشاء حساب',
      'he': 'צור חשבון',
    },
    '7yktxvim': {
      'en': 'Id',
      'ar': 'بطاقة تعريف',
      'he': 'תְעוּדַת זֶהוּת',
    },
    'mwwwtltq': {
      'en': 'UserName',
      'ar': 'اسم المستخدم',
      'he': 'שם משתמש',
    },
    '61jq4nhu': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
      'he': 'אֶלֶקטרוֹנִי',
    },
    '6f18rcgq': {
      'en': 'City',
      'ar': 'مدينة',
      'he': 'עִיר',
    },
    'vbp9ew54': {
      'en': 'PhoneNumber',
      'ar': 'رقم التليفون',
      'he': 'מספר טלפון',
    },
    '9mp625xx': {
      'en': 'Owner',
      'ar': 'مالك',
      'he': 'בַּעַל',
    },
    'qwzkxtw1': {
      'en': 'Renter',
      'ar': 'مستأجر',
      'he': 'מַשׂכִּיר',
    },
    'kb4yeajq': {
      'en': 'Please select The Roll',
      'ar': 'الرجاء تحديد القائمة',
      'he': 'אנא בחר את הרול',
    },
    'blf8996w': {
      'en': 'Search for an item...',
      'ar': 'البحث عن العنصر...',
      'he': 'חפש פריט...',
    },
    '85h4ib0t': {
      'en': 'Password',
      'ar': 'كلمة المرور',
      'he': 'סִיסמָה',
    },
    'ks3ai48z': {
      'en': 'Create Account',
      'ar': 'إنشاء حساب',
      'he': 'צור חשבון',
    },
    'bycmze7t': {
      'en': 'Already have an account? ',
      'ar': 'هل لديك حساب بالفعل؟',
      'he': 'כבר יש לך חשבון?',
    },
    'xvq4opjy': {
      'en': 'Sign In here',
      'ar': 'سجل الدخول هنا',
      'he': 'היכנס כאן',
    },
    'b1a38664': {
      'en': 'Home',
      'ar': 'بيت',
      'he': 'בַּיִת',
    },
  },
  // ReportAndContactPage
  {
    'gdwyxtia': {
      'en': 'ReportPage',
      'ar': 'تقرير الصفحة',
      'he': 'דף דיווח',
    },
    'p1ammw62': {
      'en': 'Welcome to support',
      'ar': 'مرحباً بكم في الدعم',
      'he': 'ברוכים הבאים לתמוך',
    },
    'cf30hwsp': {
      'en': 'Call Us',
      'ar': 'اتصل بنا',
      'he': 'התקשר אלינו',
    },
    'txhd87li': {
      'en': 'Email Us',
      'ar': 'راسلنا عبر البريد الإلكتروني',
      'he': 'שלח לנו דוא\"ל',
    },
    'tkg2qzlr': {
      'en': 'UserName',
      'ar': 'اسم المستخدم',
      'he': 'שם משתמש',
    },
    'zyhrzgv5': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
      'he': 'אֶלֶקטרוֹנִי',
    },
    '6h74yrmo': {
      'en': 'Date',
      'ar': 'تاريخ',
      'he': 'תַאֲרִיך',
    },
    'grdzqqq0': {
      'en': 'Date',
      'ar': 'تاريخ',
      'he': 'תַאֲרִיך',
    },
    'dv45b6xk': {
      'en': 'Short Description of what is going on...',
      'ar': 'وصف مختصر لما يحدث...',
      'he': 'תיאור קצר של מה שקורה...',
    },
    'wpwn2jlg': {
      'en': 'Send Report',
      'ar': 'إرسال التقرير',
      'he': 'שלח דוח',
    },
    '7uq7dxcq': {
      'en': 'Home',
      'ar': 'بيت',
      'he': 'בַּיִת',
    },
  },
  // ForgetPasswordPage
  {
    'stak7e4f': {
      'en': 'Back',
      'ar': 'خلف',
      'he': 'בְּחֲזָרָה',
    },
    '9lf0xxf4': {
      'en': 'Forgot Password',
      'ar': 'هل نسيت كلمة السر',
      'he': 'שכחת סיסמא',
    },
    'u1x8rkgu': {
      'en': 'We will send you an email with a link to reset your password . ',
      'ar':
          'سنرسل لك بريدًا إلكترونيًا به رابط لإعادة تعيين كلمة المرور الخاصة بك.',
      'he': 'אנו נשלח לך אימייל עם קישור לאיפוס הסיסמה שלך.',
    },
    'x9lu7xb0': {
      'en': 'Enter your email...',
      'ar': 'أدخل بريدك الإلكتروني...',
      'he': 'הכנס את המייל שלך...',
    },
    'm9ccv7gx': {
      'en': 'Send Link',
      'ar': 'إرسال الرابط',
      'he': 'שלח קישור',
    },
    'rfq8ao35': {
      'en': 'Back',
      'ar': 'خلف',
      'he': 'בְּחֲזָרָה',
    },
    '913ko6tz': {
      'en': 'Home',
      'ar': 'بيت',
      'he': 'בַּיִת',
    },
  },
  // EntryPage
  {
    'okgrxuiw': {
      'en': 'Welcome!',
      'ar': 'مرحباً!',
      'he': 'קַבָּלַת פָּנִים!',
    },
    'spboq35w': {
      'en':
          '\"Unlock a world of possibilities. Rent cars from locals hassle-free with our app today!\"',
      'ar':
          '\"افتح عالمًا مليئًا بالإمكانيات. استأجر السيارات من السكان المحليين دون أي متاعب باستخدام تطبيقنا اليوم!\"',
      'he':
          '\"פתח עולם של אפשרויות. שכור מכוניות מהמקומיים ללא טרחה עם האפליקציה שלנו עוד היום!\"',
    },
    '89rxfh73': {
      'en': 'Get Started',
      'ar': 'البدء',
      'he': 'התחל',
    },
    'ib9ns6u9': {
      'en': 'LogIn',
      'ar': 'تسجيل الدخول',
      'he': 'כְּנִיסָה לַמַעֲרֶכֶת',
    },
    '4vdqgjex': {
      'en': 'Home',
      'ar': 'بيت',
      'he': 'בַּיִת',
    },
  },
  // profilePageRenter
  {
    'c9dnrirt': {
      'en': 'Account',
      'ar': 'حساب',
      'he': 'חֶשְׁבּוֹן',
    },
    't5ewxy8v': {
      'en': 'Add Funds',
      'ar': 'إضافة الأموال',
      'he': 'הוסף כספים',
    },
    'qxtaamfk': {
      'en': 'Rent Car',
      'ar': 'تأجير سيارة',
      'he': 'השכרת רכב',
    },
    'r2675fx3': {
      'en': 'My Orders',
      'ar': 'طلبياتي',
      'he': 'ההזמנות שלי',
    },
    'pq6j94zu': {
      'en': 'Edit Profile',
      'ar': 'تعديل الملف الشخصي',
      'he': 'ערוך פרופיל',
    },
    'cj4uhbm7': {
      'en': 'Support',
      'ar': 'يدعم',
      'he': 'תְמִיכָה',
    },
    'itnj24do': {
      'en': 'Delete User',
      'ar': 'حذف المستخدم',
      'he': 'מחק משתמש',
    },
    'i26wywl0': {
      'en': 'Profile',
      'ar': 'حساب تعريفي',
      'he': 'פּרוֹפִיל',
    },
    'vw22nm1v': {
      'en': 'dfssdf',
      'ar': 'دفسف',
      'he': 'dfssdf',
    },
  },
  // profilePageAdmin
  {
    'g5z9uqs1': {
      'en': 'Account',
      'ar': 'حساب',
      'he': 'חֶשְׁבּוֹן',
    },
    'qlsvrsnp': {
      'en': 'Manage Cars',
      'ar': 'إدارة السيارات',
      'he': 'ניהול מכוניות',
    },
    'gkur4tl7': {
      'en': 'Orders',
      'ar': 'طلبات',
      'he': 'הזמנות',
    },
    'iyxl3q36': {
      'en': 'Edit Profile',
      'ar': 'تعديل الملف الشخصي',
      'he': 'ערוך פרופיל',
    },
    '3h9bfyio': {
      'en': 'ReportsPage',
      'ar': 'التقاريرالصفحة',
      'he': 'דף דוחות',
    },
    's4ghmomp': {
      'en': 'Show Users From Collection',
      'ar': 'إظهار المستخدمين من المجموعة',
      'he': 'הצג משתמשים מהאוסף',
    },
    '8pxdxxju': {
      'en': 'Profile',
      'ar': 'حساب تعريفي',
      'he': 'פּרוֹפִיל',
    },
    'xhbom33x': {
      'en': 'Home',
      'ar': 'بيت',
      'he': 'בַּיִת',
    },
  },
  // HomePage
  {
    'g44prei5': {
      'en': 'Recent Added',
      'ar': 'الإضافات الحديثة',
      'he': 'לאחרונה נוספו',
    },
    '0wlc3t74': {
      'en': '',
      'ar': '',
      'he': '',
    },
    'p0l8i8w7': {
      'en': 'Add Car',
      'ar': 'أضف سيارة',
      'he': 'הוסף רכב',
    },
    'zra2e88h': {
      'en': 'My Cars',
      'ar': 'سياراتي',
      'he': 'המכוניות שלי',
    },
    'g4fhko9i': {
      'en': 'Profile',
      'ar': 'حساب تعريفي',
      'he': 'פּרוֹפִיל',
    },
    'a3yu599k': {
      'en': 'ContactUs',
      'ar': 'اتصل بنا',
      'he': 'צור קשר',
    },
    'cq3ktm52': {
      'en': 'Ruls Of The App',
      'ar': 'قواعد التطبيق',
      'he': 'כללי האפליקציה',
    },
    'nctdg3bs': {
      'en': 'LogOut',
      'ar': 'تسجيل الخروج',
      'he': 'התנתק',
    },
    'ch0mevxv': {
      'en': 'Home',
      'ar': 'بيت',
      'he': 'בַּיִת',
    },
  },
  // RentDeatils1
  {
    'oo4kge70': {
      'en': 'Show Phone Number',
      'ar': 'إظهار رقم الهاتف',
      'he': 'הצג מספר טלפון',
    },
    '6mn931pe': {
      'en': 'Rent Price',
      'ar': 'سعر الإيجار',
      'he': 'מחיר שכירות',
    },
    '0daa198j': {
      'en': 'lease',
      'ar': 'إيجار',
      'he': 'לַחכּוֹר',
    },
    '0z1ager7': {
      'en': 'Total',
      'ar': 'المجموع',
      'he': 'סַך הַכֹּל',
    },
    'e1rjv2sc': {
      'en': 'Order Now',
      'ar': 'اطلب الآن',
      'he': 'הזמינו עכשיו',
    },
    '538df6ys': {
      'en': 'Renting Details',
      'ar': 'تفاصيل الإيجار',
      'he': 'פרטי השכרה',
    },
    '7szcdm1y': {
      'en': 'Home',
      'ar': 'بيت',
      'he': 'בַּיִת',
    },
  },
  // UsersList
  {
    '89dkrc4o': {
      'en': 'check.io',
      'ar': 'تحقق.io',
      'he': 'check.io',
    },
    'lb5tmnv4': {
      'en': 'Platform Navigation',
      'ar': 'التنقل عبر المنصة',
      'he': 'ניווט בפלטפורמה',
    },
    'nleg6n40': {
      'en': 'Dashboard',
      'ar': 'لوحة القيادة',
      'he': 'לוּחַ מַחווָנִים',
    },
    'qzffplxx': {
      'en': 'Chats',
      'ar': 'الدردشات',
      'he': 'צ\'אטים',
    },
    'yru8ygck': {
      'en': 'Projects',
      'ar': 'المشاريع',
      'he': 'פרויקטים',
    },
    'm6vx0mk9': {
      'en': 'Settings',
      'ar': 'إعدادات',
      'he': 'הגדרות',
    },
    'xpzac3rm': {
      'en': 'Notifications',
      'ar': 'إشعارات',
      'he': 'התראות',
    },
    'uittuq4s': {
      'en': '12',
      'ar': '12',
      'he': '12',
    },
    'bebyoqlg': {
      'en': 'Billing',
      'ar': 'الفواتير',
      'he': 'חיוב',
    },
    'wvo0hkts': {
      'en': 'Explore',
      'ar': 'يستكشف',
      'he': 'לַחקוֹר',
    },
    'n6vletw7': {
      'en': 'Light Mode',
      'ar': 'وضع الضوء',
      'he': 'מצב אור',
    },
    'vrzjqsaz': {
      'en': 'Dark Mode',
      'ar': 'الوضع المظلم',
      'he': 'מצב כהה',
    },
    '9y1d0wz6': {
      'en': 'Andrew D.',
      'ar': 'أندرو د.',
      'he': 'אנדרו ד.',
    },
    'r53twrq5': {
      'en': 'admin@gmail.com',
      'ar': 'admin@gmail.com',
      'he': 'admin@gmail.com',
    },
    'mck09o5p': {
      'en': 'Users',
      'ar': 'المستخدمون',
      'he': 'משתמשים',
    },
    'gkd2qyrk': {
      'en': 'Below are a list of Users of your App.',
      'ar': 'فيما يلي قائمة بمستخدمي التطبيق الخاص بك.',
      'he': 'להלן רשימה של משתמשי האפליקציה שלך.',
    },
    'nsi3lehc': {
      'en': 'Search all users...',
      'ar': 'البحث عن جميع المستخدمين...',
      'he': 'חפש בכל המשתמשים...',
    },
    'a5py22s4': {
      'en': 'Name',
      'ar': 'اسم',
      'he': 'שֵׁם',
    },
    's03xhe27': {
      'en': 'Last Active',
      'ar': 'آخر نشاط',
      'he': 'פעיל אחרון',
    },
    'y2em228y': {
      'en': 'Title',
      'ar': 'عنوان',
      'he': 'כּוֹתֶרֶת',
    },
    '5xugdkmq': {
      'en': 'Status',
      'ar': 'حالة',
      'he': 'סטָטוּס',
    },
    'iatj45ye': {
      'en': '5 mins ago',
      'ar': 'منذ 5 دقائق',
      'he': 'לפני 5 דקות',
    },
    'xsjx2nmu': {
      'en': 'Head of Design',
      'ar': 'رئيس التصميم',
      'he': 'ראש תחום עיצוב',
    },
    'j30jtd1v': {
      'en': 'Randy Rodriguez',
      'ar': 'راندي رودريجيز',
      'he': 'רנדי רודריגז',
    },
    'b8yvxq56': {
      'en': 'randy@domainname.com',
      'ar': 'راندي@اسم المجال.كوم',
      'he': 'randy@domainname.com',
    },
    'tzfy4g4p': {
      'en': '5 mins ago',
      'ar': 'منذ 5 دقائق',
      'he': 'לפני 5 דקות',
    },
    'vnu1kdtb': {
      'en': 'Head of Design',
      'ar': 'رئيس التصميم',
      'he': 'ראש תחום עיצוב',
    },
    'j2nwcx21': {
      'en': 'Viewer',
      'ar': 'مشاهد',
      'he': 'צוֹפֶה',
    },
    'tr8dr4f9': {
      'en': 'Randy Rodriguez',
      'ar': 'راندي رودريجيز',
      'he': 'רנדי רודריגז',
    },
    '7p1pe912': {
      'en': 'randy@domainname.com',
      'ar': 'راندي@اسم المجال.كوم',
      'he': 'randy@domainname.com',
    },
    'sei0kt68': {
      'en': '5 mins ago',
      'ar': 'منذ 5 دقائق',
      'he': 'לפני 5 דקות',
    },
    'yx0a6jbg': {
      'en': 'Head of Design',
      'ar': 'رئيس التصميم',
      'he': 'ראש תחום עיצוב',
    },
    '84b3b2u5': {
      'en': 'Viewer',
      'ar': 'مشاهد',
      'he': 'צוֹפֶה',
    },
    'sr874f97': {
      'en': 'Randy Rodriguez',
      'ar': 'راندي رودريجيز',
      'he': 'רנדי רודריגז',
    },
    'xgfid9jh': {
      'en': 'randy@domainname.com',
      'ar': 'راندي@اسم المجال.كوم',
      'he': 'randy@domainname.com',
    },
    '14cjkzbk': {
      'en': '5 mins ago',
      'ar': 'منذ 5 دقائق',
      'he': 'לפני 5 דקות',
    },
    'izoqqffb': {
      'en': 'Head of Design',
      'ar': 'رئيس التصميم',
      'he': 'ראש תחום עיצוב',
    },
    'unlrtcyo': {
      'en': 'Viewer',
      'ar': 'مشاهد',
      'he': 'צוֹפֶה',
    },
    'njvvfonz': {
      'en': 'Randy Rodriguez',
      'ar': 'راندي رودريجيز',
      'he': 'רנדי רודריגז',
    },
    'ma4xbsja': {
      'en': 'randy@domainname.com',
      'ar': 'راندي@اسم المجال.كوم',
      'he': 'randy@domainname.com',
    },
    'tk8sv7cr': {
      'en': '5 mins ago',
      'ar': 'منذ 5 دقائق',
      'he': 'לפני 5 דקות',
    },
    '60x1tmvk': {
      'en': 'Head of Design',
      'ar': 'رئيس التصميم',
      'he': 'ראש תחום עיצוב',
    },
    '4d31plrf': {
      'en': 'Owner',
      'ar': 'مالك',
      'he': 'בַּעַל',
    },
    '1utjp17l': {
      'en': 'Home',
      'ar': 'بيت',
      'he': 'בַּיִת',
    },
  },
  // EditProfileForAdmin
  {
    'qqxhpuqp': {
      'en': 'Show Details',
      'ar': 'إظهار التفاصيل',
      'he': 'הצג פרטים',
    },
    '4u6je9lo': {
      'en': 'Phone Call',
      'ar': 'مكالمة هاتفية',
      'he': 'שיחת טלפון',
    },
    'thm1udxa': {
      'en': 'SendMeassage',
      'ar': 'إرسال رسالة',
      'he': 'SendMeassage',
    },
    'n4g3ta7a': {
      'en': 'Home',
      'ar': 'بيت',
      'he': 'בַּיִת',
    },
  },
  // AddCarFinal
  {
    '422oga38': {
      'en': 'Car Name',
      'ar': 'اسم السيارة',
      'he': 'שם המכונית',
    },
    'x2c1ihls': {
      'en': 'Toyota ',
      'ar': 'تويوتا',
      'he': 'טויוטה',
    },
    'z4v8zk7u': {
      'en': '',
      'ar': '',
      'he': '',
    },
    'hw3zqsv0': {
      'en': 'Location',
      'ar': 'موقع',
      'he': 'מִקוּם',
    },
    'dxn0yw8j': {
      'en': 'BeerSheva,Isreal',
      'ar': 'بئر السبع، إسرائيل',
      'he': 'באר שבע, ישראל',
    },
    'ma7qqzd8': {
      'en': 'Rent Price',
      'ar': 'سعر الإيجار',
      'he': 'מחיר שכירות',
    },
    'jhvn50ns': {
      'en': '###/\$',
      'ar': '###/\$',
      'he': '###/\$',
    },
    '8gcaxv5k': {
      'en': 'Time Availability',
      'ar': 'توفر الوقت',
      'he': 'זמינות זמן',
    },
    '1j0tsbc1': {
      'en': '##/##/####',
      'ar': '##/##/####',
      'he': '##/##/####',
    },
    'ki6ygwp0': {
      'en': 'Avillable ',
      'ar': 'متوفر',
      'he': 'זמין',
    },
    'boskohzl': {
      'en': 'Avilable',
      'ar': 'متوفر',
      'he': 'זמין',
    },
    '09tl8oju': {
      'en': 'Not Avilable',
      'ar': 'غير متوفر',
      'he': 'לא זמין',
    },
    'xhloiz0b': {
      'en': 'Please select...',
      'ar': 'الرجاء الاختيار...',
      'he': 'אנא בחר...',
    },
    'lkaqr852': {
      'en': 'Search for an item...',
      'ar': 'البحث عن العنصر...',
      'he': 'חפש פריט...',
    },
    'm13t8sfl': {
      'en': 'Category',
      'ar': 'فئة',
      'he': 'קָטֵגוֹרִיָה',
    },
    'gzluapmj': {
      'en': 'Luxury ',
      'ar': 'رفاهية',
      'he': 'מוּתָרוּת',
    },
    'lxuo7wqz': {
      'en': 'Wedding ',
      'ar': 'قِرَان',
      'he': 'חֲתוּנָה',
    },
    'mw3g9ss2': {
      'en': 'Private ',
      'ar': 'خاص',
      'he': 'פְּרָטִי',
    },
    'ry8sg007': {
      'en': 'Family ',
      'ar': 'عائلة',
      'he': 'מִשׁפָּחָה',
    },
    'o2bzfvp4': {
      'en': 'Please select...',
      'ar': 'الرجاء الاختيار...',
      'he': 'אנא בחר...',
    },
    '51xqzsa8': {
      'en': 'Search for an item...',
      'ar': 'البحث عن العنصر...',
      'he': 'חפש פריט...',
    },
    'pawcqymk': {
      'en': 'Tap To Upload Main Photo',
      'ar': 'انقر لتحميل الصورة الرئيسية',
      'he': 'הקש כדי להעלות תמונה ראשית',
    },
    'fp9quop4': {
      'en': 'Submit',
      'ar': 'يُقدِّم',
      'he': 'לְהַגִישׁ',
    },
  },
  // ManageMyCars
  {
    '8sazyjkx': {
      'en': 'Manage Cars',
      'ar': 'إدارة السيارات',
      'he': 'ניהול מכוניות',
    },
    'wsup8ole': {
      'en': 'Below are your Cars',
      'ar': 'فيما يلي سياراتك',
      'he': 'להלן המכוניות שלך',
    },
    'thk2fnpi': {
      'en': 'Cars',
      'ar': 'السيارات',
      'he': 'מכוניות',
    },
    '0nlf18tr': {
      'en': 'Weight',
      'ar': 'وزن',
      'he': 'מִשׁקָל',
    },
    'cb41wp2o': {
      'en': 'Status',
      'ar': 'حالة',
      'he': 'סטָטוּס',
    },
    'j4zi9zf1': {
      'en': '/',
      'ar': '/',
      'he': '/',
    },
    'uxfd0nyk': {
      'en': '2.5 lbs',
      'ar': '2.5 رطل',
      'he': '2.5 פאונד',
    },
    'd6j0fzy5': {
      'en': 'Shipped',
      'ar': 'تم الشحن',
      'he': 'נשלח',
    },
    '8edyc6g1': {
      'en': 'Home',
      'ar': 'بيت',
      'he': 'בַּיִת',
    },
  },
  // SuccessOrder
  {
    'htj1hzh3': {
      'en': 'Payment Confirmed!',
      'ar': 'تم تأكيد الدفع!',
      'he': 'התשלום אושר!',
    },
    't4h1fczy': {
      'en': 'Your payment has been confirmed.',
      'ar': 'لقد تم تأكيد الدفع الخاص بك.',
      'he': 'התשלום שלך אושר.',
    },
    's3zycdzx': {
      'en': 'Go Home',
      'ar': 'العودة إلى المنزل',
      'he': 'לך הביתה',
    },
    'iu5om45y': {
      'en': 'Home',
      'ar': 'بيت',
      'he': 'בַּיִת',
    },
  },
  // ManageCarsAdmin
  {
    '2iu0zc3a': {
      'en': 'Manage Cars',
      'ar': 'إدارة السيارات',
      'he': 'ניהול מכוניות',
    },
    'pix2ua9s': {
      'en': 'Below are All The Cars',
      'ar': 'فيما يلي جميع السيارات',
      'he': 'להלן כל המכוניות',
    },
    'a1kmrkws': {
      'en': 'Cars',
      'ar': 'السيارات',
      'he': 'מכוניות',
    },
    'o9gwns7e': {
      'en': 'Weight',
      'ar': 'وزن',
      'he': 'מִשׁקָל',
    },
    'tfwgzlrr': {
      'en': 'Status',
      'ar': 'حالة',
      'he': 'סטָטוּס',
    },
    '6bv0ze32': {
      'en': '/',
      'ar': '/',
      'he': '/',
    },
    'uroawry3': {
      'en': '2.5 lbs',
      'ar': '2.5 رطل',
      'he': '2.5 פאונד',
    },
    '2h9qkm25': {
      'en': 'Shipped',
      'ar': 'تم الشحن',
      'he': 'נשלח',
    },
    'lbr2w647': {
      'en': 'Home',
      'ar': 'بيت',
      'he': 'בַּיִת',
    },
  },
  // MyOrdersRenter
  {
    'gwsfpqoj': {
      'en': 'My Cars',
      'ar': 'سياراتي',
      'he': 'המכוניות שלי',
    },
    'vyfi0jwg': {
      'en': 'Cars Below',
      'ar': 'السيارات أدناه',
      'he': 'מכוניות למטה',
    },
    'x8xr3nc2': {
      'en': 'Recived',
      'ar': 'تم الاستلام',
      'he': 'התקבל',
    },
    'vwv63mwi': {
      'en': 'user@domainname.com',
      'ar': 'المستخدم@اسم المجال.com',
      'he': 'user@domainname.com',
    },
    'im59aku5': {
      'en': 'View',
      'ar': 'منظر',
      'he': 'נוֹף',
    },
    'p76624mp': {
      'en': 'Username',
      'ar': 'اسم المستخدم',
      'he': 'שם משתמש',
    },
    'ujd96ey3': {
      'en': 'user@domainname.com',
      'ar': 'المستخدم@اسم المجال.com',
      'he': 'user@domainname.com',
    },
    '7bsoxeqo': {
      'en': 'View',
      'ar': 'منظر',
      'he': 'נוֹף',
    },
    '1bd290eh': {
      'en': 'Username',
      'ar': 'اسم المستخدم',
      'he': 'שם משתמש',
    },
    '145mvl87': {
      'en': 'user@domainname.com',
      'ar': 'المستخدم@اسم المجال.com',
      'he': 'user@domainname.com',
    },
    '5enkv06k': {
      'en': 'View',
      'ar': 'منظر',
      'he': 'נוֹף',
    },
    'u6j0iezh': {
      'en': 'user@domainname.com',
      'ar': 'المستخدم@اسم المجال.com',
      'he': 'user@domainname.com',
    },
    'ficc3vpi': {
      'en': 'View',
      'ar': 'منظر',
      'he': 'נוֹף',
    },
    '43sbcvey': {
      'en': 'Home',
      'ar': 'بيت',
      'he': 'בַּיִת',
    },
  },
  // MyOrdersOwner
  {
    'rb6tvw2a': {
      'en': 'My Cars',
      'ar': 'سياراتي',
      'he': 'המכוניות שלי',
    },
    'h2v4vuao': {
      'en': 'Cars Below',
      'ar': 'السيارات أدناه',
      'he': 'מכוניות למטה',
    },
    '0f7r0667': {
      'en': 'View',
      'ar': 'منظر',
      'he': 'נוֹף',
    },
    '2wjmpm3r': {
      'en': 'user@domainname.com',
      'ar': 'المستخدم@اسم المجال.com',
      'he': 'user@domainname.com',
    },
    'j5moqydm': {
      'en': 'View',
      'ar': 'منظر',
      'he': 'נוֹף',
    },
    'w3dmu5xm': {
      'en': 'Username',
      'ar': 'اسم المستخدم',
      'he': 'שם משתמש',
    },
    'chpnoor1': {
      'en': 'user@domainname.com',
      'ar': 'المستخدم@اسم المجال.com',
      'he': 'user@domainname.com',
    },
    'df6p5c51': {
      'en': 'View',
      'ar': 'منظر',
      'he': 'נוֹף',
    },
    'u0evh5nr': {
      'en': 'Username',
      'ar': 'اسم المستخدم',
      'he': 'שם משתמש',
    },
    'v3caqb9x': {
      'en': 'user@domainname.com',
      'ar': 'المستخدم@اسم المجال.com',
      'he': 'user@domainname.com',
    },
    '35nogm3p': {
      'en': 'View',
      'ar': 'منظر',
      'he': 'נוֹף',
    },
    '0wb2rhb6': {
      'en': 'user@domainname.com',
      'ar': 'المستخدم@اسم المجال.com',
      'he': 'user@domainname.com',
    },
    'ltuyc7yw': {
      'en': 'View',
      'ar': 'منظر',
      'he': 'נוֹף',
    },
    'qlmk861s': {
      'en': 'Home',
      'ar': 'بيت',
      'he': 'בַּיִת',
    },
  },
  // MyOrdersAdmin
  {
    'luwirap0': {
      'en': 'My Cars',
      'ar': 'سياراتي',
      'he': 'המכוניות שלי',
    },
    'oo4sbxjr': {
      'en': 'Cars Below',
      'ar': 'السيارات أدناه',
      'he': 'מכוניות למטה',
    },
    'tmn4kuxo': {
      'en': 'View',
      'ar': 'منظر',
      'he': 'נוֹף',
    },
    '4acse34x': {
      'en': 'user@domainname.com',
      'ar': 'المستخدم@اسم المجال.com',
      'he': 'user@domainname.com',
    },
    'g7maeq9h': {
      'en': 'View',
      'ar': 'منظر',
      'he': 'נוֹף',
    },
    'jliso7s9': {
      'en': 'Username',
      'ar': 'اسم المستخدم',
      'he': 'שם משתמש',
    },
    'u6gb94kc': {
      'en': 'user@domainname.com',
      'ar': 'المستخدم@اسم المجال.com',
      'he': 'user@domainname.com',
    },
    't17so31f': {
      'en': 'View',
      'ar': 'منظر',
      'he': 'נוֹף',
    },
    'itbrfh8f': {
      'en': 'Username',
      'ar': 'اسم المستخدم',
      'he': 'שם משתמש',
    },
    'lhqq6ejj': {
      'en': 'user@domainname.com',
      'ar': 'المستخدم@اسم المجال.com',
      'he': 'user@domainname.com',
    },
    'qhchtyf8': {
      'en': 'View',
      'ar': 'منظر',
      'he': 'נוֹף',
    },
    'xlrd0f7c': {
      'en': 'user@domainname.com',
      'ar': 'المستخدم@اسم المجال.com',
      'he': 'user@domainname.com',
    },
    'rxkg17gf': {
      'en': 'View',
      'ar': 'منظر',
      'he': 'נוֹף',
    },
    'g7yh6p8h': {
      'en': 'Home',
      'ar': 'بيت',
      'he': 'בַּיִת',
    },
  },
  // Rules
  {
    '86gsaeec': {
      'en': 'Rules and PolicyCar Rental App - Policies and Rules',
      'ar': 'القواعد والسياساتتطبيق تأجير السيارات - السياسات والقواعد',
      'he': 'כללים ומדיניות אפליקציית השכרת רכב - מדיניות וכללים',
    },
    'bgg8pkm1': {
      'en':
          'Car Rental App - Policies and Rules\n1. Introduction\nWelcome to [App Name]! Our platform connects car owners with renters, providing a seamless way to rent vehicles directly from their owners. To ensure a safe, transparent, and enjoyable experience for all users, please review and adhere to the following policies and rules.\n\n2. General Guidelines\nEligibility: Users must be at least [minimum age, e.g., 18] years old and possess a valid driver’s license to use the app.\nAccount Verification: All users must complete identity verification and provide a valid government-issued ID. Vehicle owners must also provide proof of vehicle ownership.\nCompliance: All users must comply with local laws and regulations related to vehicle operation and rental.\n3. Vehicle Owners’ Responsibilities\nVehicle Condition: Vehicles must be maintained in good working order and must pass a pre-rental inspection conducted through the app.\nAccurate Listings: Provide accurate and honest information about the vehicle’s condition, features, and any existing damage. Regularly update your listing to reflect the current status of the vehicle.\nInsurance Coverage: Ensure that the vehicle is insured and that coverage is adequate. You are responsible for informing renters of any insurance requirements or limitations.\nPre-Rental Inspection: Conduct a thorough pre-rental inspection and document the vehicle’s condition with photos or videos. Share these with the renter and the app platform.\nCommunication: Respond promptly to renter inquiries and ensure clear and open communication throughout the rental period.\n4. Renters’ Responsibilities\nVehicle Use: Use the vehicle responsibly and in accordance with the terms outlined in the rental agreement. Avoid any illegal activities or behaviors that could damage the vehicle.\nCondition Report: Review the pre-rental condition report and document any discrepancies or existing damage immediately upon receiving the vehicle.\nInsurance and Safety: Ensure that you understand and comply with the insurance coverage provided. In case of an accident or damage, report it immediately to the app and follow the provided procedures.\nFuel and Cleanliness: Return the vehicle with a full tank of gas and in the same clean condition as when received. Any additional cleaning fees or fuel charges will be the renter’s responsibility.\nTimely Return: Return the vehicle at the agreed-upon time and location. Late returns may incur additional charges.\n5. Insurance and Damage Protection\nCoverage: The app provides insurance coverage for both the vehicle and the renter. Details of the coverage, including limits and exclusions, are available in the insurance policy section of the app.\nClaims: In the event of damage or an accident, notify the app’s customer support team immediately. Provide all necessary documentation and cooperate with any investigations or claims processes.\n6. Dispute Resolution\nReporting Issues: Report any disputes or issues related to the rental experience through the app’s dispute resolution feature.\nMediation: The app’s trust and safety team will mediate disputes and work towards a fair resolution based on the information provided by both parties.\nAppeals: If you are dissatisfied with the resolution, you may appeal the decision through the app’s appeals process. All appeals will be reviewed by a senior team member.\n7. User Conduct\nProhibited Activities: Users are prohibited from engaging in fraudulent activities, unauthorized use of vehicles, or any behavior that jeopardizes the safety or integrity of the app.\nRespect and Courtesy: Treat all users with respect and courtesy. Any harassment, discrimination, or abusive behavior will not be tolerated.\n8. Privacy and Data Security\nData Protection: The app is committed to protecting your personal information. All data is collected and stored in accordance with our privacy policy.\nUsage: User data will only be used for the purposes of facilitating rentals and improving the app experience.\n9. Policy Changes\nUpdates: These policies and rules may be updated from time to time. Users will be notified of any significant changes, and continued use of the app constitutes acceptance of the updated policies.\n10. Contact Information\nFor any questions or concerns regarding these policies or the use of the app, please contact our support team at \"AbodShah126gmail.com .\n\nBy using The App you agree to abide by these policies and rules. Thank you for helping us create a safe and enjoyable rental experience for everyone!\n\n',
      'ar':
          'تطبيق تأجير السيارات - السياسات والقواعد\n1. المقدمة\nمرحبًا بك في [اسم التطبيق]! تربط منصتنا بين مالكي السيارات والمستأجرين، مما يوفر طريقة سلسة لاستئجار المركبات مباشرة من مالكيها. لضمان تجربة آمنة وشفافة وممتعة لجميع المستخدمين، يرجى مراجعة السياسات والقواعد التالية والالتزام بها.\n\n2. الإرشادات العامة\nالأهلية: يجب أن يكون عمر المستخدمين [الحد الأدنى للعمر، على سبيل المثال، 18] عامًا على الأقل وأن يمتلكوا رخصة قيادة سارية لاستخدام التطبيق.\n\nالتحقق من الحساب: يجب على جميع المستخدمين إكمال التحقق من الهوية وتقديم بطاقة هوية حكومية سارية. يجب على مالكي المركبات أيضًا تقديم إثبات لملكية المركبة.\nالامتثال: يجب على جميع المستخدمين الامتثال للقوانين واللوائح المحلية المتعلقة بتشغيل المركبات وتأجيرها.\n\n3. مسؤوليات مالكي المركبات\nحالة المركبة: يجب صيانة المركبات في حالة عمل جيدة ويجب أن تجتاز فحص ما قبل التأجير الذي يتم إجراؤه من خلال التطبيق.\nالقوائم الدقيقة: تقديم معلومات دقيقة وصادقة حول حالة المركبة وميزاتها وأي ضرر موجود. قم بتحديث إعلانك بانتظام ليعكس الحالة الحالية للسيارة.\n\nتغطية التأمين: تأكد من أن السيارة مؤمنة وأن التغطية كافية. أنت مسؤول عن إبلاغ المستأجرين بأي متطلبات أو قيود تأمينية.\n\nفحص ما قبل الإيجار: قم بإجراء فحص شامل قبل الإيجار وقم بتوثيق حالة السيارة بالصور أو مقاطع الفيديو. شاركها مع المستأجر ومنصة التطبيق.\n\nالتواصل: استجب على الفور لاستفسارات المستأجر وتأكد من التواصل الواضح والمفتوح طوال فترة الإيجار.\n\n4. مسؤوليات المستأجرين\n\nاستخدام السيارة: استخدم السيارة بمسؤولية ووفقًا للشروط الموضحة في اتفاقية الإيجار. تجنب أي أنشطة أو سلوكيات غير قانونية يمكن أن تلحق الضرر بالسيارة.\n\nتقرير الحالة: راجع تقرير حالة ما قبل الإيجار وقم بتوثيق أي تناقضات أو أضرار موجودة فور استلام السيارة.\n\nالتأمين والسلامة: تأكد من فهمك وامتثالك للتغطية التأمينية المقدمة. في حالة وقوع حادث أو ضرر، أبلغ عنه على الفور إلى التطبيق واتبع الإجراءات المقدمة.\nالوقود والنظافة: أعد السيارة بخزان وقود ممتلئ وفي نفس الحالة النظيفة كما كانت عند استلامها. أي رسوم تنظيف إضافية أو رسوم وقود ستكون مسؤولية المستأجر.\n\nالإرجاع في الوقت المناسب: أعد السيارة في الوقت والمكان المتفق عليهما. قد يؤدي الإرجاع المتأخر إلى فرض رسوم إضافية.\n\n5. التأمين وحماية الأضرار\nالتغطية: يوفر التطبيق تغطية تأمينية لكل من السيارة والمستأجر. تتوفر تفاصيل التغطية، بما في ذلك الحدود والاستثناءات، في قسم وثيقة التأمين في التطبيق.\n\nالمطالبات: في حالة حدوث ضرر أو حادث، أخطر فريق دعم العملاء في التطبيق على الفور. قدم جميع الوثائق اللازمة وتعاون مع أي تحقيقات أو عمليات مطالبات.\n\n6. حل النزاعات\nالإبلاغ عن المشكلات: أبلغ عن أي نزاعات أو مشكلات تتعلق بتجربة الإيجار من خلال ميزة حل النزاعات في التطبيق.\n\nالوساطة: سيتولى فريق الثقة والسلامة في التطبيق التوسط في النزاعات والعمل على التوصل إلى حل عادل بناءً على المعلومات المقدمة من كلا الطرفين.\nالطعون: إذا كنت غير راضٍ عن القرار، يمكنك الطعن في القرار من خلال عملية الطعون الخاصة بالتطبيق. سيتم مراجعة جميع الطعون من قبل أحد أعضاء الفريق الرئيسيين.\n7. سلوك المستخدم\nالأنشطة المحظورة: يُحظر على المستخدمين الانخراط في أنشطة احتيالية أو استخدام غير مصرح به للمركبات أو أي سلوك يعرض سلامة التطبيق أو سلامته للخطر.\nالاحترام واللباقة: تعامل مع جميع المستخدمين باحترام ولباقة. لن يتم التسامح مع أي مضايقة أو تمييز أو سلوك مسيء.\n8. الخصوصية وأمان البيانات\nحماية البيانات: يلتزم التطبيق بحماية معلوماتك الشخصية. يتم جمع جميع البيانات وتخزينها وفقًا لسياسة الخصوصية الخاصة بنا.\nالاستخدام: سيتم استخدام بيانات المستخدم فقط لأغراض تسهيل الإيجارات وتحسين تجربة التطبيق.\n9. تغييرات السياسة\nالتحديثات: قد يتم تحديث هذه السياسات والقواعد من وقت لآخر. سيتم إخطار المستخدمين بأي تغييرات كبيرة، ويشكل الاستمرار في استخدام التطبيق قبولًا للسياسات المحدثة.\n10. معلومات الاتصال\nلأي أسئلة أو مخاوف بخصوص هذه السياسات أو استخدام التطبيق، يرجى الاتصال بفريق الدعم لدينا على \"AbodShah126gmail.com .\n\nباستخدام التطبيق، فإنك توافق على الالتزام بهذه السياسات والقواعد. شكرًا لك على مساعدتنا في إنشاء تجربة إيجار آمنة وممتعة للجميع!',
      'he':
          'אפליקציית השכרת רכב - מדיניות וכללים\n1. הקדמה\nברוכים הבאים אל [שם האפליקציה]! הפלטפורמה שלנו מחברת בין בעלי רכב לשוכרים, ומספקת דרך חלקה לשכור רכבים ישירות מבעליהם. כדי להבטיח חוויה בטוחה, שקופה ומהנה לכל המשתמשים, אנא עיין במדיניות ובכללים הבאים ועקוב אחריהם.\n\n2. הנחיות כלליות\nזכאות: המשתמשים חייבים להיות בני [גיל מינימלי, למשל, 18] לפחות ובעלי רישיון נהיגה תקף כדי להשתמש באפליקציה.\nאימות חשבון: כל המשתמשים חייבים להשלים את אימות הזהות ולספק תעודה מזהה חוקית שהונפקה על ידי הממשלה. בעלי רכב חייבים גם לספק הוכחה לבעלות על רכב.\nתאימות: כל המשתמשים חייבים לציית לחוקים ולתקנות המקומיים הקשורים לתפעול והשכרת רכב.\n3. אחריות בעלי הרכב\nמצב הרכב: יש לתחזק את הרכבים במצב תקין וחייבים לעבור בדיקה לפני השכרה שנערכה דרך האפליקציה.\nרישומים מדויקים: ספק מידע מדויק וכנה על מצב הרכב, תכונותיו וכל נזק קיים. עדכן באופן קבוע את הרישום שלך כדי לשקף את המצב הנוכחי של הרכב.\nכיסוי ביטוחי: יש לוודא שהרכב מבוטח וכי הכיסוי הולם. אתה אחראי ליידע את השוכרים בכל דרישות או מגבלות ביטוח.\nבדיקה לפני השכרה: ערכו בדיקה יסודית לפני השכרה ותעדו את מצב הרכב באמצעות תמונות או סרטונים. שתף אותם עם השוכר ועם פלטפורמת האפליקציה.\nתקשורת: הגיבו מיידית לפניות השוכרים והקפידו על תקשורת ברורה ופתוחה לאורך כל תקופת השכירות.\n4. אחריות השוכרים\nשימוש ברכב: השתמש ברכב באחריות ובהתאם לתנאים המפורטים בהסכם השכירות. הימנע מכל פעילות או התנהגויות לא חוקיות העלולות לגרום נזק לרכב.\nדו\"ח מצב: עיין בדוח המצב שלפני ההשכרה ותעד כל אי התאמות או נזק קיים מיד עם קבלת הרכב.\nביטוח ובטיחות: ודא שאתה מבין את הכיסוי הביטוחי המסופק ועומד בו. במקרה של תאונה או נזק, דווח על כך מיד לאפליקציה ופעל לפי הנהלים שסופקו.\nדלק וניקיון: החזר את הרכב עם מיכל גז מלא ובאותו מצב נקי כמו בעת קבלתו. כל דמי ניקיון או דמי דלק נוספים יהיו באחריות השוכר.\nהחזרה בזמן: החזר את הרכב בזמן ובמיקום המוסכם. החזרות מאוחרות עשויות לגרור חיובים נוספים.\n5. ביטוח והגנה מפני נזקים\nכיסוי: האפליקציה מספקת כיסוי ביטוחי גם לרכב וגם לשוכר. פרטי הכיסוי, כולל הגבלות והחרגות, זמינים בסעיף פוליסת הביטוח של האפליקציה.\nתביעות: במקרה של נזק או תאונה, הודע מיד לצוות תמיכת הלקוחות של האפליקציה. ספק את כל התיעוד הדרוש ושתף פעולה עם כל חקירות או תהליכי תביעה.\n6. יישוב סכסוכים\nדיווח על בעיות: דווח על מחלוקות או בעיות הקשורות לחוויית ההשכרה באמצעות תכונת יישוב המחלוקות של האפליקציה.\nגישור: צוות האמון והבטיחות של האפליקציה יתווך בסכסוכים ויפעל לפתרון הוגן על סמך המידע שסופק על ידי שני הצדדים.\nערעורים: אם אינך מרוצה מההחלטה, תוכל לערער על ההחלטה באמצעות תהליך הערעור של האפליקציה. כל הערעורים ייבדקו על ידי חבר צוות בכיר.\n7. התנהלות משתמשים\nפעילויות אסורות: אסור למשתמשים לעסוק בפעילויות הונאה, שימוש לא מורשה בכלי רכב, או כל התנהגות שמסכנת את הבטיחות או שלמות האפליקציה.\nכבוד ואדיבות: התייחסו לכל המשתמשים בכבוד ובאדיבות. כל הטרדה, אפליה או התנהגות פוגענית לא תסבול.\n8. פרטיות ואבטחת נתונים\nהגנת נתונים: האפליקציה מחויבת להגן על המידע האישי שלך. כל הנתונים נאספים ומאוחסנים בהתאם למדיניות הפרטיות שלנו.\nשימוש: נתוני המשתמש ישמשו רק למטרות להקל על השכרות ושיפור חווית האפליקציה.\n9. שינויים במדיניות\nעדכונים: מדיניות וכללים אלה עשויים להתעדכן מעת לעת. המשתמשים יקבלו הודעה על כל שינוי משמעותי, והמשך השימוש באפליקציה מהווה הסכמה למדיניות המעודכנת.\n10. מידע ליצירת קשר\nלכל שאלה או דאגה בנוגע למדיניות זו או לשימוש באפליקציה, אנא צור קשר עם צוות התמיכה שלנו בכתובת \"AbodShah126gmail.com.\n\nבשימוש באפליקציה אתה מסכים לציית למדיניות ולכללים אלה. תודה שעזרת לנו ליצור חווית השכרה בטוחה ומהנה לכולם!',
    },
  },
  // LuxuryCars
  {
    'sny7vo90': {
      'en': 'Luxury Cars Below',
      'ar': 'السيارات الفاخرة أدناه',
      'he': 'מכוניות יוקרה למטה',
    },
    'mq09e9gx': {
      'en': 'Recent Added',
      'ar': 'الإضافات الحديثة',
      'he': 'לאחרונה נוספו',
    },
    'b5cubxch': {
      'en': '',
      'ar': '',
      'he': '',
    },
    '7d9qozcq': {
      'en': 'Add Car',
      'ar': 'أضف سيارة',
      'he': 'הוסף רכב',
    },
    'tcp2wl52': {
      'en': 'My Cars',
      'ar': 'سياراتي',
      'he': 'המכוניות שלי',
    },
    '8p62dx8y': {
      'en': 'Profile',
      'ar': 'حساب تعريفي',
      'he': 'פּרוֹפִיל',
    },
    'g15tsods': {
      'en': 'ContactUs',
      'ar': 'اتصل بنا',
      'he': 'צור קשר',
    },
    'mzce9zv3': {
      'en': 'LogOut',
      'ar': 'تسجيل الخروج',
      'he': 'התנתק',
    },
    'rif1jqdo': {
      'en': 'Home',
      'ar': 'بيت',
      'he': 'בַּיִת',
    },
  },
  // PrivateCars
  {
    'pxb08gde': {
      'en': 'Private Cars Below',
      'ar': 'سيارات خاصة بالأسفل',
      'he': 'מכוניות פרטיות למטה',
    },
    '5w9w6ded': {
      'en': 'Recent Added',
      'ar': 'الإضافات الحديثة',
      'he': 'לאחרונה נוספו',
    },
    '578ur3ta': {
      'en': '',
      'ar': '',
      'he': '',
    },
    'eph0h32e': {
      'en': 'Add Car',
      'ar': 'أضف سيارة',
      'he': 'הוסף רכב',
    },
    'wvwcavm5': {
      'en': 'My Cars',
      'ar': 'سياراتي',
      'he': 'המכוניות שלי',
    },
    'nu21cyms': {
      'en': 'Profile',
      'ar': 'حساب تعريفي',
      'he': 'פּרוֹפִיל',
    },
    'cb25r2vi': {
      'en': 'ContactUs',
      'ar': 'اتصل بنا',
      'he': 'צור קשר',
    },
    'im9d1auo': {
      'en': 'LogOut',
      'ar': 'تسجيل الخروج',
      'he': 'התנתק',
    },
    'ahqgzf1p': {
      'en': 'Home',
      'ar': 'بيت',
      'he': 'בַּיִת',
    },
  },
  // WeddingCars
  {
    'n979eq2q': {
      'en': 'Wedding Cars Below',
      'ar': 'سيارات الزفاف في الأسفل',
      'he': 'מכוניות חתונה למטה',
    },
    '0upszak4': {
      'en': 'Recent Added',
      'ar': 'الإضافات الحديثة',
      'he': 'לאחרונה נוספו',
    },
    'iuvas9cz': {
      'en': '',
      'ar': '',
      'he': '',
    },
    'ngl41zh6': {
      'en': 'Add Car',
      'ar': 'أضف سيارة',
      'he': 'הוסף רכב',
    },
    'cxl8986k': {
      'en': 'My Cars',
      'ar': 'سياراتي',
      'he': 'המכוניות שלי',
    },
    'ihxoomja': {
      'en': 'Profile',
      'ar': 'حساب تعريفي',
      'he': 'פּרוֹפִיל',
    },
    'k2yu1mub': {
      'en': 'ContactUs',
      'ar': 'اتصل بنا',
      'he': 'צור קשר',
    },
    'ziuechme': {
      'en': 'LogOut',
      'ar': 'تسجيل الخروج',
      'he': 'התנתק',
    },
    'fpclwfe6': {
      'en': 'Home',
      'ar': 'بيت',
      'he': 'בַּיִת',
    },
  },
  // Agreement
  {
    'ga5z24q3': {
      'en': 'EaseCarAgreement',
      'ar': 'اتفاقية EaseCar',
      'he': 'EaseCar Agreement',
    },
    'xoyoja4u': {
      'en': ' - Rent Safely',
      'ar': '- استأجر بأمان',
      'he': '- השכרה בטוחה',
    },
    't9u3iop1': {
      'en': '',
      'ar': '',
      'he': '',
    },
    'ah9d4mvg': {
      'en': 'Rental Agreement Between : ',
      'ar': 'اتفاقية الإيجار بين :',
      'he': 'הסכם שכירות בין:',
    },
    'oz9cqga4': {
      'en':
          '1. The Owner agrees to rent the car to the Renter, and the Renter agrees to rent the car from the Owner, subject to the terms and conditions of this Agreement.',
      'ar':
          '1. يوافق المالك على تأجير السيارة للمستأجر، ويوافق المستأجر على استئجار السيارة من المالك، وفقًا للشروط والأحكام الواردة في هذه الاتفاقية.',
      'he':
          '1. הבעלים מסכים להשכיר את הרכב לשוכר, והשוכר מסכים לשכור את הרכב מהבעלים, בכפוף לתנאי הסכם זה.',
    },
    'prysb9me': {
      'en':
          '2.The Renter agrees to return the car in the same condition as it was received. The Renter is responsible for any damage or loss that occurs while the car is in their possession',
      'ar':
          '2. يوافق المستأجر على إعادة السيارة بنفس الحالة التي استلمها بها. المستأجر مسؤول عن أي ضرر أو خسارة تحدث أثناء وجود السيارة في حوزته',
      'he':
          '2. השוכר מסכים להחזיר את הרכב באותו מצב שבו התקבל. השוכר אחראי לכל נזק או אובדן שיתרחש בזמן שהמכונית ברשותו',
    },
    'cbx5y2zi': {
      'en':
          '3.  Before taking possession of the car, the Renter must take photographs of the car, including its exterior and interior, and send these photos to both the Owner\'s email and the Manager\'s email : abodshah126@gmail.com . The photos must include documentation of the date and time they were taken.',
      'ar':
          '3. قبل استلام السيارة، يجب على المستأجر التقاط صور للسيارة، بما في ذلك مظهرها الخارجي والداخلي، وإرسال هذه الصور إلى البريد الإلكتروني للمالك والبريد الإلكتروني للمدير: abodshah126@gmail.com. يجب أن تتضمن الصور توثيقًا لتاريخ ووقت التقاطها.',
      'he':
          '3. טרם קבלת הרכב, על השוכר לצלם את הרכב, לרבות מבחוץ ופנים, ולשלוח תמונות אלו הן למייל הבעלים והן למייל המנהל: abodshah126@gmail.com . התמונות חייבות לכלול תיעוד של התאריך והשעה שבהן צולמו.',
    },
    'n215jei7': {
      'en':
          '4.  Failure to comply with any of the requirements stated in this Agreement, including but not limited to the proper return of the car or the submission of photographic documentation, will result in legal action against the Renter.',
      'ar':
          '4. يؤدي عدم الامتثال لأي من المتطلبات المنصوص عليها في هذه الاتفاقية، بما في ذلك على سبيل المثال لا الحصر الإرجاع السليم للسيارة أو تقديم الوثائق الفوتوغرافية، إلى اتخاذ إجراء قانوني ضد المستأجر.',
      'he':
          '4. אי עמידה באחת מהדרישות האמורות בהסכם זה, לרבות אך לא רק החזרה נאותה של הרכב או הגשת תיעוד מצולם, תגרור תביעה משפטית נגד השוכר.',
    },
    '40zamaqb': {
      'en': 'I Agree All The Rent Ruls ',
      'ar': 'أوافق على جميع قواعد الإيجار',
      'he': 'אני מסכים לכל חוקי השכירות',
    },
    '40xa9el9': {
      'en': 'Accpet the Agreemnt',
      'ar': 'قبول الاتفاقية',
      'he': 'קבל את ההסכם',
    },
    'wfaliury': {
      'en': 'Agreement',
      'ar': 'اتفاق',
      'he': 'הֶסכֵּם',
    },
    'ixa4x5nr': {
      'en': 'Home',
      'ar': 'بيت',
      'he': 'בַּיִת',
    },
  },
  // OrderDetailsOwner
  {
    'trkwu87m': {
      'en': 'Show Deatils',
      'ar': 'عرض التفاصيل',
      'he': 'הצג פרטים',
    },
    '11c4tca1': {
      'en': 'Call',
      'ar': 'يتصل',
      'he': 'שִׂיחָה',
    },
    'kmgx3gyo': {
      'en': 'Accpeted',
      'ar': 'مقبولة',
      'he': 'התקבל',
    },
    'a8b69ccd': {
      'en': 'Licence Error ',
      'ar': 'خطأ في الترخيص',
      'he': 'שגיאת רישיון',
    },
    'sybo5hq5': {
      'en': 'Order Details',
      'ar': 'تفاصيل الطلب',
      'he': 'פרטי הזמנה',
    },
    'w9ntat1o': {
      'en': 'Home',
      'ar': 'بيت',
      'he': 'בַּיִת',
    },
  },
  // FamilyCars
  {
    'ud8uxnmg': {
      'en': 'Family Cars Below',
      'ar': 'سيارات عائلية بالأسفل',
      'he': 'מכוניות משפחתיות למטה',
    },
    '1k9e9sga': {
      'en': 'Recent Added',
      'ar': 'الإضافات الحديثة',
      'he': 'לאחרונה נוספו',
    },
    'yramusw9': {
      'en': '',
      'ar': '',
      'he': '',
    },
    'bltscehk': {
      'en': 'Add Car',
      'ar': 'أضف سيارة',
      'he': 'הוסף רכב',
    },
    'd5retnrq': {
      'en': 'My Cars',
      'ar': 'سياراتي',
      'he': 'המכוניות שלי',
    },
    '2h9rs2mn': {
      'en': 'Profile',
      'ar': 'حساب تعريفي',
      'he': 'פּרוֹפִיל',
    },
    '5mn4xpwa': {
      'en': 'ContactUs',
      'ar': 'اتصل بنا',
      'he': 'צור קשר',
    },
    '2gx0hqqa': {
      'en': 'LogOut',
      'ar': 'تسجيل الخروج',
      'he': 'התנתק',
    },
    'a2b4frjq': {
      'en': 'Home',
      'ar': 'بيت',
      'he': 'בַּיִת',
    },
  },
  // OrderDetailsAdmin
  {
    'oh12ikog': {
      'en': 'Show Deatils',
      'ar': 'عرض التفاصيل',
      'he': 'הצג פרטים',
    },
    'kx0c1fht': {
      'en': 'Call',
      'ar': 'يتصل',
      'he': 'שִׂיחָה',
    },
    'v1lhf590': {
      'en': 'Order Details',
      'ar': 'تفاصيل الطلب',
      'he': 'פרטי הזמנה',
    },
    'jm1w5fjk': {
      'en': 'Home',
      'ar': 'بيت',
      'he': 'בַּיִת',
    },
  },
  // Reports
  {
    '97pj4dc0': {
      'en': 'Reports',
      'ar': 'التقارير',
      'he': 'דוחות',
    },
    '9z8to8qo': {
      'en': 'All The Reports Below',
      'ar': 'جميع التقارير أدناه',
      'he': 'כל הדיווחים למטה',
    },
    'ov92geg7': {
      'en': 'View',
      'ar': 'منظر',
      'he': 'נוֹף',
    },
    'e4o9wdpf': {
      'en': 'user@domainname.com',
      'ar': 'المستخدم@اسم المجال.com',
      'he': 'user@domainname.com',
    },
    'oc0vmqzp': {
      'en': 'View',
      'ar': 'منظر',
      'he': 'נוֹף',
    },
    'k9670hle': {
      'en': 'Username',
      'ar': 'اسم المستخدم',
      'he': 'שם משתמש',
    },
    '0t24i560': {
      'en': 'user@domainname.com',
      'ar': 'المستخدم@اسم المجال.com',
      'he': 'user@domainname.com',
    },
    '5z5xinku': {
      'en': 'View',
      'ar': 'منظر',
      'he': 'נוֹף',
    },
    '9ximaqky': {
      'en': 'Username',
      'ar': 'اسم المستخدم',
      'he': 'שם משתמש',
    },
    'wgvst0mi': {
      'en': 'user@domainname.com',
      'ar': 'المستخدم@اسم المجال.com',
      'he': 'user@domainname.com',
    },
    '23ua19y1': {
      'en': 'View',
      'ar': 'منظر',
      'he': 'נוֹף',
    },
    'geyf1b04': {
      'en': 'user@domainname.com',
      'ar': 'المستخدم@اسم المجال.com',
      'he': 'user@domainname.com',
    },
    'ldwtrx2e': {
      'en': 'View',
      'ar': 'منظر',
      'he': 'נוֹף',
    },
    '7hyvrzay': {
      'en': 'Home',
      'ar': 'بيت',
      'he': 'בַּיִת',
    },
  },
  // editprofile1
  {
    'evgl12vr': {
      'en': 'Edit Profile',
      'ar': 'تعديل الملف الشخصي',
      'he': 'ערוך פרופיל',
    },
    'd21czmvv': {
      'en': 'Below are your profile details',
      'ar': 'فيما يلي تفاصيل ملفك الشخصي',
      'he': 'להלן פרטי הפרופיל שלך',
    },
    'h3axxa0w': {
      'en': 'Your Name',
      'ar': 'اسمك',
      'he': 'שמך',
    },
    'ttryvaqs': {
      'en': 'PhoneNumber',
      'ar': 'رقم التليفون',
      'he': 'מספר טלפון',
    },
    'pjchzj9a': {
      'en': 'City',
      'ar': 'مدينة',
      'he': 'עִיר',
    },
    'pbtmrb0a': {
      'en': 'The email associated with this account is:',
      'ar': 'البريد الإلكتروني المرتبط بهذا الحساب هو:',
      'he': 'האימייל המשויך לחשבון זה הוא:',
    },
    't7uu8rvd': {
      'en': 'Created On:',
      'ar': 'تم الإنشاء في:',
      'he': 'נוצר בתאריך:',
    },
    'dum8ux7s': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'he': 'לְבַטֵל',
    },
    'ttsqd3ag': {
      'en': 'Save Changes',
      'ar': 'حفظ التغييرات',
      'he': 'שמור שינויים',
    },
  },
  // Detalisuser
  {
    'gww9bdvm': {
      'en': 'User Details',
      'ar': 'تفاصيل المستخدم',
      'he': 'פרטי משתמש',
    },
    'f2fjg1h1': {
      'en': 'Name:',
      'ar': 'اسم:',
      'he': 'שֵׁם:',
    },
    'hyodsdzb': {
      'en': 'Email:',
      'ar': 'بريد إلكتروني:',
      'he': 'אֶלֶקטרוֹנִי:',
    },
    'ub6vbi6a': {
      'en': 'Phone:',
      'ar': 'هاتف:',
      'he': 'טֵלֵפוֹן:',
    },
    'iebvcirm': {
      'en': 'ID:',
      'ar': 'بطاقة تعريف:',
      'he': 'תְעוּדַת זֶהוּת:',
    },
  },
  // MessageSend
  {
    '1sc9pr1w': {
      'en': 'Type here to respond...',
      'ar': 'اكتب هنا للرد...',
      'he': 'הקלד כאן כדי להגיב...',
    },
  },
  // PhoneNumberComp
  {
    'toyr7wii': {
      'en': 'Phone Number',
      'ar': 'رقم التليفون',
      'he': 'מספר טלפון',
    },
  },
  // PaymentForm
  {
    '136kv32x': {
      'en': 'Checkout',
      'ar': 'الدفع',
      'he': 'קופה',
    },
    'vuoz0t28': {
      'en': 'Fill in the information below to place your order.',
      'ar': 'قم بملء المعلومات أدناه لتقديم طلبك.',
      'he': 'מלא את הפרטים למטה כדי לבצע את ההזמנה שלך.',
    },
    '46xway41': {
      'en': 'Price Breakdown',
      'ar': 'تفاصيل السعر',
      'he': 'פירוט מחירים',
    },
    'rmvhauf7': {
      'en': 'Base Price',
      'ar': 'السعر الأساسي',
      'he': 'מחיר בסיס',
    },
    'qo59i9fx': {
      'en': '\$156.00',
      'ar': '156.00 دولار',
      'he': '\$156.00',
    },
    'phgceadg': {
      'en': 'Taxes',
      'ar': 'الضرائب',
      'he': 'מיסים',
    },
    '5popmdjs': {
      'en': '\$24.20',
      'ar': '24.20 دولار',
      'he': '\$24.20',
    },
    'yg2j3azy': {
      'en': 'Cleaning Fee',
      'ar': 'رسوم التنظيف',
      'he': 'דמי ניקיון',
    },
    'xti2y6a6': {
      'en': '\$40.00',
      'ar': '40.00 دولار',
      'he': '\$40.00',
    },
    'la1el4uy': {
      'en': 'Total',
      'ar': 'المجموع',
      'he': 'סַך הַכֹּל',
    },
    '6ei1eeif': {
      'en': '\$230.20',
      'ar': '230.20 دولار',
      'he': '\$230.20',
    },
    'd4ngsajl': {
      'en': 'Pay w/ Credit Card',
      'ar': 'الدفع باستخدام بطاقة الائتمان',
      'he': 'שלם עם כרטיס אשראי',
    },
    'a34xdpd2': {
      'en': 'Or use an option below',
      'ar': 'أو استخدم أحد الخيارات أدناه',
      'he': 'או השתמש באפשרות למטה',
    },
    'bbka1i73': {
      'en': 'Apple Pay',
      'ar': 'آبل باي',
      'he': 'Apple Pay',
    },
    '7ujqnsgm': {
      'en': 'Pay w/Paypal',
      'ar': 'الدفع عن طريق باي بال',
      'he': 'שלם עם פייפאל',
    },
  },
  // editCar
  {
    'a5g3lbiz': {
      'en': 'Edit Your Car',
      'ar': 'تعديل سيارتك',
      'he': 'ערוך את המכונית שלך',
    },
    'fcvjddae': {
      'en': 'Below are your Car details',
      'ar': 'فيما يلي تفاصيل سيارتك',
      'he': 'להלן פרטי הרכב שלך',
    },
    'o5bcbm3d': {
      'en': 'Change Photo',
      'ar': 'تغيير الصورة',
      'he': 'שנה תמונה',
    },
    'pnefb1ag': {
      'en': 'Price',
      'ar': 'سعر',
      'he': 'מְחִיר',
    },
    'j2dqsbmu': {
      'en': 'Avillable To ',
      'ar': 'متاح لـ',
      'he': 'זמינות ל',
    },
    'm3d3pjag': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'he': 'לְבַטֵל',
    },
    'vjeh22d5': {
      'en': 'Save Changes',
      'ar': 'حفظ التغييرات',
      'he': 'שמור שינויים',
    },
  },
  // Notifaction
  {
    '7405h25x': {
      'en': 'Are You Sure You Want to Change The Photo ? ',
      'ar': 'هل أنت متأكد أنك تريد تغيير الصورة؟',
      'he': 'האם אתה בטוח שאתה רוצה לשנות את התמונה?',
    },
  },
  // AvilableOptions
  {
    '2lsr2dz6': {
      'en': 'Avilable',
      'ar': 'متوفر',
      'he': 'זמין',
    },
    'xpyrzee4': {
      'en': 'Change the avilablity',
      'ar': 'تغيير التوفر',
      'he': 'שנה את הזמינות',
    },
    '2ttfjz3r': {
      'en': 'Avilable',
      'ar': 'متوفر',
      'he': 'זמין',
    },
    'j81t0muf': {
      'en': 'Not Avilable',
      'ar': 'غير متوفر',
      'he': 'לא זמין',
    },
    'faoy062x': {
      'en': 'Please select...',
      'ar': 'الرجاء الاختيار...',
      'he': 'אנא בחר...',
    },
    'cmfhlgaz': {
      'en': 'Search for an item...',
      'ar': 'البحث عن العنصر...',
      'he': 'חפש פריט...',
    },
  },
  // AddFunds
  {
    '0l84uhkj': {
      'en': 'Add Funds',
      'ar': 'إضافة الأموال',
      'he': 'הוסף כספים',
    },
    '3tueqxfr': {
      'en': 'Fill in the information below to Add To Your Funds',
      'ar': 'قم بملء المعلومات أدناه لإضافتها إلى أموالك',
      'he': 'מלא את המידע למטה כדי להוסיף לכספים שלך',
    },
    'hcxtn61n': {
      'en': 'Funds Here ..',
      'ar': 'الأموال هنا ..',
      'he': 'כספים כאן..',
    },
    'io7o9vrg': {
      'en': 'Price Breakdown',
      'ar': 'تفاصيل السعر',
      'he': 'פירוט מחירים',
    },
    '0ti4kfm1': {
      'en': 'Account Balance ',
      'ar': 'رصيد الحساب',
      'he': 'יתרת חשבון',
    },
    'kklsvbtq': {
      'en': 'Add With Credit Card',
      'ar': 'أضف باستخدام بطاقة الائتمان',
      'he': 'הוסף עם כרטיס אשראי',
    },
  },
  // ConfrimOrder
  {
    'c3p5pk09': {
      'en': 'Accept Order',
      'ar': 'قبول الطلب',
      'he': 'קבל הזמנה',
    },
    'rxkke38i': {
      'en': 'Change the Status',
      'ar': 'تغيير الحالة',
      'he': 'שנה את הסטטוס',
    },
  },
  // LanguageOptions
  {
    '52csvnfy': {
      'en': 'Options',
      'ar': 'خيارات',
      'he': 'אפשרויות',
    },
    'fbusuyax': {
      'en': 'English',
      'ar': 'إنجليزي',
      'he': 'אַנגְלִית',
    },
    'b8eqb4n6': {
      'en': 'Hebrew',
      'ar': 'العبرية',
      'he': 'עִברִית',
    },
    'y4mno4iv': {
      'en': 'Arabic',
      'ar': 'عربي',
      'he': 'עֲרָבִית',
    },
  },
  // AddLicence
  {
    'mcnsxphl': {
      'en': 'Add Licence Photo Please',
      'ar': 'يرجى إضافة صورة الترخيص',
      'he': 'הוסף תמונת רישיון בבקשה',
    },
    'vnh4xghk': {
      'en': 'Add Licence',
      'ar': 'إضافة الترخيص',
      'he': 'הוסף רישיון',
    },
    '0bf1xtqm': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'he': 'לְבַטֵל',
    },
    'qzx88dj8': {
      'en': 'Save Changes',
      'ar': 'حفظ التغييرات',
      'he': 'שמור שינויים',
    },
  },
  // AddImageprofile
  {
    'hij9s32q': {
      'en': 'Add profile Photo Please',
      'ar': 'أضف صورة الملف الشخصي من فضلك',
      'he': 'הוסף תמונת פרופיל בבקשה',
    },
    'thelsurz': {
      'en': 'Upload Photo',
      'ar': 'تحميل الصورة',
      'he': 'העלה תמונה',
    },
    'f4zzxn29': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'he': 'לְבַטֵל',
    },
    't4yhxxfw': {
      'en': 'Save Changes',
      'ar': 'حفظ التغييرات',
      'he': 'שמור שינויים',
    },
  },
  // Miscellaneous
  {
    'wy26wy7e': {
      'en': '',
      'ar': '',
      'he': '',
    },
    'ikqx7h6g': {
      'en': '',
      'ar': '',
      'he': '',
    },
    'f2dclc8t': {
      'en': '',
      'ar': 'قائمة البحث...',
      'he': 'חפש ברישום...',
    },
    'yf0sy3gh': {
      'en': '',
      'ar': '',
      'he': '',
    },
    '1dkwjb6t': {
      'en': '',
      'ar': '',
      'he': '',
    },
    'u7i8fvle': {
      'en': '',
      'ar': '',
      'he': '',
    },
    'qs94o7ya': {
      'en': '',
      'ar': '',
      'he': '',
    },
    'gje0unq3': {
      'en': '',
      'ar': '',
      'he': '',
    },
    'l61l3j02': {
      'en': '',
      'ar': '',
      'he': '',
    },
    'kyyuh8j9': {
      'en': '',
      'ar': '',
      'he': '',
    },
    'kr3lhaxs': {
      'en': '',
      'ar': '',
      'he': '',
    },
    'quddyag1': {
      'en': '',
      'ar': '',
      'he': '',
    },
    'p9zgk1fr': {
      'en': '',
      'ar': '',
      'he': '',
    },
    '5057c9yf': {
      'en': '',
      'ar': '',
      'he': '',
    },
    '0bd2yzyk': {
      'en': '',
      'ar': '',
      'he': '',
    },
    'p85hrawd': {
      'en': '',
      'ar': '',
      'he': '',
    },
    '24kdeyb9': {
      'en': '',
      'ar': '',
      'he': '',
    },
    '82x24x8v': {
      'en': '',
      'ar': '',
      'he': '',
    },
    'mu6wi6gc': {
      'en': '',
      'ar': '',
      'he': '',
    },
    '59uohwe2': {
      'en': '',
      'ar': '',
      'he': '',
    },
    '5hjijfuj': {
      'en': '',
      'ar': '',
      'he': '',
    },
    'u4uh1ifs': {
      'en': '',
      'ar': '',
      'he': '',
    },
    'wjxmv022': {
      'en': '',
      'ar': '',
      'he': '',
    },
    '3o1s8b8w': {
      'en': '',
      'ar': '',
      'he': '',
    },
    'z9jt91ei': {
      'en': '',
      'ar': '',
      'he': '',
    },
    'h8yvixth': {
      'en': '',
      'ar': '',
      'he': '',
    },
    'vs0pb9df': {
      'en': '',
      'ar': '',
      'he': '',
    },
  },
].reduce((a, b) => a..addAll(b));
