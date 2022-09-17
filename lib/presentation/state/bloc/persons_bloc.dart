import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'persons_event.dart';
part 'persons_state.dart';

class PersonsBloc extends Bloc<PersonsEvent, PersonsState> {
  PersonsBloc() : super(PersonsInitial()) {
    on<PersonsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
