class AppDimension extends Dimensions{
  @override
  double get bigMargin => 20;

  @override
  double get defaultMargin => 16;

  @override
  double get mediumMargin => 12;

  @override
  double get smallMargin => 8;

  @override
  double get verySmallMargin => 4;

  @override
  double get highElevation => 16;

  @override
  double get mediumElevation => 8;

  @override
  double get lightElevation => 4;

  @override
  double get bigText => 22;

  @override
  double get defaultText => 18;

  @override
  double get mediumText => 16;

  @override
  double get smallText => 14;

  @override
  double get verySmallText => 12;

  @override
  double get imageBorderRadius => 8;
}

abstract class Dimensions{

  //define your text sizes
  double get verySmallText;
  double get smallText;
  double get mediumText;
  double get defaultText;
  double get bigText;
  //define padding-margin
  double get verySmallMargin;
  double get smallMargin;
  double get mediumMargin;
  double get defaultMargin;
  double get bigMargin;
  //elevation
  double get lightElevation;
  double get mediumElevation;
  double get highElevation;
  //border radius
  double get imageBorderRadius;
}