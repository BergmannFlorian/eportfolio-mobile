// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Florian Bergmann';

  @override
  String get tabHome => 'Home';

  @override
  String get tabJourney => 'Journey';

  @override
  String get tabProjects => 'Projects';

  @override
  String get tabProfile => 'Profile';

  @override
  String get settingsTooltip => 'Settings';

  @override
  String get back => 'Back';

  @override
  String get externalLink => 'External link';

  @override
  String get homeKicker => 'Portfolio';

  @override
  String get homeContactMe => 'Contact me';

  @override
  String get homeSeeProjects => 'See projects';

  @override
  String get homeStack => 'Main stack';

  @override
  String get homePersonalKicker => 'Personal work';

  @override
  String get homeClientKicker => 'Professional work';

  @override
  String get seeAllPersonal => 'See all personal projects →';

  @override
  String get seeAllClient => 'See all professional projects →';

  @override
  String projectCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count projects',
      one: '1 project',
      zero: 'No projects',
    );
    return '$_temp0';
  }

  @override
  String get contactKicker => 'Contact';

  @override
  String get contactTitleLine1 => 'A project, a question?';

  @override
  String get contactTitleLine2 => 'Write to me.';

  @override
  String get journeyKicker => 'Journey';

  @override
  String get journeyTitleLine1 => 'Experience';

  @override
  String get journeyTitleLine2 => '& education';

  @override
  String get filterLabel => 'Filter';

  @override
  String get filterAll => 'All';

  @override
  String get filterJobs => 'Jobs';

  @override
  String get filterEducation => 'Education';

  @override
  String get kindJob => 'Job';

  @override
  String get kindEducation => 'Education';

  @override
  String periodSince(String start) {
    return 'since $start';
  }

  @override
  String get periodToday => 'today';

  @override
  String get labelPeriod => 'Period';

  @override
  String get labelDuration => 'Duration';

  @override
  String durationYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count years',
      one: '1 year',
    );
    return '$_temp0';
  }

  @override
  String durationMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count months',
      one: '1 month',
    );
    return '$_temp0';
  }

  @override
  String get sectionTasks => 'Tasks';

  @override
  String get sectionTech => 'Tech';

  @override
  String get sectionLinkedProjects => 'Related projects';

  @override
  String get projectsKicker => 'Work';

  @override
  String get projectGroupsLabel => 'Project type';

  @override
  String get tabPersonal => 'Personal';

  @override
  String get tabClient => 'Professional';

  @override
  String get personalTitleLine1 => 'Personal';

  @override
  String get personalTitleLine2 => 'projects';

  @override
  String get clientTitleLine1 => 'Professional';

  @override
  String get clientTitleLine2 => 'projects';

  @override
  String get noProjects => 'No projects yet.';

  @override
  String projectPersonalKicker(String number) {
    return 'Personal project $number';
  }

  @override
  String get projectKindWebsite => 'Website';

  @override
  String get projectKindScript => 'Script';

  @override
  String get projectKindApp => 'App';

  @override
  String get projectStatusOnline => 'Online';

  @override
  String get projectStatusInProgress => 'In progress';

  @override
  String get projectStatusArchived => 'Archived';

  @override
  String get sectionHighlights => 'Highlights';

  @override
  String get sectionUsage => 'Usage';

  @override
  String get sectionContext => 'Context';

  @override
  String get personalProject => 'Personal project';

  @override
  String get visitWebsite => 'Visit website';

  @override
  String get copy => 'Copy';

  @override
  String get copied => 'Copied';

  @override
  String get copyCommand => 'Copy the command';

  @override
  String get profileKicker => 'About';

  @override
  String get sectionSkills => 'Skills';

  @override
  String get levelTop => 'Current';

  @override
  String get levelMid => 'Recent';

  @override
  String get levelBottom => 'Older';

  @override
  String get personalOnlyLegend => 'Personal projects only';

  @override
  String get sectionCertificates => 'Certificates';

  @override
  String get sectionLanguages => 'Languages';

  @override
  String get sectionHobbies => 'Hobbies';

  @override
  String get sectionContact => 'Contact';

  @override
  String get settingsKicker => 'Settings';

  @override
  String get settingsTitleLine1 => 'App';

  @override
  String get settingsTitleLine2 => 'preferences';

  @override
  String get sectionLanguage => 'Language';

  @override
  String get languageSystem => 'System language';

  @override
  String get sectionTheme => 'Theme';

  @override
  String get themeSystem => 'System theme';

  @override
  String get themeLight => 'Light';

  @override
  String get themeDark => 'Dark';

  @override
  String get sectionData => 'Data';

  @override
  String get lastSync => 'Last sync';

  @override
  String get never => 'Never';

  @override
  String get refreshNow => 'Refresh now';

  @override
  String get refreshing => 'Refreshing…';

  @override
  String get sectionAbout => 'About';

  @override
  String get version => 'Version';

  @override
  String get website => 'Website';

  @override
  String get licenses => 'Licenses';

  @override
  String offlineBanner(String date, String time) {
    return 'Offline · data from $date, $time';
  }

  @override
  String get retry => 'Retry';

  @override
  String get loading => 'Loading…';

  @override
  String get errorKicker => 'Error';

  @override
  String get errorTitleLine1 => 'Couldn\'t load';

  @override
  String get errorTitleLine2 => 'the content.';

  @override
  String get errorNetwork =>
      'Check your connection. Content stays available offline after a first successful load.';

  @override
  String get errorServer =>
      'The server is temporarily unavailable. Try again in a moment.';

  @override
  String get errorInvalid =>
      'The server sent an unexpected response. Update the app if the problem persists.';

  @override
  String get errorNotFound => 'This content doesn\'t exist (anymore).';
}
