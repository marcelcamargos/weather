//
//  WeatherView.swift
//  Weather
//
//  Created by Marcel Camargos on 04/02/23.
//

import UIKit

class WeatherView: UIView {
    public lazy var cityTitleLabel: UILabel = {
        let uiLabel = UILabel()
        uiLabel.translatesAutoresizingMaskIntoConstraints = false
        uiLabel.textColor = .black
        uiLabel.textAlignment = .left
        uiLabel.font = UIFont.boldSystemFont(ofSize: 32)
        return uiLabel
    }()
    
    public lazy var someImageView: UIImageView = {
        let theImageView = UIImageView()
        theImageView.translatesAutoresizingMaskIntoConstraints = false
        theImageView.widthAnchor.constraint(equalToConstant: 40).isActive = true
        theImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return theImageView
    }()
    
    public lazy var postTitleContentLabel: UILabel = {
        let uiLabel = UILabel()
        uiLabel.translatesAutoresizingMaskIntoConstraints = false
        uiLabel.textColor = .black
        uiLabel.textAlignment = .center
        uiLabel.font = uiLabel.font.withSize(48)
        uiLabel.numberOfLines = 0
        return uiLabel
    }()
    
    private lazy var imageTemperatureStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    public lazy var descriptionLabel: UILabel = {
        let uiLabel = UILabel()
        uiLabel.translatesAutoresizingMaskIntoConstraints = false
        uiLabel.textColor = .black
        uiLabel.textAlignment = .center
        uiLabel.font = UIFont.systemFont(ofSize: 16)
        return uiLabel
    }()
    
    public lazy var lowTemperatureLabel: UILabel = {
        let uiLabel = UILabel()
        uiLabel.translatesAutoresizingMaskIntoConstraints = false
        uiLabel.textColor = .black
        uiLabel.textAlignment = .right
        uiLabel.font = UIFont.systemFont(ofSize: 32)
        uiLabel.text = "L:"
        return uiLabel
    }()
    
    public lazy var valueLowTemperatureLabel: UILabel = {
        let uiLabel = UILabel()
        uiLabel.translatesAutoresizingMaskIntoConstraints = false
        uiLabel.textColor = .black
        uiLabel.textAlignment = .right
        uiLabel.font = UIFont.systemFont(ofSize: 32)
        return uiLabel
    }()
    
    private lazy var lowStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    public lazy var highTemperatureLabel: UILabel = {
        let uiLabel = UILabel()
        uiLabel.translatesAutoresizingMaskIntoConstraints = false
        uiLabel.textColor = .black
        uiLabel.font = UIFont.systemFont(ofSize: 32)
        uiLabel.text = "H:"
        return uiLabel
    }()
    
    public lazy var valueHighTemperatureLabel: UILabel = {
        let uiLabel = UILabel()
        uiLabel.translatesAutoresizingMaskIntoConstraints = false
        uiLabel.textColor = .black
        uiLabel.font = UIFont.systemFont(ofSize: 32)
        return uiLabel
    }()
    
    private lazy var hightStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var imageTemperatureHorizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    public lazy var errorLabel: UILabel = {
        let uiLabel = UILabel()
        uiLabel.translatesAutoresizingMaskIntoConstraints = false
        uiLabel.textColor = .black
        uiLabel.textAlignment = .center
        uiLabel.font = UIFont.systemFont(ofSize: 16)
        uiLabel.numberOfLines = 0
        return uiLabel
    }()
    
    public lazy var iconErrorLabel: UILabel = {
        let uiLabel = UILabel()
        uiLabel.translatesAutoresizingMaskIntoConstraints = false
        uiLabel.textColor = .black
        uiLabel.textAlignment = .center
        uiLabel.font = UIFont.systemFont(ofSize: 16)
        uiLabel.numberOfLines = 0
        return uiLabel
    }()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

extension WeatherView: ViewCodable {
    func buildHierarchy() {
        addSubview(cityTitleLabel)

        imageTemperatureStackView.addArrangedSubview(someImageView)
        imageTemperatureStackView.addArrangedSubview(postTitleContentLabel)
        addSubview(imageTemperatureStackView)
        
        addSubview(descriptionLabel)
        
        lowStackView.addArrangedSubview(lowTemperatureLabel)
        lowStackView.addArrangedSubview(valueLowTemperatureLabel)
        horizontalStackView.addArrangedSubview(lowStackView)
        
        hightStackView.addArrangedSubview(highTemperatureLabel)
        hightStackView.addArrangedSubview(valueHighTemperatureLabel)
        horizontalStackView.addArrangedSubview(hightStackView)
        
        addSubview(horizontalStackView)
        
        addSubview(errorLabel)
        addSubview(iconErrorLabel)
    }
    
    func setupConstraints() {
        cityTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 96).isActive = true
        cityTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        cityTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        
        imageTemperatureStackView.topAnchor.constraint(equalTo: cityTitleLabel.bottomAnchor, constant: 24).isActive = true
        imageTemperatureStackView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        
        descriptionLabel.topAnchor.constraint(equalTo: imageTemperatureStackView.bottomAnchor, constant: 16).isActive = true
        descriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        
        horizontalStackView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 4).isActive = true
        horizontalStackView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        
        errorLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        errorLabel.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        errorLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        errorLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        
        iconErrorLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        iconErrorLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        iconErrorLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        iconErrorLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
    }
}
