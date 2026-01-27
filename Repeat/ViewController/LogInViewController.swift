//
//  LogInViewController.swift
//  Repeat
//
//  Created by Aleksey on 19.12.2025.
//

import UIKit

class LogInViewController: UIViewController {
    
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    private lazy var logoView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "logo")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var firstTexstField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "User Name"
        textField.font = .systemFont(ofSize: 16)
        textField.tintColor = UIColor(named: "AccentColor")
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 10
        textField.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner] // Скрываем нижнии углы для отмены скругления
        textField.autocapitalizationType = .none                                     // Отключаем автоматический первый заглавный символ
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 0)) // Cоздаём отступ для текста и плейсхолдера
        textField.leftViewMode = .always                                             // Включаем отображение отступа
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var secondTexstField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.font = .systemFont(ofSize: 16)
        textField.tintColor = UIColor(named: "AccentColor")
        textField.autocapitalizationType = .none                                     // Отключаем автоматический первый заглавный символ
        textField.isSecureTextEntry = true                                           // Скрываем символы пароля при вводе
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 0)) // Cоздаём отступ для текста и плейсхолдера
        textField.leftViewMode = .always                                             // Включаем отображение отступа
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.backgroundColor = .systemGray6
        stack.layer.borderColor = UIColor.lightGray.cgColor
        stack.layer.borderWidth = 0.5
        stack.layer.cornerRadius = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var logInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(patternImage: (UIImage(named: "blue_pixel")!))
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(pressLogIn), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    
        addConstraints()
        setupGestures()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tabBarController?.tabBar.isHidden = true
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.didShowKeyboard(_:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.didHideKeyboard(_:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.tabBarController?.tabBar.isHidden = false
    }
    
    private func addConstraints() {
        
        view.addSubview(scrollView)
        scrollView.addSubview(logoView)
        scrollView.addSubview(stackView)
        scrollView.addSubview(logInButton)
        
        stackView.addArrangedSubview(firstTexstField)
        stackView.addArrangedSubview(secondTexstField)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            
            logoView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 120),
            logoView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            logoView.widthAnchor.constraint(equalToConstant: 100),
            logoView.heightAnchor.constraint(equalToConstant: 100),
            
            stackView.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 80),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            stackView.heightAnchor.constraint(equalToConstant: 100),
            
            firstTexstField.heightAnchor.constraint(equalToConstant: 50),
            secondTexstField.heightAnchor.constraint(equalToConstant: 50),
            
            logInButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16),
            logInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            logInButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.forcedHidingKeyboard))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func didShowKeyboard(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue { // Информация о размере клавиатуры
            let keyboardRectangle = keyboardFrame.cgRectValue // Размер клавиатуры
            let keyboardHeight = keyboardRectangle.height // Высота клавиатуры
            
            let logInButtonBottomPointY = self.logInButton.frame.origin.y + self.logInButton.frame.height // Вычисляем нижнюю точку logInButton
            let keyboardOriginY = self.view.frame.height - keyboardHeight // Вычисляем верхнюю точку клавиатуры
            
            let yOffset = keyboardOriginY < logInButtonBottomPointY ? logInButtonBottomPointY - keyboardOriginY + 16 : 0 // Если клавиатура перекрывает кнопку, то поднять кнопку на размер перекрытия +16пт, в инном случае - ничего не делать
            
            self.scrollView.contentOffset = CGPoint(x: 0, y: yOffset)
        }
    }
    
    @objc private func didHideKeyboard(_ notification: Notification) {
        self.forcedHidingKeyboard()
    }
    
    @objc private func forcedHidingKeyboard() {
        self.view.endEditing(true)                                // Прекращаем все изменения с корневой view
        self.scrollView.setContentOffset(.zero, animated: true)   // Возвращаем контент scrollView в изначальное положение
    }
    
    @objc private func pressLogIn() {
        let profileViewController = ProfileViewController()
        navigationController?.pushViewController(profileViewController, animated: true)
        logInButton.alpha = logInButton.isHighlighted || logInButton.isSelected ? 0.8 : 1
    }

}
