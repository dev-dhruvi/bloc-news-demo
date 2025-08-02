
class AppDrawable extends Drawables {
  @override
  String get icGithub => "${iconBasePath}ic_github.png";

  @override
  String get icLinkedIn => "${iconBasePath}ic_linkedin.png";

  @override
  String get icMedium => "${iconBasePath}ic_medium.png";

  @override
  String get imgBgDrawerHeader => "${imageBasePath}bg_drawer_header.jpeg";

  @override
  String get imgError => "${imageBasePath}img_error.png";

}

abstract class Drawables {

  String imageBasePath ="assets/images/";
  String iconBasePath ="assets/images/icons/";

  String get imgBgDrawerHeader;
  String get imgError;
  String get icGithub;
  String get icLinkedIn;
  String get icMedium;
}