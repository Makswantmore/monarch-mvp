import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences? prefs;
  try {
    prefs = await SharedPreferences.getInstance();
  } catch (_) {
    prefs = null;
  }

  final state = AppState(prefs: prefs);
  await state.load();

  runApp(
    AppScope(
      notifier: state,
      child: const FinanceApp(),
    ),
  );
}

enum AppLanguage {
  en,
  ru,
  zh,
  ja,
}

extension AppLanguageExtension on AppLanguage {
  Locale get locale {
    switch (this) {
      case AppLanguage.en:
        return const Locale('en');
      case AppLanguage.ru:
        return const Locale('ru');
      case AppLanguage.zh:
        return const Locale('zh');
      case AppLanguage.ja:
        return const Locale('ja');
    }
  }

  String get code {
    switch (this) {
      case AppLanguage.en:
        return 'en';
      case AppLanguage.ru:
        return 'ru';
      case AppLanguage.zh:
        return 'zh';
      case AppLanguage.ja:
        return 'ja';
    }
  }

  String get labelKey {
    switch (this) {
      case AppLanguage.en:
        return 'english';
      case AppLanguage.ru:
        return 'russian';
      case AppLanguage.zh:
        return 'chinese';
      case AppLanguage.ja:
        return 'japanese';
    }
  }
}

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    final localization =
        Localizations.of<AppLocalizations>(context, AppLocalizations);
    assert(localization != null, 'AppLocalizations not found');
    return localization!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  String t(String key) {
    final languageCode = locale.languageCode;
    final values = _values[languageCode] ?? _values['en'];
    final value = values?[key];
    if (value != null) {
      return value;
    }
    return _values['en']?[key] ?? key;
  }

  static final Map<String, Map<String, String>> _values = {
    'en': {
      'appName': 'Monarch MVP',
      'dashboard': 'Dashboard',
      'transactions': 'Transactions',
      'budgets': 'Budgets',
      'settings': 'Settings',
      'netWorth': 'Net Worth',
      'income': 'Income',
      'expenses': 'Expenses',
      'balance': 'Balance',
      'accounts': 'Accounts',
      'recentTransactions': 'Recent Transactions',
      'addTransaction': 'Add Transaction',
      'title': 'Title',
      'amount': 'Amount',
      'category': 'Category',
      'account': 'Account',
      'date': 'Date',
      'save': 'Save',
      'cancel': 'Cancel',
      'delete': 'Delete',
      'type': 'Type',
      'expense': 'Expense',
      'all': 'All',
      'noTransactions': 'No transactions yet',
      'addFirstTransaction': 'Add your first transaction',
      'monthlyBudget': 'Monthly Budget',
      'spent': 'Spent',
      'remaining': 'Remaining',
      'overBudget': 'Over budget',
      'withinBudget': 'Within budget',
      'theme': 'Theme',
      'light': 'Light',
      'dark': 'Dark',
      'system': 'System',
      'language': 'Language',
      'english': 'English',
      'russian': 'Русский',
      'chinese': '中文',
      'japanese': '日本語',
      'about': 'About',
      'aboutText':
          'A minimal cross-platform personal finance MVP built with Flutter.',
      'confirmDelete': 'Delete this transaction?',
      'yes': 'Yes',
      'no': 'No',
      'salary': 'Salary',
      'food': 'Food',
      'transport': 'Transport',
      'housing': 'Housing',
      'entertainment': 'Entertainment',
      'health': 'Health',
      'shopping': 'Shopping',
      'other': 'Other',
      'rent': 'Rent',
      'groceries': 'Groceries',
      'fuel': 'Fuel',
      'movieNight': 'Movie night',
      'pharmacy': 'Pharmacy',
      'clothes': 'Clothes',
      'freelanceBonus': 'Freelance bonus',
      'checking': 'Checking',
      'savings': 'Savings',
      'creditCard': 'Credit Card',
      'cash': 'Cash',
      'investment': 'Investment',
      'total': 'Total',
      'topCategories': 'Top Categories',
      'currentMonth': 'Current Month',
      'welcome': 'Welcome back',
      'overview': 'Overview',
      'editBudget': 'Edit Budget',
      'limit': 'Limit',
      'invalidAmount': 'Enter a valid amount',
      'required': 'Required',
      'savingsRate': 'Savings rate',
      'assets': 'Assets',
      'liabilities': 'Liabilities',
      'added': 'Added',
      'deleted': 'Deleted',
      'chooseDate': 'Choose date',
      'transactionType': 'Transaction type',
      'monthlyLimit': 'Monthly limit',
      'progress': 'Progress',
      'of': 'of',
      'left': 'left',
      'used': 'used',
      'exceeded': 'exceeded',
      'onTrack': 'On track',
      'comingSoon': 'Coming soon',
      'notImplemented': 'Not implemented in MVP',
      'version': 'Version',
      'versionValue': '0.1.0',
      'localization': 'Localization',
      'localizationText': 'English, Russian, Chinese, Japanese',
      'themePreview': 'Theme preview',
      'add': 'Add',
    },
    'ru': {
      'appName': 'Monarch MVP',
      'dashboard': 'Панель',
      'transactions': 'Транзакции',
      'budgets': 'Бюджеты',
      'settings': 'Настройки',
      'netWorth': 'Чистые активы',
      'income': 'Доходы',
      'expenses': 'Расходы',
      'balance': 'Баланс',
      'accounts': 'Счета',
      'recentTransactions': 'Последние операции',
      'addTransaction': 'Добавить операцию',
      'title': 'Название',
      'amount': 'Сумма',
      'category': 'Категория',
      'account': 'Счёт',
      'date': 'Дата',
      'save': 'Сохранить',
      'cancel': 'Отмена',
      'delete': 'Удалить',
      'type': 'Тип',
      'expense': 'Расход',
      'all': 'Все',
      'noTransactions': 'Операций пока нет',
      'addFirstTransaction': 'Добавьте первую операцию',
      'monthlyBudget': 'Месячный бюджет',
      'spent': 'Потрачено',
      'remaining': 'Осталось',
      'overBudget': 'Превышен бюджет',
      'withinBudget': 'В пределах бюджета',
      'theme': 'Тема',
      'light': 'Светлая',
      'dark': 'Тёмная',
      'system': 'Системная',
      'language': 'Язык',
      'english': 'English',
      'russian': 'Русский',
      'chinese': '中文',
      'japanese': '日本語',
      'about': 'О приложении',
      'aboutText':
          'Минимальное кроссплатформенное MVP для личных финансов на Flutter.',
      'confirmDelete': 'Удалить эту операцию?',
      'yes': 'Да',
      'no': 'Нет',
      'salary': 'Зарплата',
      'food': 'Еда',
      'transport': 'Транспорт',
      'housing': 'Жильё',
      'entertainment': 'Развлечения',
      'health': 'Здоровье',
      'shopping': 'Покупки',
      'other': 'Прочее',
      'rent': 'Аренда',
      'groceries': 'Продукты',
      'fuel': 'Топливо',
      'movieNight': 'Кино',
      'pharmacy': 'Аптека',
      'clothes': 'Одежда',
      'freelanceBonus': 'Бонус за фриланс',
      'checking': 'Текущий счёт',
      'savings': 'Накопительный',
      'creditCard': 'Кредитная карта',
      'cash': 'Наличные',
      'investment': 'Инвестиции',
      'total': 'Итого',
      'topCategories': 'Топ категорий',
      'currentMonth': 'Текущий месяц',
      'welcome': 'С возвращением',
      'overview': 'Обзор',
      'editBudget': 'Изменить бюджет',
      'limit': 'Лимит',
      'invalidAmount': 'Введите корректную сумму',
      'required': 'Обязательно',
      'savingsRate': 'Норма сбережений',
      'assets': 'Активы',
      'liabilities': 'Обязательства',
      'added': 'Добавлено',
      'deleted': 'Удалено',
      'chooseDate': 'Выберите дату',
      'transactionType': 'Тип операции',
      'monthlyLimit': 'Месячный лимит',
      'progress': 'Прогресс',
      'of': 'из',
      'left': 'осталось',
      'used': 'использовано',
      'exceeded': 'превышено',
      'onTrack': 'В графике',
      'comingSoon': 'Скоро',
      'notImplemented': 'Не реализовано в MVP',
      'version': 'Версия',
      'versionValue': '0.1.0',
      'localization': 'Локализация',
      'localizationText': 'Английский, русский, китайский, японский',
      'themePreview': 'Предпросмотр темы',
      'add': 'Добавить',
    },
    'zh': {
      'appName': 'Monarch MVP',
      'dashboard': '仪表盘',
      'transactions': '交易',
      'budgets': '预算',
      'settings': '设置',
      'netWorth': '净资产',
      'income': '收入',
      'expenses': '支出',
      'balance': '余额',
      'accounts': '账户',
      'recentTransactions': '最近交易',
      'addTransaction': '添加交易',
      'title': '标题',
      'amount': '金额',
      'category': '类别',
      'account': '账户',
      'date': '日期',
      'save': '保存',
      'cancel': '取消',
      'delete': '删除',
      'type': '类型',
      'expense': '支出',
      'all': '全部',
      'noTransactions': '暂无交易',
      'addFirstTransaction': '添加第一笔交易',
      'monthlyBudget': '月度预算',
      'spent': '已花费',
      'remaining': '剩余',
      'overBudget': '超出预算',
      'withinBudget': '预算内',
      'theme': '主题',
      'light': '浅色',
      'dark': '深色',
      'system': '跟随系统',
      'language': '语言',
      'english': 'English',
      'russian': 'Русский',
      'chinese': '中文',
      'japanese': '日本語',
      'about': '关于',
      'aboutText': '使用 Flutter 构建的极简跨平台个人财务 MVP。',
      'confirmDelete': '删除这笔交易？',
      'yes': '是',
      'no': '否',
      'salary': '工资',
      'food': '餐饮',
      'transport': '交通',
      'housing': '住房',
      'entertainment': '娱乐',
      'health': '健康',
      'shopping': '购物',
      'other': '其他',
      'rent': '房租',
      'groceries': '食品杂货',
      'fuel': '燃油',
      'movieNight': '电影之夜',
      'pharmacy': '药店',
      'clothes': '衣物',
      'freelanceBonus': '自由职业奖金',
      'checking': '支票账户',
      'savings': '储蓄账户',
      'creditCard': '信用卡',
      'cash': '现金',
      'investment': '投资',
      'total': '总计',
      'topCategories': '热门类别',
      'currentMonth': '本月',
      'welcome': '欢迎回来',
      'overview': '概览',
      'editBudget': '编辑预算',
      'limit': '限额',
      'invalidAmount': '请输入有效金额',
      'required': '必填',
      'savingsRate': '储蓄率',
      'assets': '资产',
      'liabilities': '负债',
      'added': '已添加',
      'deleted': '已删除',
      'chooseDate': '选择日期',
      'transactionType': '交易类型',
      'monthlyLimit': '月度限额',
      'progress': '进度',
      'of': '共',
      'left': '剩余',
      'used': '已用',
      'exceeded': '超出',
      'onTrack': '正常',
      'comingSoon': '即将推出',
      'notImplemented': 'MVP 中未实现',
      'version': '版本',
      'versionValue': '0.1.0',
      'localization': '本地化',
      'localizationText': '英语、俄语、中文、日语',
      'themePreview': '主题预览',
      'add': '添加',
    },
    'ja': {
      'appName': 'Monarch MVP',
      'dashboard': 'ダッシュボード',
      'transactions': '取引',
      'budgets': '予算',
      'settings': '設定',
      'netWorth': '純資産',
      'income': '収入',
      'expenses': '支出',
      'balance': '残高',
      'accounts': 'アカウント',
      'recentTransactions': '最近の取引',
      'addTransaction': '取引を追加',
      'title': 'タイトル',
      'amount': '金額',
      'category': 'カテゴリ',
      'account': 'アカウント',
      'date': '日付',
      'save': '保存',
      'cancel': 'キャンセル',
      'delete': '削除',
      'type': 'タイプ',
      'expense': '支出',
      'all': 'すべて',
      'noTransactions': '取引がありません',
      'addFirstTransaction': '最初の取引を追加',
      'monthlyBudget': '月次予算',
      'spent': '使用額',
      'remaining': '残り',
      'overBudget': '予算超過',
      'withinBudget': '予算内',
      'theme': 'テーマ',
      'light': 'ライト',
      'dark': 'ダーク',
      'system': 'システム',
      'language': '言語',
      'english': 'English',
      'russian': 'Русский',
      'chinese': '中文',
      'japanese': '日本語',
      'about': '情報',
      'aboutText':
          'Flutter で構築された最小限のクロスプラットフォーム個人財務 MVP です。',
      'confirmDelete': 'この取引を削除しますか？',
      'yes': 'はい',
      'no': 'いいえ',
      'salary': '給与',
      'food': '食費',
      'transport': '交通費',
      'housing': '住居費',
      'entertainment': '娯楽',
      'health': '健康',
      'shopping': '買い物',
      'other': 'その他',
      'rent': '家賃',
      'groceries': '食料品',
      'fuel': '燃料',
      'movieNight': '映画',
      'pharmacy': '薬局',
      'clothes': '服',
      'freelanceBonus': 'フリーランスボーナス',
      'checking': '当座預金',
      'savings': '普通預金',
      'creditCard': 'クレジットカード',
      'cash': '現金',
      'investment': '投資',
      'total': '合計',
      'topCategories': '主要カテゴリ',
      'currentMonth': '今月',
      'welcome': 'おかえりなさい',
      'overview': '概要',
      'editBudget': '予算を編集',
      'limit': '上限',
      'invalidAmount': '有効な金額を入力してください',
      'required': '必須',
      'savingsRate': '貯蓄率',
      'assets': '資産',
      'liabilities': '負債',
      'added': '追加しました',
      'deleted': '削除しました',
      'chooseDate': '日付を選択',
      'transactionType': '取引タイプ',
      'monthlyLimit': '月次上限',
      'progress': '進捗',
      'of': 'のうち',
      'left': '残り',
      'used': '使用済み',
      'exceeded': '超過',
      'onTrack': '順調',
      'comingSoon': '近日公開',
      'notImplemented': 'MVP では未実装',
      'version': 'バージョン',
      'versionValue': '0.1.0',
      'localization': 'ローカライズ',
      'localizationText': '英語、ロシア語、中国語、日本語',
      'themePreview': 'テーマプレビュー',
      'add': '追加',
    },
  };
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return const ['en', 'ru', 'zh', 'ja'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) {
    return false;
  }
}

