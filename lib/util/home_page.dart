enum HomePage { ophim, vieon }

extension HomePageExt on HomePage {

  String get name {
    switch (this) {
      case HomePage.ophim:
        return "Ophim";
      case HomePage.vieon:
        return "VieOn";
    }
  }

  String get icon {
    switch (this) {
      case HomePage.ophim:
        return "assets/images/ophim.svg";
      case HomePage.vieon:
        return "assets/images/vieon.svg";
    }
  }
}