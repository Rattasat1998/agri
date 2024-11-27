part of 'machinery_map_bloc.dart';

@immutable
sealed class MachineryMapEvent {}

class GetMachineryMap extends MachineryMapEvent {
  final BuildContext context;

  GetMachineryMap(this.context);
}