class AppTheme {
  static ThemeData get light => _build(Brightness.light);
  static ThemeData get dark => _build(Brightness.dark);

  static ThemeData _build(Brightness brightness) {
    final scheme = ColorScheme.fromSeed(
      seedColor: const Color(0xFF2E6BE6),
      brightness: brightness,
    );
    final isLight = brightness == Brightness.light;

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor:
          isLight ? const Color(0xFFF6F7FB) : const Color(0xFF0F1115),
      appBarTheme: AppBarTheme(
        centerTitle: false,
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: scheme.onSurface,
        titleTextStyle: TextStyle(
          color: scheme.onSurface,
          fontSize: 22,
          fontWeight: FontWeight.w700,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: isLight ? Colors.white : const Color(0xFF151923),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: scheme.outlineVariant),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: scheme.primary, width: 2),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ),
      ),
      dividerTheme: DividerThemeData(
        color: scheme.outlineVariant,
        space: 1,
        thickness: 1,
      ),
      listTileTheme: ListTileThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
    );
  }
}

class TransactionType {
  static const String income = 'income';
  static const String expense = 'expense';
}

class FinanceAccount {
  final String id;
  final String nameKey;
  final double balance;
  final bool isAsset;

  const FinanceAccount({
    required this.id,
    required this.nameKey,
    required this.balance,
    required this.isAsset,
  });
}

