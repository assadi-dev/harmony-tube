import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harmony_flow/cubit/theme_mode_cubit.dart';
import 'package:harmony_flow/injections/injector.dart';
import 'package:harmony_flow/widgets/main_scaffold.dart';

class AppProvider extends StatefulWidget {
  const AppProvider({super.key});
  @override
  State<StatefulWidget> createState() => _AppProvider();
}

class _AppProvider extends State<AppProvider> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeModeCubit>(create: (context)=>injector())
      ],
      child: MainScaffold(),
    );
  }
}