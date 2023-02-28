import 'package:get/get.dart';

class HomeController extends GetxController {

  final List nigerianState = ["Abia", "Imo"].obs;
  final Map nigerianLGA = {
    'Abia': {
      '0': 'ABA SOUTH',
      '1': 'ABA NORTH',
    },
    'Imo': {
      '0': 'Orlu',
      '1': 'Okigwe',
    }
  };

  final Map nigerianEze = {
    'ABA SOUTH': {
      '0': 'Eze Aba North',
      '1': 'Eze Ekeoha',
      '2': 'Eze Aba River',
      '3': 'Eze Eziukwu',
      '4': 'Eze Ngwa',
    },
    'ABA NORTH': {
      "0": "Eze Ariaria",
      "1": "Eze Eziama",
      "2": "Eze Umuogor",
      "3": "Eze Umuola",
      "4": "Eze Uratta"
    },
    'Orlu': {
      "0": "Eze Amaifeke",
      "1": "Eze Ebenese",
      "2": "Eze Ogberuru",
      "3": "Eze Okaeke",
      "4": "Eze Umuna"
    },
    'Okigwe': {
      "0": "Eze Ihube",
      "1": "Eze Ogii",
      "2": "Eze Umulolo",
      "3": "Eze ibinta",
      "4": "Eze Umualumuoke"
    }
  };

  final List lgaList = [].obs;
  final List ezeList = [].obs;

  var selectedState = "".obs;
  var isSelectedState = false.obs;

  var selectedLGA = "".obs;
  var isSelectedLGA = false.obs;

  getStateSelected(state) async{
    selectedState(state);
    isSelectedState(true);
    if(nigerianLGA.containsKey(state)){
      lgaList.clear();
      for(int i = 0; i < nigerianLGA[state].length; i++){
        lgaList.add(nigerianLGA[state]["$i"]);
      }
    }
    update();
  }

  getLGASelected(lga) async{
    selectedLGA(lga);
    isSelectedLGA(true);
    if(nigerianEze.containsKey(lga)){
      ezeList.clear();
      for(int i = 0; i < nigerianEze[lga].length; i++){
        ezeList.add(nigerianEze[lga]["$i"]);
      }
    }
    update();
  }

}