class Transaction {
  final String id;
  final DateTime date;
  final String title;
  final String? titleKey;
  final double amount;
  final String categoryId;
  final String accountId;
  final String type;

  const Transaction({
    required this.id,
    required this.date,
    required this.title,
    this.titleKey,
    required this.amount,
    required this.categoryId,
    required this.accountId,
    required this.type,
  });
}

class Category {
  final String id;
  final String nameKey;

  const Category({
    required this.id,
    required this.nameKey,
  });
}

class AppState extends ChangeNotifier {
  final SharedPreferences? prefs;

  AppState({this.prefs});

  ThemeMode _themeMode = ThemeMode.system;
  ThemeMode get themeMode => _themeMode;

  AppLanguage _language = AppLanguage.en;
  AppLanguage get language => _language;

  final List<FinanceAccount> _accounts = <FinanceAccount>[];
  List<FinanceAccount> get accounts =>
      List<FinanceAccount>.unmodifiable(_accounts);

  final List<Transaction> _transactions = <Transaction>[];
  List<Transaction> get transactions =>
      List<Transaction>.unmodifiable(_transactions);

  final List<Category> _categories = <Category>[];
  List<Category> get categories => List<Category>.unmodifiable(_categories);

  final Map<String, double> _budgetLimits = <String, double>{};
  Map<String, double> get budgetLimits =>
      Map<String, double>.unmodifiable(_budgetLimits);

  Future<void> load() async {
    final themeValue = prefs?.getString('themeMode');
    _themeMode = _themeModeFromString(themeValue);

    final languageValue = prefs?.getString('language');
    _language = _languageFromString(languageValue);

    _initSampleData();
    notifyListeners();
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    _themeMode = mode;
    await prefs?.setString('themeMode', _themeModeToString(mode));
    notifyListeners();
  }

