import 'package:churchfy/provider/membro_provider.dart';
import 'package:churchfy/widgets/membro_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchBarDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Consumer<MembroProvider>(
      builder: (context, provider, child) {
        final results = provider.membros
            .where((membro) =>
                membro.nome.toLowerCase().contains(query.toLowerCase()))
            .toList();

        return ListView.builder(
          itemCount: results.length,
          itemBuilder: (context, index) {
            return MembroWidget(membro: results[index]);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Consumer<MembroProvider>(
      builder: (context, provider, child) {
        final suggestions = query.isEmpty
            ? provider.membros
            : provider.membros
                .where((membro) =>
                    membro.nome.toLowerCase().contains(query.toLowerCase()))
                .toList();

        return ListView.builder(
          itemCount: suggestions.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(suggestions[index].nome),
              onTap: () {
                query = suggestions[index].nome;
                showResults(context);
              },
            );
          },
        );
      },
    );
  }
}
