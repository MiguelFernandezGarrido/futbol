import 'dart:convert';

import 'package:http/http.dart';
import 'package:tema_4/models/player_firebase.dart';
import 'package:tema_4/models/player_model.dart';
import 'package:tema_4/models/team_response_model.dart';

class PlayersService {
  final _uri = 'https://api.football-data.org/v2/teams/';
  final _uriPost =
      'https://examendartmiguel-default-rtdb.europe-west1.firebasedatabase.app/jFavoritos';
  final String _token = 'e278476509464c439b6050bfed340fb1';
  Map<String, String> get headers => {'X-Auth-Token': _token};

  Future<TeamResponse> getTeam(String id) async {
    final newUrl = _uri + id;
    Response response = await get(Uri.parse(newUrl), headers: headers);
    return playerResponseFromJson(response.body);
  }

//
  Future<void> postPlayer(PlayerFirebase player) async {
    Response response = await post(Uri.parse(_uriPost + '.json'),
        body: jsonEncode(player.toMap()));
    print(response.body);
  }

  isFavorite(Player player) {
    // return getPlayerFirebase(player.id);
    return false;
  }

  Future<bool> getPlayerFirebase(int? id) async {
    Response response = await get(Uri.parse(_uriPost));
    print(response.body);
    return jsonDecode(response.body)['$id'] != null;
  }

  void deletePlayer(int? id) {
    delete(Uri.parse('$_uriPost/$id.json'));
  }

  getPlayersFirebase() async {
    Response response = await get(Uri.parse(_uriPost));
    print(response.body);
    return jsonDecode(response.body);
  }
}