  Future<void> setLanguage(AppLanguage language) async {
    _language = language;
    await prefs?.setString('language', language.code);
    notifyListeners();
  }

  void addTransaction(Transaction transaction) {
    _transactions.insert(0, transaction);
    notifyListeners();
  }

  void deleteTransaction(String id) {
    _transactions.removeWhere((t) => t.id == id);
    notifyListeners();
  }

  void setBudgetLimit(String categoryId, double limit) {
    if (limit <= 0) {
      _budgetLimits.remove(categoryId);
    } else {
      _budgetLimits[categoryId] = limit;
    }
    notifyListeners();
  }

  double get netWorth {
    double total = 0;
    for (final account in _accounts) {
      total += account.balance;
    }
    return total;
  }

  double get totalAssets {
    double total = 0;
    for (final account in _accounts) {
      if (account.isAsset) {
        total += account.balance;
      }
    }
    return total;
  }

  double get totalLiabilities {
    double total = 0;
    for (final account in _accounts) {
      if (!account.isAsset) {
        total += account.balance.abs();
      }
    }
    return total;
  }

  List<Transaction> get currentMonthTransactions {
    final now = DateTime.now();
    return _transactions
        .where(
          (t) => t.date.year == now.year && t.date.month == now.month,
        )
        .toList();
  }

  double get currentIncome {
    double total = 0;
    for (final t in currentMonthTransactions) {
      if (t.type == TransactionType.income) {
        total += t.amount;
      }
    }
    return total;
  }

  double get currentExpenses {
    double total = 0;
    for (final t in currentMonthTransactions) {
      if (t.type == TransactionType.expense) {
        total += t.amount;
      }
    }
    return total;
  }

  double get savingsRate {
    final income = currentIncome;
    if (income <= 0) {
      return 0;
    }
    final rate = (income - currentExpenses) / income;
    if (rate < 0) {
      return 0;
    }
    if (rate > 1) {
      return 1;
    }
    return rate;
  }

  double spentForCategory(String categoryId) {
    double total = 0;
    for (final t in currentMonthTransactions) {
      if (t.type == TransactionType.expense && t.categoryId == categoryId) {
        total += t.amount;
      }
    }
    return total;
  }

  void _initSampleData() {
    if (_accounts.isNotEmpty) {
      return;
    }

    _accounts.addAll([
      const FinanceAccount(
        id: 'checking',
        nameKey: 'checking',
        balance: 5200.00,
        isAsset: true,
      ),
      const FinanceAccount(
        id: 'savings',
        nameKey: 'savings',
        balance: 18000.00,
        isAsset: true,
      ),
      const FinanceAccount(
        id: 'investment',
        nameKey: 'investment',
        balance: 7500.00,
        isAsset: true,
      ),
      const FinanceAccount(
        id: 'credit_card',
        nameKey: 'creditCard',
        balance: -1200.00,
        isAsset: false,
      ),
      const FinanceAccount(
        id: 'cash',
        nameKey: 'cash',
        balance: 150.00,
        isAsset: true,
      ),
    ]);

    _categories.addAll(const [
      Category(id: 'salary', nameKey: 'salary'),
      Category(id: 'food', nameKey: 'food'),
      Category(id: 'transport', nameKey: 'transport'),
      Category(id: 'housing', nameKey: 'housing'),
      Category(id: 'entertainment', nameKey: 'entertainment'),
      Category(id: 'health', nameKey: 'health'),
      Category(id: 'shopping', nameKey: 'shopping'),
      Category(id: 'other', nameKey: 'other'),
    ]);

    _budgetLimits.addAll({
      'food': 600.0,
      'transport': 200.0,
      'entertainment': 250.0,
      'shopping': 400.0,
      'health': 200.0,
      'housing': 1500.0,
    });

    final now = DateTime.now();

    _transactions.addAll([
      Transaction(
        id: 't1',
        date: DateTime(now.year, now.month, 1),
        title: 'Monthly salary',
        titleKey: 'salary',
        amount: 4200.00,
        categoryId: 'salary',
        accountId: 'checking',
        type: TransactionType.income,
      ),
      Transaction(
        id: 't2',
        date: DateTime(now.year, now.month, 2),
        title: 'Rent',
        titleKey: 'rent',
        amount: 1400.00,
        categoryId: 'housing',
        accountId: 'checking',
        type: TransactionType.expense,
      ),
      Transaction(
        id: 't3',
        date: DateTime(now.year, now.month, 3),
        title: 'Groceries',
        titleKey: 'groceries',
        amount: 126.40,
        categoryId: 'food',
        accountId: 'credit_card',
        type: TransactionType.expense,
      ),
      Transaction(
        id: 't4',
        date: DateTime(now.year, now.month, 4),
        title: 'Fuel',
        titleKey: 'fuel',
        amount: 62.00,
        categoryId: 'transport',
        accountId: 'credit_card',
        type: TransactionType.expense,
      ),
      Transaction(
        id: 't5',
        date: DateTime(now.year, now.month, 5),
        title: 'Movie night',
        titleKey: 'movieNight',
        amount: 34.50,
        categoryId: 'entertainment',
        accountId: 'cash',
        type: TransactionType.expense,
      ),
      Transaction(
        id: 't6',
        date: DateTime(now.year, now.month, 6),
        title: 'Pharmacy',
        titleKey: 'pharmacy',
        amount: 48.20,
        categoryId: 'health',
        accountId: 'checking',
        type: TransactionType.expense,
      ),
      Transaction(
        id: 't7',
        date: DateTime(now.year, now.month, 7),
        title: 'Clothes',
        titleKey: 'clothes',
        amount: 89.99,
        categoryId: 'shopping',
        accountId: 'credit_card',
        type: TransactionType.expense,
      ),
      Transaction(
        id: 't8',
        date: DateTime(now.year, now.month, 8),
        title: 'Freelance bonus',
        titleKey: 'freelanceBonus',
        amount: 350.00,
        categoryId: 'salary',
        accountId: 'checking',
        type: TransactionType.income,
      ),
    ]);
  }

