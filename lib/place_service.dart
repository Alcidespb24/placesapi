import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:placesapi/place_search.dart';

class PlacesService {
  final apiKey = 'AIzaSyBapr3lgmiIOvyhFDxcdL-q5unUm5g3Fec';

  Future<List<PlaceSearch>> getAutocomplete(String search) async {
    var url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/xml?input=$search&types=establishment&location=37.76999,-122.44696&key=$apiKey';
    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var jsonResults = json['predictions'] as List;
    return jsonResults.map((place) => PlaceSearch.fromJson(place)).toList();
  }

  Future<PlaceSearch> getPlace(String placeId) async {
    var url =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$apiKey';
    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var jsonResult = json['result'] as Map<String, dynamic>;
    return PlaceSearch.fromJson(jsonResult);
  }
}