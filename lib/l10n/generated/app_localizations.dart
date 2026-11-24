import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_fr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('fr'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In fr, this message translates to:
  /// **'Florian Bergmann'**
  String get appTitle;

  /// No description provided for @tabHome.
  ///
  /// In fr, this message translates to:
  /// **'Accueil'**
  String get tabHome;

  /// No description provided for @tabJourney.
  ///
  /// In fr, this message translates to:
  /// **'Parcours'**
  String get tabJourney;

  /// No description provided for @tabProjects.
  ///
  /// In fr, this message translates to:
  /// **'Projets'**
  String get tabProjects;

  /// No description provided for @tabProfile.
  ///
  /// In fr, this message translates to:
  /// **'Profil'**
  String get tabProfile;

  /// No description provided for @settingsTooltip.
  ///
  /// In fr, this message translates to:
  /// **'Réglages'**
  String get settingsTooltip;

  /// No description provided for @back.
  ///
  /// In fr, this message translates to:
  /// **'Retour'**
  String get back;

  /// No description provided for @externalLink.
  ///
  /// In fr, this message translates to:
  /// **'Lien externe'**
  String get externalLink;

  /// No description provided for @homeKicker.
  ///
  /// In fr, this message translates to:
  /// **'Portfolio'**
  String get homeKicker;

  /// No description provided for @homeContactMe.
  ///
  /// In fr, this message translates to:
  /// **'Me contacter'**
  String get homeContactMe;

  /// No description provided for @homeSeeProjects.
  ///
  /// In fr, this message translates to:
  /// **'Voir les projets'**
  String get homeSeeProjects;

  /// No description provided for @homeStack.
  ///
  /// In fr, this message translates to:
  /// **'Stack principale'**
  String get homeStack;

  /// No description provided for @homePersonalKicker.
  ///
  /// In fr, this message translates to:
  /// **'Projets perso'**
  String get homePersonalKicker;

  /// No description provided for @homeClientKicker.
  ///
  /// In fr, this message translates to:
  /// **'En entreprise'**
  String get homeClientKicker;

  /// No description provided for @seeAllPersonal.
  ///
  /// In fr, this message translates to:
  /// **'Voir tous les projets perso →'**
  String get seeAllPersonal;

  /// No description provided for @seeAllClient.
  ///
  /// In fr, this message translates to:
  /// **'Voir tous les projets en entreprise →'**
  String get seeAllClient;

  /// No description provided for @projectCount.
  ///
  /// In fr, this message translates to:
  /// **'{count, plural, =0{Aucun projet} =1{1 projet} other{{count} projets}}'**
  String projectCount(int count);

  /// No description provided for @contactKicker.
  ///
  /// In fr, this message translates to:
  /// **'Contact'**
  String get contactKicker;

  /// No description provided for @contactTitleLine1.
  ///
  /// In fr, this message translates to:
  /// **'Un projet, une question ?'**
  String get contactTitleLine1;

  /// No description provided for @contactTitleLine2.
  ///
  /// In fr, this message translates to:
  /// **'Écrivez-moi.'**
  String get contactTitleLine2;

  /// No description provided for @journeyKicker.
  ///
  /// In fr, this message translates to:
  /// **'Parcours'**
  String get journeyKicker;

  /// No description provided for @journeyTitleLine1.
  ///
  /// In fr, this message translates to:
  /// **'Expériences'**
  String get journeyTitleLine1;

  /// No description provided for @journeyTitleLine2.
  ///
  /// In fr, this message translates to:
  /// **'& formation'**
  String get journeyTitleLine2;

  /// No description provided for @filterLabel.
  ///
  /// In fr, this message translates to:
  /// **'Filtrer'**
  String get filterLabel;

  /// No description provided for @filterAll.
  ///
  /// In fr, this message translates to:
  /// **'Tout'**
  String get filterAll;

  /// No description provided for @filterJobs.
  ///
  /// In fr, this message translates to:
  /// **'Emplois'**
  String get filterJobs;

  /// No description provided for @filterEducation.
  ///
  /// In fr, this message translates to:
  /// **'Formation'**
  String get filterEducation;

  /// No description provided for @kindJob.
  ///
  /// In fr, this message translates to:
  /// **'Emploi'**
  String get kindJob;

  /// No description provided for @kindEducation.
  ///
  /// In fr, this message translates to:
  /// **'Formation'**
  String get kindEducation;

  /// No description provided for @periodSince.
  ///
  /// In fr, this message translates to:
  /// **'depuis {start}'**
  String periodSince(String start);

  /// No description provided for @periodToday.
  ///
  /// In fr, this message translates to:
  /// **'aujourd\'hui'**
  String get periodToday;

  /// No description provided for @labelPeriod.
  ///
  /// In fr, this message translates to:
  /// **'Période'**
  String get labelPeriod;

  /// No description provided for @labelDuration.
  ///
  /// In fr, this message translates to:
  /// **'Durée'**
  String get labelDuration;

  /// No description provided for @durationYears.
  ///
  /// In fr, this message translates to:
  /// **'{count, plural, =1{1 an} other{{count} ans}}'**
  String durationYears(int count);

  /// No description provided for @durationMonths.
  ///
  /// In fr, this message translates to:
  /// **'{count, plural, =1{1 mois} other{{count} mois}}'**
  String durationMonths(int count);

  /// No description provided for @sectionTasks.
  ///
  /// In fr, this message translates to:
  /// **'Tâches'**
  String get sectionTasks;

  /// No description provided for @sectionTech.
  ///
  /// In fr, this message translates to:
  /// **'Technos'**
  String get sectionTech;

  /// No description provided for @sectionLinkedProjects.
  ///
  /// In fr, this message translates to:
  /// **'Projets liés'**
  String get sectionLinkedProjects;

  /// No description provided for @projectsKicker.
  ///
  /// In fr, this message translates to:
  /// **'Réalisations'**
  String get projectsKicker;

  /// No description provided for @projectGroupsLabel.
  ///
  /// In fr, this message translates to:
  /// **'Type de projets'**
  String get projectGroupsLabel;

  /// No description provided for @tabPersonal.
  ///
  /// In fr, this message translates to:
  /// **'Personnels'**
  String get tabPersonal;

  /// No description provided for @tabClient.
  ///
  /// In fr, this message translates to:
  /// **'Entreprise'**
  String get tabClient;

  /// No description provided for @personalTitleLine1.
  ///
  /// In fr, this message translates to:
  /// **'Projets'**
  String get personalTitleLine1;

  /// No description provided for @personalTitleLine2.
  ///
  /// In fr, this message translates to:
  /// **'personnels'**
  String get personalTitleLine2;

  /// No description provided for @clientTitleLine1.
  ///
  /// In fr, this message translates to:
  /// **'Projets'**
  String get clientTitleLine1;

  /// No description provided for @clientTitleLine2.
  ///
  /// In fr, this message translates to:
  /// **'en entreprise'**
  String get clientTitleLine2;

  /// No description provided for @noProjects.
  ///
  /// In fr, this message translates to:
  /// **'Aucun projet pour l\'instant.'**
  String get noProjects;

  /// No description provided for @projectPersonalKicker.
  ///
  /// In fr, this message translates to:
  /// **'Projet perso {number}'**
  String projectPersonalKicker(String number);

  /// No description provided for @projectKindWebsite.
  ///
  /// In fr, this message translates to:
  /// **'Site web'**
  String get projectKindWebsite;

  /// No description provided for @projectKindScript.
  ///
  /// In fr, this message translates to:
  /// **'Script'**
  String get projectKindScript;

  /// No description provided for @projectKindApp.
  ///
  /// In fr, this message translates to:
  /// **'App'**
  String get projectKindApp;

  /// No description provided for @projectStatusOnline.
  ///
  /// In fr, this message translates to:
  /// **'En ligne'**
  String get projectStatusOnline;

  /// No description provided for @projectStatusInProgress.
  ///
  /// In fr, this message translates to:
  /// **'En cours'**
  String get projectStatusInProgress;

  /// No description provided for @projectStatusArchived.
  ///
  /// In fr, this message translates to:
  /// **'Archivé'**
  String get projectStatusArchived;

  /// No description provided for @sectionHighlights.
  ///
  /// In fr, this message translates to:
  /// **'Points clés'**
  String get sectionHighlights;

  /// No description provided for @sectionUsage.
  ///
  /// In fr, this message translates to:
  /// **'Utilisation'**
  String get sectionUsage;

  /// No description provided for @sectionContext.
  ///
  /// In fr, this message translates to:
  /// **'Contexte'**
  String get sectionContext;

  /// No description provided for @personalProject.
  ///
  /// In fr, this message translates to:
  /// **'Projet personnel'**
  String get personalProject;

  /// No description provided for @visitWebsite.
  ///
  /// In fr, this message translates to:
  /// **'Voir le site'**
  String get visitWebsite;

  /// No description provided for @copy.
  ///
  /// In fr, this message translates to:
  /// **'Copier'**
  String get copy;

  /// No description provided for @copied.
  ///
  /// In fr, this message translates to:
  /// **'Copié'**
  String get copied;

  /// No description provided for @copyCommand.
  ///
  /// In fr, this message translates to:
  /// **'Copier la commande'**
  String get copyCommand;

  /// No description provided for @profileKicker.
  ///
  /// In fr, this message translates to:
  /// **'À propos'**
  String get profileKicker;

  /// No description provided for @sectionSkills.
  ///
  /// In fr, this message translates to:
  /// **'Compétences'**
  String get sectionSkills;

  /// No description provided for @levelTop.
  ///
  /// In fr, this message translates to:
  /// **'Actuel'**
  String get levelTop;

  /// No description provided for @levelMid.
  ///
  /// In fr, this message translates to:
  /// **'Récent'**
  String get levelMid;

  /// No description provided for @levelBottom.
  ///
  /// In fr, this message translates to:
  /// **'Plus ancien'**
  String get levelBottom;

  /// No description provided for @personalOnlyLegend.
  ///
  /// In fr, this message translates to:
  /// **'Projets perso uniquement'**
  String get personalOnlyLegend;

  /// No description provided for @sectionCertificates.
  ///
  /// In fr, this message translates to:
  /// **'Certificats'**
  String get sectionCertificates;

  /// No description provided for @sectionLanguages.
  ///
  /// In fr, this message translates to:
  /// **'Langues'**
  String get sectionLanguages;

  /// No description provided for @sectionHobbies.
  ///
  /// In fr, this message translates to:
  /// **'Loisirs'**
  String get sectionHobbies;

  /// No description provided for @sectionContact.
  ///
  /// In fr, this message translates to:
  /// **'Contact'**
  String get sectionContact;

  /// No description provided for @settingsKicker.
  ///
  /// In fr, this message translates to:
  /// **'Réglages'**
  String get settingsKicker;

  /// No description provided for @settingsTitleLine1.
  ///
  /// In fr, this message translates to:
  /// **'Préférences'**
  String get settingsTitleLine1;

  /// No description provided for @settingsTitleLine2.
  ///
  /// In fr, this message translates to:
  /// **'de l\'application'**
  String get settingsTitleLine2;

  /// No description provided for @sectionLanguage.
  ///
  /// In fr, this message translates to:
  /// **'Langue'**
  String get sectionLanguage;

  /// No description provided for @languageSystem.
  ///
  /// In fr, this message translates to:
  /// **'Langue du système'**
  String get languageSystem;

  /// No description provided for @sectionTheme.
  ///
  /// In fr, this message translates to:
  /// **'Thème'**
  String get sectionTheme;

  /// No description provided for @themeSystem.
  ///
  /// In fr, this message translates to:
  /// **'Thème du système'**
  String get themeSystem;

  /// No description provided for @themeLight.
  ///
  /// In fr, this message translates to:
  /// **'Clair'**
  String get themeLight;

  /// No description provided for @themeDark.
  ///
  /// In fr, this message translates to:
  /// **'Sombre'**
  String get themeDark;

  /// No description provided for @sectionData.
  ///
  /// In fr, this message translates to:
  /// **'Données'**
  String get sectionData;

  /// No description provided for @lastSync.
  ///
  /// In fr, this message translates to:
  /// **'Dernière synchronisation'**
  String get lastSync;

  /// No description provided for @never.
  ///
  /// In fr, this message translates to:
  /// **'Jamais'**
  String get never;

  /// No description provided for @refreshNow.
  ///
  /// In fr, this message translates to:
  /// **'Actualiser maintenant'**
  String get refreshNow;

  /// No description provided for @refreshing.
  ///
  /// In fr, this message translates to:
  /// **'Actualisation…'**
  String get refreshing;

  /// No description provided for @sectionAbout.
  ///
  /// In fr, this message translates to:
  /// **'À propos'**
  String get sectionAbout;

  /// No description provided for @version.
  ///
  /// In fr, this message translates to:
  /// **'Version'**
  String get version;

  /// No description provided for @website.
  ///
  /// In fr, this message translates to:
  /// **'Site web'**
  String get website;

  /// No description provided for @licenses.
  ///
  /// In fr, this message translates to:
  /// **'Licences'**
  String get licenses;

  /// No description provided for @offlineBanner.
  ///
  /// In fr, this message translates to:
  /// **'Hors ligne · données du {date} à {time}'**
  String offlineBanner(String date, String time);

  /// No description provided for @retry.
  ///
  /// In fr, this message translates to:
  /// **'Réessayer'**
  String get retry;

  /// No description provided for @loading.
  ///
  /// In fr, this message translates to:
  /// **'Chargement…'**
  String get loading;

  /// No description provided for @errorKicker.
  ///
  /// In fr, this message translates to:
  /// **'Erreur'**
  String get errorKicker;

  /// No description provided for @errorTitleLine1.
  ///
  /// In fr, this message translates to:
  /// **'Impossible de charger'**
  String get errorTitleLine1;

  /// No description provided for @errorTitleLine2.
  ///
  /// In fr, this message translates to:
  /// **'le contenu.'**
  String get errorTitleLine2;

  /// No description provided for @errorNetwork.
  ///
  /// In fr, this message translates to:
  /// **'Vérifiez votre connexion. Le contenu reste disponible hors ligne après un premier chargement réussi.'**
  String get errorNetwork;

  /// No description provided for @errorServer.
  ///
  /// In fr, this message translates to:
  /// **'Le serveur est momentanément indisponible. Réessayez dans un instant.'**
  String get errorServer;

  /// No description provided for @errorInvalid.
  ///
  /// In fr, this message translates to:
  /// **'La réponse du serveur est inattendue. Mettez l\'application à jour si le problème persiste.'**
  String get errorInvalid;

  /// No description provided for @errorNotFound.
  ///
  /// In fr, this message translates to:
  /// **'Ce contenu n\'existe pas ou plus.'**
  String get errorNotFound;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'fr':
      return AppLocalizationsFr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
