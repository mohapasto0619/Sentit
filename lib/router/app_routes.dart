class AppRoute {
  const AppRoute._(this.path, this.name);
  final String path;
  final String name;

  //Root route
  static const root = AppRoute._('/', 'root');

  //Auth routes
  static const login = AppRoute._('/login', 'login');
  static const register = AppRoute._('/register', 'register');

  //Chat routes
  static const chat =
      AppRoute._('chat/:userId/:receiverId/:receiverUsername', 'chat');
  static const chatList = AppRoute._('/chatList', 'chatList');

  //Add routes
  static const addUser = AppRoute._('/addUser', 'addUser');
}
