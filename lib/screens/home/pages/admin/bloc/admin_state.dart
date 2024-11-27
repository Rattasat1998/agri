part of 'admin_bloc.dart';

@immutable
sealed class AdminState {}

final class AdminLoading extends AdminState {}
final class AdminLoaded extends AdminState {
  final AdminModel adminModel;
  AdminLoaded({required this.adminModel});
}
