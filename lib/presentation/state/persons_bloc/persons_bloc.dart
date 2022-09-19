import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/repository/person_data_repository.dart';
import '../../../domain/models/person.dart';

part 'persons_event.dart';
part 'persons_state.dart';

class PersonsBloc extends Bloc<PersonsEvent, PersonsState> {
  PersonsBloc(this._personsRepository) : super(PersonsInitial()) {
    on<GetPersonsEvent>(_onGetPersons);
  }
  final PersonDataRepository _personsRepository;

  _onGetPersons(GetPersonsEvent event, Emitter<PersonsState> emit) async {
    emit(PersonsLoadingState());
    final persons = await _personsRepository.getPersons();
    emit(PersonsLoadedState(persons));
  }
}
