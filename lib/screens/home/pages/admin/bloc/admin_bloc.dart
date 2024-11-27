import 'package:agri/screens/home/pages/admin/models/admin_model.dart';
import 'package:agri/screens/home/pages/admin/repository/admin_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'admin_event.dart';
part 'admin_state.dart';

class AdminBloc extends Bloc<AdminEvent, AdminState> {

  final AdminRepository _adminRepository = AdminRepository();

  AdminBloc() : super(AdminLoading()) {
    on<AdminInitialEvent>(_onAdminInitialEvent);
  }

  void _onAdminInitialEvent(AdminInitialEvent event, Emitter<AdminState> emit) async {
    emit(AdminLoading());
    final adminList = await _adminRepository.getAdminList();
    emit(AdminLoaded(adminModel: adminList));

  }
}