  ThemeMode _themeModeFromString(String? value) {
    switch (value) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      case 'system':
      default:
        return ThemeMode.system;
    }
  }

  String _themeModeToString(ThemeMode mode) {
    switch (mode) {
      case ThemeMode.light:
        return 'light';
      case ThemeMode.dark:
        return 'dark';
      case ThemeMode.system:
        return 'system';
    }
  }

  AppLanguage _languageFromString(String? value) {
    switch (value) {
      case 'ru':
        return AppLanguage.ru;
      case 'zh':
        return AppLanguage.zh;
      case 'ja':
        return AppLanguage.ja;
      case 'en':
      default:
        return AppLanguage.en;
    }
  }
}

class AppScope extends InheritedNotifier<AppState> {
  const AppScope({
    super.key,
    required AppState notifier,
    required Widget child,
  }) : super(notifier: notifier, child: child);

  static AppState of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<AppScope>();
    assert(scope != null, 'AppScope not found in widget tree');
    return scope!.notifier!;
  }
}

class FinanceApp extends StatelessWidget {
  const FinanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    final state = AppScope.of(context);

    return MaterialApp(
      title: 'Monarch MVP',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: state.themeMode,
      locale: state.language.locale,
      supportedLocales: AppLanguage.values.map((e) => e.locale).toList(),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: const HomeShell(),
    );
  }
}


class HomeShell extends StatefulWidget {
  const HomeShell({super.key});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);

    final pages = <Widget>[
      const DashboardPage(),
      const TransactionsPage(),
      const BudgetsPage(),
      const SettingsPage(),
    ];

    final labels = <String>[
      l.t('dashboard'),
      l.t('transactions'),
      l.t('budgets'),
      l.t('settings'),
    ];

    final icons = <IconData>[
      Icons.dashboard_outlined,
      Icons.receipt_long_outlined,
      Icons.pie_chart_outline,
      Icons.settings_outlined,
    ];

    final selectedIcons = <IconData>[
      Icons.dashboard,
      Icons.receipt_long,
      Icons.pie_chart,
      Icons.settings,
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 800;

        if (isWide) {
          return Scaffold(
            body: Row(
              children: [
                NavigationRail(
                  selectedIndex: _selectedIndex,
                  onDestinationSelected: (index) {
                    setState(() => _selectedIndex = index);
                  },
                  labelType: NavigationRailLabelType.all,
                  destinations: [
                    NavigationRailDestination(
                      icon: Icon(icons[0]),
                      selectedIcon: Icon(selectedIcons[0]),
                      label: Text(labels[0]),
                    ),
                    NavigationRailDestination(
                      icon: Icon(icons[1]),
                      selectedIcon: Icon(selectedIcons[1]),
                      label: Text(labels[1]),
                    ),
                    NavigationRailDestination(
                      icon: Icon(icons[2]),
                      selectedIcon: Icon(selectedIcons[2]),
                      label: Text(labels[2]),
                    ),
                    NavigationRailDestination(
                      icon: Icon(icons[3]),
                      selectedIcon: Icon(selectedIcons[3]),
                      label: Text(labels[3]),
                    ),
                  ],
                ),
                const VerticalDivider(width: 1),
                Expanded(
                  child: IndexedStack(
                    index: _selectedIndex,
                    children: pages,
                  ),
                ),
              ],
            ),
          );
        }

        return Scaffold(
          body: IndexedStack(
            index: _selectedIndex,
            children: pages,
          ),
          bottomNavigationBar: NavigationBar(
            selectedIndex: _selectedIndex,
            onDestinationSelected: (index) {
              setState(() => _selectedIndex = index);
            },
            destinations: [
              NavigationDestination(
                icon: Icon(icons[0]),
                selectedIcon: Icon(selectedIcons[0]),
                label: labels[0],
              ),
              NavigationDestination(
                icon: Icon(icons[1]),
                selectedIcon: Icon(selectedIcons[1]),
                label: labels[1],
              ),
              NavigationDestination(
                icon: Icon(icons[2]),
                selectedIcon: Icon(selectedIcons[2]),
                label: labels[2],
              ),
              NavigationDestination(
                icon: Icon(icons[3]),
                selectedIcon: Icon(selectedIcons[3]),
                label: labels[3],
              ),
            ],
          ),
        );
      },
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final state = AppScope.of(context);
    final l = AppLocalizations.of(context);
    final recent = state.transactions.take(5).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(l.t('dashboard')),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            l.t('welcome'),
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 12),
          _NetWorthCard(
            netWorth: state.netWorth,
            income: state.currentIncome,
            expenses: state.currentExpenses,
          ),
          const SizedBox(height: 16),
          _SummaryRow(
            income: state.currentIncome,
            expenses: state.currentExpenses,
            savingsRate: state.savingsRate,
          ),
          const SizedBox(height: 24),
          _SectionHeader(title: l.t('accounts')),
          const SizedBox(height: 8),
          ...state.accounts.map(
            (account) => _AccountTile(account: account),
          ),
          const SizedBox(height: 24),
          _SectionHeader(title: l.t('recentTransactions')),
          const SizedBox(height: 8),
          if (recent.isEmpty)
            _EmptyState(message: l.t('noTransactions'))
          else
            ...recent.map(
              (t) => _TransactionTile(transaction: t),
            ),
        ],
      ),
    );
  }
}

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({super.key});

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  String _filter = 'all';

  @override
  Widget build(BuildContext context) {
    final state = AppScope.of(context);
    final l = AppLocalizations.of(context);

    final filtered = state.transactions.where((t) {
      if (_filter == TransactionType.income) {
        return t.type == TransactionType.income;
      }
      if (_filter == TransactionType.expense) {
        return t.type == TransactionType.expense;
      }
      return true;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(l.t('transactions')),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (_) => AddTransactionSheet(state: state),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ChoiceChip(
                  selected: _filter == 'all',
                  onSelected: (_) => setState(() => _filter = 'all'),
                  label: Text(l.t('all')),
                ),
                ChoiceChip(
                  selected: _filter == TransactionType.income,
                  onSelected: (_) =>
                      setState(() => _filter = TransactionType.income),
                  label: Text(l.t('income')),
                ),
                ChoiceChip(
                  selected: _filter == TransactionType.expense,
                  onSelected: (_) =>
                      setState(() => _filter = TransactionType.expense),
                  label: Text(l.t('expense')),
                ),
              ],
            ),
          ),
          Expanded(
            child: filtered.isEmpty
                ? _EmptyState(
                    message: l.t('noTransactions'),
                    action: state.transactions.isEmpty
                        ? FilledButton.icon(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (_) =>
                                    AddTransactionSheet(state: state),
                              );
                            },
                            icon: const Icon(Icons.add),
                            label: Text(l.t('addFirstTransaction')),
                          )
                        : null,
                  )
                : ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: filtered.length,
                    separatorBuilder: (_, index) => const SizedBox(height: 8),
                    itemBuilder: (BuildContext itemContext, int index) {
                      final t = filtered[index];

                      return Dismissible(
                        key: ValueKey<String>(t.id),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 20),
                          decoration: BoxDecoration(
                            color: Theme.of(itemContext).colorScheme.errorContainer,
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Icon(
                            Icons.delete,
                            color: Theme.of(itemContext).colorScheme.onErrorContainer,
                          ),
                        ),
                        onDismissed: (_) {
                          final messenger = ScaffoldMessenger.of(itemContext);
                          final message = l.t('deleted');
                          state.deleteTransaction(t.id);
                          messenger.showSnackBar(
                            SnackBar(content: Text(message)),
                          );
                        },
                        child: _TransactionTile(
                          transaction: t,
                          showDelete: true,
                          onDelete: () async {
                            final confirmed = await showDialog<bool>(
                              context: context,
                              builder: (dialogContext) => AlertDialog(
                                title: Text(l.t('delete')),
                                content: Text(l.t('confirmDelete')),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(dialogContext, false),
                                    child: Text(l.t('no')),
                                  ),
                                  FilledButton(
                                    onPressed: () =>
                                        Navigator.pop(dialogContext, true),
                                    child: Text(l.t('yes')),
                                  ),
                                ],
                              ),
                            );

                            if (confirmed == true && mounted) {
                              state.deleteTransaction(t.id);
                              ScaffoldMessenger.of(this.context).showSnackBar(
                                SnackBar(content: Text(l.t('deleted'))),
                              );
                            }
                          },
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class AddTransactionSheet extends StatefulWidget {
  final AppState state;

  const AddTransactionSheet({
    super.key,
    required this.state,
  });

  @override
  State<AddTransactionSheet> createState() => _AddTransactionSheetState();
}

