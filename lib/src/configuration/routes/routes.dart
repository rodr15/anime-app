class Routes {
  Routes._();

  static String root = '/';
  static String popularAnime = 'popular';
  static String myList = 'my-List';
  static String settings = 'settings';
  static String details = 'details';

  static String myListDetails = '/$myList/$details';
  static String popularAnimeDetails = '/$popularAnime/$details';
}
