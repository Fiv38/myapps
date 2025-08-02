import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'config_event.dart';
part 'config_state.dart';
part 'config_bloc.freezed.dart';

class ConfigBloc extends Bloc<ConfigEvent, ConfigState> {
  ConfigBloc() : super(const ConfigState.initial()) {
    on<ConfigEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
