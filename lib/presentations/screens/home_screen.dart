import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../providers/players_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final pro = Provider.of<TeamProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Equipos'),
      ),
      body: Center(child: _getEquipos(pro)),
    );
  }

  _getEquipos(TeamProvider pro) {
    final List<Map<String, String>> teams = [
      {
        'id': '81',
        'name': 'Barcelona',
        'img':
            'https://upload.wikimedia.org/wikipedia/en/thumb/4/47/FC_Barcelona_%28crest%29.svg/1200px-FC_Barcelona_%28crest%29.svg.png'
      },
      {
        'id': '86',
        'name': 'Real Madrid',
        'img':
            'https://upload.wikimedia.org/wikipedia/en/thumb/5/56/Real_Madrid_CF.svg/1200px-Real_Madrid_CF.svg.png'
      },
      {
        'id': '559',
        'name': 'Sevilla',
        'img':
            'https://www.shutterstock.com/image-vector/sevilla-spainaugust-11-2023spanish-fc-600nw-2345945663.jpg'
      },
      {
        'id': '78',
        'name': 'Atlético de Madrid',
        'img':
            'https://as01.epimg.net/img/comunes/fotos/fichas/equipos/large/42.png'
      },
      {
        'id': '92',
        'name': 'Real Sociedad',
        'img':
            'https://upload.wikimedia.org/wikipedia/ca/6/68/Real_Sociedad_de_Futbol_logo.png'
      },
    ];
    return ListView.separated(
      itemCount: teams.length,
      separatorBuilder: (BuildContext context, int index) {
        return const Divider();
      },
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            pro.getPlayers(teams[index]['id']!);
            context.push('/team');
          },
          child: ListTile(
            leading: Image.network(teams[index]['img']!),
            title: Text(teams[index]['name']!),
          ),
        );
      },
    );
  }
}
