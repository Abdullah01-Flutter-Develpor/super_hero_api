
import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:super_hero_api/model_classes/super_hero_image.dart';
import 'package:super_hero_api/model_classes/super_hero_powerstats.dart';

extension ApiResponse on Response{
  bool get isSuccessful => statusCode ==200;
}
abstract class APIService {
  String get baseUrl => 'https://superheroapi.com/api/8257d9c1a63c406376caa89012ec5955/';
  String get endPoint;

  dynamic fetch({String characterId = '1'})async {
    log('[Response Url : ${baseUrl+characterId+endPoint}]');
    try{var response = await get(Uri.parse(baseUrl+characterId+endPoint));    
    if (response.isSuccessful) {
      return jsonDecode(response.body);
    }
    log('[Response : ${response.statusCode}]');
    return null;}
    catch(e){
      log('Error : ${e.toString()}');
    }
  }
}

class ApiServiceForPowerStats extends APIService {
  @override

  String get endPoint => '/powerstats';

  Future<PowerStats> fetchPowerStats (String characterId) async{
       var map = await fetch(characterId: characterId);
       log('[Map : $map');
       return PowerStats.fromMap(map);
  }
}

  class ApiServiceForImage extends APIService {
  @override

  String get endPoint => '/image';

  Future<SuperHeroImage> fetchImage (String characterId) async{
       var map = await fetch(characterId: characterId);
       log('Image : $map');
       return SuperHeroImage.fromMap(map);
  }
}