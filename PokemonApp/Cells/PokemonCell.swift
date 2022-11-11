import UIKit

final class PokemonCell: UITableViewCell {
    // MARK: - Constants
    // MARK: - Private
    private let containerView = UIView()
    private let pokemonLabel = UILabel()
    var paginationLabel = UILabel()

    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupContainerView()
        setupNameLabel()
        setupCompletedLabel()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setups
    private func setupContainerView() {
        self.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
        containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12).isActive = true
        containerView.backgroundColor = AppColor.shadowColor
        containerView.layer.cornerRadius = 16
        containerView.addSubview(pokemonLabel)
        containerView.addSubview(paginationLabel)
    }

    private func setupNameLabel() {
        pokemonLabel.translatesAutoresizingMaskIntoConstraints = false
        pokemonLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 12).isActive = true
        pokemonLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 12).isActive = true
        pokemonLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -12).isActive = true
        pokemonLabel.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.8).isActive = true
        pokemonLabel.textColor = .black
        pokemonLabel.textAlignment = .left
        pokemonLabel.numberOfLines = 0
    }

    private func setupCompletedLabel() {
        paginationLabel.translatesAutoresizingMaskIntoConstraints = false
        paginationLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 12).isActive = true
        paginationLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -12).isActive = true
        paginationLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -12).isActive = true
        paginationLabel.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.15).isActive = true
        paginationLabel.textColor = .black
        paginationLabel.textAlignment = .right
    }

    // MARK: - API
    func configure(using pokemon: Result, paginationCount: IndexPath) {
        pokemonLabel.text = pokemon.name
        paginationLabel.text = "\(paginationCount.row + 1)"
    }
}
