import 'package:project_midterm/provider/home_provider.dart';
import 'package:provider/provider.dart';

// ChangeNotifierProvider<HomeProvider> homeProvider = ChangeNotifierProvider(create: (_) => HomeProvider());

final providers = [ChangeNotifierProvider(create: (_) => HomeProvider())];
