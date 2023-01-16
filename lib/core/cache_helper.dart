import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

int bookmarkedAyah = 1;
int bookmarkedSura = 1;
bool fabIsClicked = true;

final ItemScrollController itemScrollController = ItemScrollController();
final ItemPositionsListener itemPositionsListener =
    ItemPositionsListener.create();

String arabicFont = 'quran';
double arabicFontSize = 28;

bool view = true;

Uri quranAppUrl = Uri.parse(
    'https://www.mediafire.com/file/lbu5hc4ryxztfzo/Quran-Karim.apk/file');

Future saveSettings() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setInt('arabicFontSize', arabicFontSize.toInt());
}

Future getSettings() async {
  try {
    final prefs = await SharedPreferences.getInstance();
    arabicFontSize = prefs.getInt('arabicFontSize')!.toDouble();
  } catch (_) {
    arabicFontSize = 28;
  }
}

Future saveIsMushaf() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('view', view);
}

Future getIsMushaf() async {
  try {
    final prefs = await SharedPreferences.getInstance();
    view = prefs.getBool('view')!;
  } catch (_) {
    view = true;
  }
}

saveBookMark(surah, ayah) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setInt("surah", surah);
  await prefs.setInt("ayah", ayah);
}

readBookmark() async {
  final prefs = await SharedPreferences.getInstance();
  try {
    bookmarkedAyah = prefs.getInt('ayah')!;
    bookmarkedSura = prefs.getInt('surah')!;
    return true;
  } catch (e) {
    return false;
  }
}
