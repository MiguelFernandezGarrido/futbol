import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tema_4/models/player_firebase.dart';
import 'package:tema_4/models/team_response_model.dart';
import 'package:tema_4/services/players_service.dart';

import '../../providers/players_provider.dart';

class TeamScreen extends StatefulWidget {
  const TeamScreen({super.key});

  @override
  State<TeamScreen> createState() => _TeamScreenState();
}

class _TeamScreenState extends State<TeamScreen> {
  @override
  Widget build(BuildContext context) {
    final teamResponse = Provider.of<TeamProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(teamResponse.team.name ?? 'Sin nombre'),
      ),
      body: teamResponse.team.squad == null
          ? const Center(child: CircularProgressIndicator())
          : _HomeView(playersResponse: teamResponse.team),
    );
  }
}

class _HomeView extends StatelessWidget {
  final TeamResponse playersResponse;
  final PlayersService service = PlayersService();

  _HomeView({required this.playersResponse});
  @override
  Widget build(Object context) {
    return ListView.separated(
      itemCount: playersResponse.squad!.length,
      separatorBuilder: (BuildContext context, int index) {
        return const Divider();
      },
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: CircleAvatar(
              backgroundColor: Colors.green,
              child: Text(playersResponse.squad?[index].position
                      ?.toString()
                      .substring(0, 3) ??
                  'Staff')),
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Expanded(
              child: Text(
                playersResponse.squad![index].name ?? 'Sin nombre',
                overflow: TextOverflow.ellipsis,
              ),
            ),
            GestureDetector(
              onTap: () {
                if (service.isFavorite(playersResponse.squad![index])) {
                  print("caracaola");
                  service.deletePlayer(
                    playersResponse.squad![index].id,
                  );
                } else {
                  print(
                      PlayerFirebase(id: playersResponse.squad![index].id).id);
                  print(PlayerFirebase(id: playersResponse.squad![index].id)
                      .name);
                  service.postPlayer(PlayerFirebase(
                      id: playersResponse.squad![index].id,
                      name: playersResponse.squad![index].name));
                }
              },
              child: GetIcon(
                // isFavorite: service.isFavorite(playersResponse.squad![index]),
                isFavorite: true,
              ),
            ),
          ]),
        );
      },
    );
  }
}

class GetIcon extends StatefulWidget {
  final bool isFavorite;
  const GetIcon({
    super.key,
    required this.isFavorite,
  });

  @override
  State<GetIcon> createState() => _GetIconState();
}

class _GetIconState extends State<GetIcon> {
  @override
  Widget build(BuildContext context) {
    return widget.isFavorite
        ? const Icon(Icons.favorite)
        : const Icon(Icons.favorite_border);
  }
}
