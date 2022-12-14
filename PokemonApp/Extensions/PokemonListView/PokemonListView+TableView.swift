import UIKit

extension PokemonListView: UITableViewDelegate, UITableViewDataSource {
    // MARK: - UITableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pokemons.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: PokemonCell.Constants.pokemonCell,
            for: indexPath
        ) as? PokemonCell else { fatalError("DequeueReusableCell failed while casting.") }
        let pokemon = pokemons[indexPath.row]
        cell.configure(using: pokemon, paginationCount: indexPath)
        cell.backgroundColor = AppColor.shadowColor
        return cell
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == pokemons.count - 1 {
            if let listPresenter = listPresenter {
                listPresenter.startActivityIndicator()
                listPresenter.loadAllPokemonsPages()
                listPresenter.stopActivityIndicator()
            }
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let listPresenter = listPresenter {
            listPresenter.transitionToDeatailsModule(pokemonId: indexPath.row + 1)
        }
    }
}
