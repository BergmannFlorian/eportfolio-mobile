// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Florian Bergmann';

  @override
  String get tabHome => 'Accueil';

  @override
  String get tabJourney => 'Parcours';

  @override
  String get tabProjects => 'Projets';

  @override
  String get tabProfile => 'Profil';

  @override
  String get settingsTooltip => 'Réglages';

  @override
  String get back => 'Retour';

  @override
  String get externalLink => 'Lien externe';

  @override
  String get homeKicker => 'Portfolio';

  @override
  String get homeContactMe => 'Me contacter';

  @override
  String get homeSeeProjects => 'Voir les projets';

  @override
  String get homeStack => 'Stack principale';

  @override
  String get homePersonalKicker => 'Projets perso';

  @override
  String get homeClientKicker => 'En entreprise';

  @override
  String get seeAllPersonal => 'Voir tous les projets perso →';

  @override
  String get seeAllClient => 'Voir tous les projets en entreprise →';

  @override
  String projectCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count projets',
      one: '1 projet',
      zero: 'Aucun projet',
    );
    return '$_temp0';
  }

  @override
  String get contactKicker => 'Contact';

  @override
  String get contactTitleLine1 => 'Un projet, une question ?';

  @override
  String get contactTitleLine2 => 'Écrivez-moi.';

  @override
  String get journeyKicker => 'Parcours';

  @override
  String get journeyTitleLine1 => 'Expériences';

  @override
  String get journeyTitleLine2 => '& formation';

  @override
  String get filterLabel => 'Filtrer';

  @override
  String get filterAll => 'Tout';

  @override
  String get filterJobs => 'Emplois';

  @override
  String get filterEducation => 'Formation';

  @override
  String get kindJob => 'Emploi';

  @override
  String get kindEducation => 'Formation';

  @override
  String periodSince(String start) {
    return 'depuis $start';
  }

  @override
  String get periodToday => 'aujourd\'hui';

  @override
  String get labelPeriod => 'Période';

  @override
  String get labelDuration => 'Durée';

  @override
  String durationYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ans',
      one: '1 an',
    );
    return '$_temp0';
  }

  @override
  String durationMonths(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count mois',
      one: '1 mois',
    );
    return '$_temp0';
  }

  @override
  String get sectionTasks => 'Tâches';

  @override
  String get sectionTech => 'Technos';

  @override
  String get sectionLinkedProjects => 'Projets liés';

  @override
  String get projectsKicker => 'Réalisations';

  @override
  String get projectGroupsLabel => 'Type de projets';

  @override
  String get tabPersonal => 'Personnels';

  @override
  String get tabClient => 'Entreprise';

  @override
  String get personalTitleLine1 => 'Projets';

  @override
  String get personalTitleLine2 => 'personnels';

  @override
  String get clientTitleLine1 => 'Projets';

  @override
  String get clientTitleLine2 => 'en entreprise';

  @override
  String get noProjects => 'Aucun projet pour l\'instant.';

  @override
  String projectPersonalKicker(String number) {
    return 'Projet perso $number';
  }

  @override
  String get projectKindWebsite => 'Site web';

  @override
  String get projectKindScript => 'Script';

  @override
  String get projectKindApp => 'App';

  @override
  String get projectStatusOnline => 'En ligne';

  @override
  String get projectStatusInProgress => 'En cours';

  @override
  String get projectStatusArchived => 'Archivé';

  @override
  String get sectionHighlights => 'Points clés';

  @override
  String get sectionUsage => 'Utilisation';

  @override
  String get sectionContext => 'Contexte';

  @override
  String get personalProject => 'Projet personnel';

  @override
  String get visitWebsite => 'Voir le site';

  @override
  String get copy => 'Copier';

  @override
  String get copied => 'Copié';

  @override
  String get copyCommand => 'Copier la commande';

  @override
  String get profileKicker => 'À propos';

  @override
  String get sectionSkills => 'Compétences';

  @override
  String get levelTop => 'Actuel';

  @override
  String get levelMid => 'Récent';

  @override
  String get levelBottom => 'Plus ancien';

  @override
  String get personalOnlyLegend => 'Projets perso uniquement';

  @override
  String get sectionCertificates => 'Certificats';

  @override
  String get sectionLanguages => 'Langues';

  @override
  String get sectionHobbies => 'Loisirs';

  @override
  String get sectionContact => 'Contact';

  @override
  String get settingsKicker => 'Réglages';

  @override
  String get settingsTitleLine1 => 'Préférences';

  @override
  String get settingsTitleLine2 => 'de l\'application';

  @override
  String get sectionLanguage => 'Langue';

  @override
  String get languageSystem => 'Langue du système';

  @override
  String get sectionTheme => 'Thème';

  @override
  String get themeSystem => 'Thème du système';

  @override
  String get themeLight => 'Clair';

  @override
  String get themeDark => 'Sombre';

  @override
  String get sectionData => 'Données';

  @override
  String get lastSync => 'Dernière synchronisation';

  @override
  String get never => 'Jamais';

  @override
  String get refreshNow => 'Actualiser maintenant';

  @override
  String get refreshing => 'Actualisation…';

  @override
  String get sectionAbout => 'À propos';

  @override
  String get version => 'Version';

  @override
  String get website => 'Site web';

  @override
  String get licenses => 'Licences';

  @override
  String offlineBanner(String date, String time) {
    return 'Hors ligne · données du $date à $time';
  }

  @override
  String get retry => 'Réessayer';

  @override
  String get loading => 'Chargement…';

  @override
  String get errorKicker => 'Erreur';

  @override
  String get errorTitleLine1 => 'Impossible de charger';

  @override
  String get errorTitleLine2 => 'le contenu.';

  @override
  String get errorNetwork =>
      'Vérifiez votre connexion. Le contenu reste disponible hors ligne après un premier chargement réussi.';

  @override
  String get errorServer =>
      'Le serveur est momentanément indisponible. Réessayez dans un instant.';

  @override
  String get errorInvalid =>
      'La réponse du serveur est inattendue. Mettez l\'application à jour si le problème persiste.';

  @override
  String get errorNotFound => 'Ce contenu n\'existe pas ou plus.';
}
