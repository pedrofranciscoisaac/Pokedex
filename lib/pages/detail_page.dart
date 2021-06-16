import 'package:flutter/material.dart';
import 'package:pokedex_manha/controllers/detail_controller.dart';
import 'package:pokedex_manha/helpers/pokemon_helper.dart';

import 'package:pokedex_manha/models/pokemon_model.dart';
import 'package:pokedex_manha/widgets/metric_tile.dart';

import 'package:pokedex_manha/widgets/pokemon_header.dart';
import 'package:pokedex_manha/widgets/horizontal_bar.dart';
import 'package:pokedex_manha/widgets/pokemon_type_chip.dart';

class DetailPage extends StatefulWidget {
  final PokemonModel pokemon;

  const DetailPage({
    Key key,
    this.pokemon,
  }) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final _controller = DetailController();

  @override
  void initState() {
    _controller.setPokemon(widget.pokemon);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(_controller.name),
      centerTitle: true,
      elevation: 0.0,
      backgroundColor: _controller.primaryColor,
      actions: [
        Container(
          height: 52,
          width: 80,
          child: Center(
            child: Text(_controller.id, style: TextStyle(fontSize: 18)),
          ),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        PokemonHeader(
          backgroundColor: _controller.primaryColor,
          imageUrl: _controller.imageUrl,
        ),
        _buildTypes(),
        _buildMetrics(),
        _buildStats(),
      ],
    );
  }

  Widget _buildStats() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              'Estatísticas',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          PokemonStatBar(
            label: 'HP',
            value: _controller.health,
            foregroundColor: _controller.primaryColor,
          ),
          PokemonStatBar(
              label: 'ATK',
              value: _controller.attack,
              foregroundColor: _controller.primaryColor.withOpacity(0.85)),
          PokemonStatBar(
            label: 'DEF',
            value: _controller.defense,
            foregroundColor: _controller.primaryColor.withOpacity(0.70),
          ),
          PokemonStatBar(
            label: 'SPD',
            value: _controller.speed,
            foregroundColor: _controller.primaryColor.withOpacity(0.55),
          ),
          PokemonStatBar(
            label: 'XP',
            value: _controller.baseExperience,
            foregroundColor: _controller.primaryColor.withOpacity(0.55),
          ),
        ],
      ),
    );
  }

  Widget _buildTypes() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children:
          _controller.types.map((type) => PokemonTypeChip(type: type)).toList(),
    );
  }

  Widget _buildMetrics() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MetricTile(
          value: _controller.weight,
          unit: 'kg',
          label: 'Peso',
        ),
        MetricTile(
          value: _controller.height,
          unit: 'm',
          label: 'Altura',
        ),
      ],
    );
  }
}
