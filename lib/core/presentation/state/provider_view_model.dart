import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class ViewModelProvider<T extends ChangeNotifier> extends StatefulWidget {
  final T viewModel;
  final Widget Function(BuildContext context, T value, Widget? child) builder;
  final Function(T)? onModelReady;

  const ViewModelProvider({
    super.key,
    required this.viewModel,
    required this.builder,
    this.onModelReady,
  });

  @override
  _ViewModelProviderState<T> createState() => _ViewModelProviderState<T>();
}

class _ViewModelProviderState<T extends ChangeNotifier>
    extends State<ViewModelProvider<T>> {
  late T model;

  @override
  void initState() {
    super.initState();
    model = widget.viewModel;
    widget.onModelReady?.call(model);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: model,
      child: Consumer<T>(
        builder: (context, model, child) {
          return widget.builder(context, model, child);
        },
      ),
    );
  }
}
