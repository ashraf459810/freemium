import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:freemium/Data/Repository/IRepository.dart';
import 'package:freemium/injection.dart';

import 'package:meta/meta.dart';
import 'package:permission_handler/permission_handler.dart';

part 'support_event.dart';
part 'support_state.dart';

class SupportBloc extends Bloc<SupportEvent, SupportState> {
  SupportBloc() : super(SupportInitial());

  Contact contact1 = Contact();
  Contact contact2 = Contact();
  Contact contact3 = Contact();
  var repository = sl.get<IRepository>();
  @override
  Stream<SupportState> mapEventToState(
    SupportEvent event,
  ) async* {
    if (event is AddContacstSupport) {
      await Permission.contacts.request().isGranted;
      var result = await repository.iprefsHelper.getsupportcontactsaved();
      print(result);
      if (result != true) {
        String phone1 = "7507611792";
        String phone2 = "750761179";
        String phone3 = "75076117984";

        contact1.givenName = "Management";
        contact1.familyName = "";
        contact1.phones = [Item(label: 'mobile', value: phone1)];
        // contact1.displayName = 'Management';

        contact2.givenName = "Service Provider";
        contact2.familyName = "";
        contact2.phones = [Item(label: 'mobile', value: phone2)];

        contact3.givenName = "Security";
        contact3.familyName = "";
        contact3.phones = [Item(label: 'mobile', value: phone3)];
        try {
          await ContactsService.addContact(contact1);
          await ContactsService.addContact(contact2);
          await ContactsService.addContact(contact3);
          await repository.iprefsHelper.setsupportcontactsaved();
        } catch (e) {
          print(e);
        }
      }
    }
    if (event is AddContacstEmergency) {
      await Permission.contacts.request().isGranted;
      print("event is emergency contact");
      var result = await repository.iprefsHelper.getemergencycontactsaved();
      print(result);
      if (result != true) {
        print("have to add");
        String phone1 = "7507611792222";
        String phone2 = "750761171192";
        String phone3 = "7507611719842";

        contact1.givenName = "Police";
        contact1.familyName = "";
        contact1.phones = [Item(label: 'mobile', value: phone1)];
        // contact1.displayName = 'Management';

        contact2.givenName = "Ambulance";
        contact2.familyName = "";
        contact2.phones = [Item(label: 'mobile', value: phone2)];

        contact3.givenName = "Firefighter";
        contact3.familyName = "";
        contact3.phones = [Item(label: 'mobile', value: phone3)];
        try {
          await ContactsService.addContact(contact1);
          await ContactsService.addContact(contact2);
          await ContactsService.addContact(contact3);
          await repository.iprefsHelper.setemergencycontactsaved();
        } catch (e) {
          print(e);
        }
      }
    }
  }
}
