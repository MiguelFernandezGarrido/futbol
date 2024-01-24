import 'package:flutter/material.dart';
import 'package:tema_4/models/team_response_model.dart';
import 'package:tema_4/services/players_service.dart';

class TeamProvider with ChangeNotifier {
  TeamResponse team = TeamResponse();
  PlayersService service = PlayersService();

  TeamProvider() {
    // getPlayers();
  }

  Future getPlayers(String teamId) async {
    team = await service.getTeam(teamId);
    notifyListeners();
  }

  getPlayerFirebase() {
    return service.getPlayersFirebase();
  }
}
