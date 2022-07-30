import UIKit

class ThemesView: UIView {
    private lazy var themeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24, weight: .medium)
        label.textColor = .darkGray
        label.text = "App is in Light mode"
        return label
    }()
    
    private lazy var themeSwitcher: UISwitch = {
        let switcher = UISwitch()
        switcher.translatesAutoresizingMaskIntoConstraints = false
        switcher.addTarget(self, action: #selector(themeSwitcherChange), for: .valueChanged)
        return switcher
    }()
    
    lazy var themeIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "sun.max.circle")
        imageView.tintColor = .systemYellow
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        self.backgroundColor = .white
        self.setupThemeLabel()
        self.setupThemeSwitcher()
        self.setupThemeIcon()
    }
    
    private func setupThemeLabel() {
        self.addSubview(self.themeLabel)
        NSLayoutConstraint.activate([
            self.themeLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 25),
            self.themeLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    private func setupThemeSwitcher() {
        self.addSubview(self.themeSwitcher)
        NSLayoutConstraint.activate([
            self.themeSwitcher.topAnchor.constraint(equalTo: self.themeLabel.bottomAnchor, constant: 10),
            self.themeSwitcher.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    private func setupThemeIcon() {
        self.addSubview(self.themeIcon)
        NSLayoutConstraint.activate([
            self.themeIcon.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.themeIcon.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.themeIcon.widthAnchor.constraint(equalToConstant: 164),
            self.themeIcon.heightAnchor.constraint(equalTo: self.themeIcon.widthAnchor)
        ])
    }
    
    @objc
    private func themeSwitcherChange() {
        let switchOn = themeSwitcher.isOn
        self.window?.overrideUserInterfaceStyle = switchOn ? .dark : .light
        
        themeLabel.text = switchOn ? "App is Dark Mode" : "App is Light Mode"
        themeIcon.image = UIImage(systemName: switchOn ? "moon.circle" : "sun.max.circle")
        
        self.backgroundColor = switchOn ? .darkGray : .white
        themeLabel.textColor = switchOn ? .white : .darkGray
    }
}