class _AddTransactionSheetState extends State<AddTransactionSheet> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  String _type = TransactionType.expense;
  String _categoryId = 'food';
  String _accountId = 'checking';
  DateTime _date = DateTime.now();

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Padding(
      padding: EdgeInsets.fromLTRB(16, 16, 16, 24 + bottomInset),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                l.t('addTransaction'),
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  ChoiceChip(
                    selected: _type == TransactionType.expense,
                    onSelected: (_) =>
                        setState(() => _type = TransactionType.expense),
                    label: Text(l.t('expense')),
                  ),
                  ChoiceChip(
                    selected: _type == TransactionType.income,
                    onSelected: (_) =>
                        setState(() => _type = TransactionType.income),
                    label: Text(l.t('income')),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: l.t('title')),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return l.t('required');
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _amountController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  labelText: l.t('amount'),
                  hintText: '0.00',
                ),
                validator: (value) {
                  final parsed =
                      double.tryParse((value ?? '').replaceAll(',', '.'));
                  if (parsed == null || parsed <= 0) {
                    return l.t('invalidAmount');
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              InputDecorator(
                decoration: InputDecoration(labelText: l.t('category')),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _categoryId,
                    isExpanded: true,
                    items: widget.state.categories
                        .map(
                          (c) => DropdownMenuItem<String>(
                            value: c.id,
                            child: Text(l.t(c.nameKey)),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      if (value != null) {
                        setState(() => _categoryId = value);
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(height: 12),
              InputDecorator(
                decoration: InputDecoration(labelText: l.t('account')),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _accountId,
                    isExpanded: true,
                    items: widget.state.accounts
                        .map(
                          (a) => DropdownMenuItem<String>(
                            value: a.id,
                            child: Text(l.t(a.nameKey)),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      if (value != null) {
                        setState(() => _accountId = value);
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(height: 12),
              OutlinedButton.icon(
                onPressed: () async {
                  final picked = await showDatePicker(
                    context: context,
                    initialDate: _date,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (picked != null) {
                    setState(() => _date = picked);
                  }
                },
                icon: const Icon(Icons.calendar_today),
                label: Text('${l.t('date')}: ${_formatDate(_date)}'),
              ),
              const SizedBox(height: 20),
              FilledButton(
                onPressed: _submit,
                child: Text(l.t('save')),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submit() {
    final l = AppLocalizations.of(context);

    if (!_formKey.currentState!.validate()) {
      return;
    }

    final amount = double.tryParse(_amountController.text.replaceAll(',', '.'));
    if (amount == null || amount <= 0) {
      return;
    }

    final transaction = Transaction(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      date: _date,
      title: _titleController.text.trim(),
      amount: amount,
      categoryId: _categoryId,
      accountId: _accountId,
      type: _type,
    );

    widget.state.addTransaction(transaction);

    final messenger = ScaffoldMessenger.of(context);
    final message = l.t('added');

    Navigator.of(context).pop();

    messenger.showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}

class BudgetsPage extends StatelessWidget {
  const BudgetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final state = AppScope.of(context);
    final l = AppLocalizations.of(context);

    final expenseCategories =
        state.categories.where((c) => c.id != 'salary').toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(l.t('budgets')),
      ),
      body: expenseCategories.isEmpty
          ? _EmptyState(message: l.t('noTransactions'))
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: expenseCategories.length,
              separatorBuilder: (_, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final category = expenseCategories[index];
                final limit = state.budgetLimits[category.id] ?? 0.0;
                final spent = state.spentForCategory(category.id);

                return _BudgetCard(
                  category: category,
                  limit: limit,
                  spent: spent,
                  onEdit: () {
                    _showBudgetDialog(context, state, l, category);
                  },
                );
              },
            ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final state = AppScope.of(context);
    final l = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l.t('settings')),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _SettingsCard(
            title: l.t('theme'),
            icon: Icons.palette_outlined,
            child: DropdownButton<ThemeMode>(
              value: state.themeMode,
              isExpanded: true,
              underline: const SizedBox.shrink(),
              items: [
                DropdownMenuItem<ThemeMode>(
                  value: ThemeMode.system,
                  child: Text(l.t('system')),
                ),
                DropdownMenuItem<ThemeMode>(
                  value: ThemeMode.light,
                  child: Text(l.t('light')),
                ),
                DropdownMenuItem<ThemeMode>(
                  value: ThemeMode.dark,
                  child: Text(l.t('dark')),
                ),
              ],
              onChanged: (value) {
                if (value != null) {
                  state.setThemeMode(value);
                }
              },
            ),
          ),
          const SizedBox(height: 12),
          _SettingsCard(
            title: l.t('language'),
            icon: Icons.translate,
            child: DropdownButton<AppLanguage>(
              value: state.language,
              isExpanded: true,
              underline: const SizedBox.shrink(),
              items: AppLanguage.values
                  .map(
                    (lang) => DropdownMenuItem<AppLanguage>(
                      value: lang,
                      child: Text(l.t(lang.labelKey)),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                if (value != null) {
                  state.setLanguage(value);
                }
              },
            ),
          ),
          const SizedBox(height: 12),
          _SettingsCard(
            title: l.t('about'),
            icon: Icons.info_outline,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(l.t('aboutText')),
                const SizedBox(height: 12),
                _SettingRow(
                  label: l.t('version'),
                  value: l.t('versionValue'),
                ),
                const SizedBox(height: 8),
                _SettingRow(
                  label: l.t('localization'),
                  value: l.t('localizationText'),
                ),
                const SizedBox(height: 8),
                _SettingRow(
                  label: l.t('themePreview'),
                  value: _themeModeLabel(state.themeMode, l),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _NetWorthCard extends StatelessWidget {
  final double netWorth;
  final double income;
  final double expenses;

  const _NetWorthCard({
    required this.netWorth,
    required this.income,
    required this.expenses,
  });

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final scheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [scheme.primary, scheme.secondary],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l.t('netWorth'),
            style: TextStyle(
              color: scheme.onPrimary,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            formatMoney(netWorth),
            style: TextStyle(
              color: scheme.onPrimary,
              fontSize: 34,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _GradientStat(
                  label: l.t('income'),
                  value: formatMoney(income),
                  icon: Icons.arrow_upward,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _GradientStat(
                  label: l.t('expenses'),
                  value: formatMoney(expenses),
                  icon: Icons.arrow_downward,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _GradientStat extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const _GradientStat({
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: scheme.onPrimary,
            size: 18,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: scheme.onPrimary,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: TextStyle(
                    color: scheme.onPrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final double income;
  final double expenses;
  final double savingsRate;

  const _SummaryRow({
    required this.income,
    required this.expenses,
    required this.savingsRate,
  });

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);

    return Row(
      children: [
        Expanded(
          child: _MetricCard(
            label: l.t('income'),
            value: formatMoney(income),
            icon: Icons.arrow_upward,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _MetricCard(
            label: l.t('expenses'),
            value: formatMoney(expenses),
            icon: Icons.arrow_downward,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _MetricCard(
            label: l.t('savingsRate'),
            value: '${(savingsRate * 100).toStringAsFixed(0)}%',
            icon: Icons.savings,
          ),
        ),
      ],
    );
  }
}

class _MetricCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final Color? color;

  const _MetricCard({
    required this.label,
    required this.value,
    required this.icon,
  }) : color = null;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final accent = color ?? scheme.primary;
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: scheme.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: accent,
                size: 20,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  label,
                  style: Theme.of(context).textTheme.labelMedium,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            value,
            style: (titleStyle ?? const TextStyle(fontSize: 20))
                .copyWith(fontWeight: FontWeight.w700),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final String? actionText;
  final VoidCallback? onAction;

  const _SectionHeader({
    required this.title,
    this.actionText,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.titleMedium;

         return Row(
            children: [
              Expanded(
                 child: Text(
                 title,
            style: (style ?? const TextStyle(fontSize: 16))
                .copyWith(fontWeight: FontWeight.w700),
                        ),
               ),
              if (actionText != null)
             TextButton(
                onPressed: onAction,
               child: Text(actionText!),
          ),
      ],
    );
  }
}

class _AccountTile extends StatelessWidget {
  final FinanceAccount account;

  const _AccountTile({required this.account});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final scheme = Theme.of(context).colorScheme;
    final color = account.balance >= 0 ? _successColor : scheme.error;

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: scheme.outlineVariant),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: scheme.secondaryContainer,
            foregroundColor: scheme.onSecondaryContainer,
            child: Icon(accountIcon(account.id)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l.t(account.nameKey),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 2),
                Text(
                  account.isAsset ? l.t('assets') : l.t('liabilities'),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: scheme.onSurfaceVariant,
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Text(
            formatMoney(account.balance),
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

class _TransactionTile extends StatelessWidget {
  final Transaction transaction;
  final bool showDelete;
  final VoidCallback? onDelete;

  const _TransactionTile({
    required this.transaction,
    this.showDelete = false,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final scheme = Theme.of(context).colorScheme;
    final isIncome = transaction.type == TransactionType.income;
    final signedAmount = isIncome ? transaction.amount : -transaction.amount;
    final color = isIncome ? _successColor : scheme.error;
    final displayTitle = transaction.titleKey != null
        ? l.t(transaction.titleKey!)
        : transaction.title;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: scheme.outlineVariant),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: scheme.secondaryContainer,
            foregroundColor: scheme.onSecondaryContainer,
            child: Icon(categoryIcon(transaction.categoryId)),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  displayTitle,
                  style: Theme.of(context).textTheme.titleSmall,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  '${l.t(transaction.categoryId)} • ${_formatDate(transaction.date)}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: scheme.onSurfaceVariant,
                      ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Text(
            formatMoney(signedAmount),
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w700,
            ),
          ),
          if (showDelete)
            IconButton(
              onPressed: onDelete,
              icon: Icon(
                Icons.delete_outline,
                color: scheme.error,
              ),
            ),
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  final String message;
  final IconData icon;
  final Widget? action;

  const _EmptyState({
    required this.message,
    this.action,
  }) : icon = Icons.inbox_outlined;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 56,
              color: scheme.outline,
            ),
            const SizedBox(height: 12),
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            if (action != null) ...[
              const SizedBox(height: 16),
              action!,
            ],
          ],
        ),
      ),
    );
  }
}

class _BudgetCard extends StatelessWidget {
  final Category category;
  final double limit;
  final double spent;
  final VoidCallback onEdit;

  const _BudgetCard({
    required this.category,
    required this.limit,
    required this.spent,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    final scheme = Theme.of(context).colorScheme;
    final hasLimit = limit > 0;
    final over = hasLimit && spent > limit;

    double progress = 0;
    if (hasLimit) {
      progress = spent / limit;
      if (progress > 1) {
        progress = 1;
      }
    }

    final color = over ? scheme.error : scheme.primary;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: scheme.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: scheme.secondaryContainer,
                foregroundColor: scheme.onSecondaryContainer,
                child: Icon(categoryIcon(category.id)),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l.t(category.nameKey),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      hasLimit
                          ? '${l.t('spent')}: ${formatMoney(spent)} ${l.t('of')} ${formatMoney(limit)}'
                          : l.t('monthlyLimit'),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: scheme.onSurfaceVariant,
                          ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: onEdit,
                icon: const Icon(Icons.edit_outlined),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: hasLimit ? progress : 0,
              minHeight: 10,
              backgroundColor: scheme.secondaryContainer,
              valueColor: AlwaysStoppedAnimation<Color>(color),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Text(
                  over
                      ? l.t('exceeded')
                      : (hasLimit
                          ? '${l.t('left')}: ${formatMoney(limit - spent)}'
                          : l.t('comingSoon')),
                  style: TextStyle(
                    color: over ? scheme.error : scheme.onSurfaceVariant,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              if (hasLimit)
                Text(
                  '${(progress * 100).toStringAsFixed(0)}%',
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.w700,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SettingsCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget child;

  const _SettingsCard({
    required this.title,
    required this.icon,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: scheme.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: scheme.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: scheme.primary,
              ),
              const SizedBox(width: 10),
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          const SizedBox(height: 14),
          child,
        ],
      ),
    );
  }
}

class _SettingRow extends StatelessWidget {
  final String label;
  final String value;

  const _SettingRow({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: TextStyle(color: scheme.onSurfaceVariant),
          ),
        ),
        const SizedBox(width: 12),
        Flexible(
          child: Text(
            value,
            textAlign: TextAlign.right,
            style: const TextStyle(fontWeight: FontWeight.w600),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

Future<void> _showBudgetDialog(
  BuildContext context,
  AppState state,
  AppLocalizations l,
  Category category,
) async {
  final controller = TextEditingController(
    text: state.budgetLimits[category.id]?.toStringAsFixed(2) ?? '',
  );

  final result = await showDialog<double>(
    context: context,
    builder: (dialogContext) => AlertDialog(
      title: Text('${l.t('editBudget')}: ${l.t(category.nameKey)}'),
      content: TextField(
        controller: controller,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(
          labelText: l.t('monthlyLimit'),
          hintText: '0.00',
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(dialogContext),
          child: Text(l.t('cancel')),
        ),
        FilledButton(
          onPressed: () {
            final parsed = double.tryParse(controller.text.replaceAll(',', '.'));
            Navigator.pop(dialogContext, parsed ?? 0.0);
          },
          child: Text(l.t('save')),
        ),
      ],
    ),
  );

  controller.dispose();

  if (result != null) {
    state.setBudgetLimit(category.id, result);
  }
}

const Color _successColor = Color(0xFF16A34A);

String formatMoney(double value) {
  final sign = value < 0 ? '-' : '';
  return '$sign\$${value.abs().toStringAsFixed(2)}';
}

IconData categoryIcon(String id) {
  switch (id) {
    case 'salary':
      return Icons.savings;
    case 'food':
      return Icons.restaurant;
    case 'transport':
      return Icons.directions_car;
    case 'housing':
      return Icons.home;
    case 'entertainment':
      return Icons.movie;
    case 'health':
      return Icons.medical_services;
    case 'shopping':
      return Icons.shopping_bag;
    case 'other':
    default:
      return Icons.category;
  }
}

IconData accountIcon(String id) {
  switch (id) {
    case 'checking':
      return Icons.account_balance;
    case 'savings':
      return Icons.lock;
    case 'credit_card':
      return Icons.credit_card;
    case 'cash':
      return Icons.payments;
    case 'investment':
      return Icons.trending_up;
    default:
      return Icons.wallet;
  }
}

String _formatDate(DateTime date) {
  final day = date.day.toString().padLeft(2, '0');
  final month = date.month.toString().padLeft(2, '0');
  return '$day.$month.${date.year}';
}

String _themeModeLabel(ThemeMode mode, AppLocalizations l) {
  switch (mode) {
    case ThemeMode.system:
      return l.t('system');
    case ThemeMode.light:
      return l.t('light');
    case ThemeMode.dark:
      return l.t('dark');
  }
}