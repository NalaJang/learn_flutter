import 'package:go_router/go_router.dart';
import 'package:learn_flutter_together/240411/di/di_setup.dart';
import 'package:learn_flutter_together/240411/presentation/search_list_screen.dart';
import 'package:learn_flutter_together/240411/presentation/search_list_view_model.dart';
import 'package:learn_flutter_together/card_animation/card_animation.dart';
import 'package:provider/provider.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => ChangeNotifierProvider(
        create: (_) => getIt<SearchListViewModel>(),
        child: const CardAnimation(),
      ),
    ),
  ],
);
