//
//  ViewController.swift
//  IMC
//
//  Created by Juanma on 17/11/2026.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Outlets (la interfaz está en Main.storyboard)

    @IBOutlet weak var heigthLabel: UILabel!
    @IBOutlet weak var weigthLabel: UILabel!

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultDescriptionLabel: UILabel!

    // MARK: - Datos

    var heigth = 169.0
    var weigth = 70.0

    override func viewDidLoad() {
        super.viewDidLoad()
        styleLabels()
        updateInputLabels()
    }

    // MARK: - Acciones

    @IBAction func heigthChanger(_ sender: UISlider) {
        heigth = Double(sender.value).rounded()
        updateInputLabels()
    }

    @IBAction func weigthChanger(_ sender: UIStepper) {
        weigth = sender.value
        updateInputLabels()
    }

    @IBAction func calcuateBMI(_ sender: Any) {
        let heigthInMeters = heigth / 100
        let result = weigth / pow(heigthInMeters, 2)
        resultLabel.text = String(format: "%.2f", result)

        switch result {
        case 0..<18.5:
            resultDescriptionLabel.text = "Bajo Peso"
            resultDescriptionLabel.textColor = UIColor.imcColorPesoBajo
            resultLabel.textColor = UIColor.imcColorPesoBajo
        case 18.5..<25.0:
            resultDescriptionLabel.text = "Peso Normal"
            resultDescriptionLabel.textColor = UIColor.imcColorNormal
            resultLabel.textColor = UIColor.imcColorNormal
        case 25.0..<30.0:
            resultDescriptionLabel.text = "Gordete"
            resultDescriptionLabel.textColor = UIColor.imcColorSobrepeso1
            resultLabel.textColor = UIColor.imcColorSobrepeso1
        case 30.0..<35.0:
            resultDescriptionLabel.text = "Gordaco"
            resultDescriptionLabel.textColor = UIColor.imcColorObeso
            resultLabel.textColor = UIColor.imcColorObeso

        default:
            resultDescriptionLabel.text = "Obesidad Morbida"
            resultDescriptionLabel.textColor = UIColor.imcColorGordoc
            resultLabel.textColor = UIColor.imcColorGordoc
        }
    }

    private func updateInputLabels() {
        heigthLabel.text = "\(Int(heigth)) cm"
        weigthLabel.text = "\(Int(weigth)) kg"
    }

    // MARK: - Estilo

    /// Fuentes redondeadas que escalan con Dynamic Type (el storyboard no puede combinar ambas cosas).
    private func styleLabels() {
        for label in [heigthLabel, weigthLabel] {
            label?.font = roundedFont(size: 34, weight: .bold, style: .title1)
            label?.adjustsFontSizeToFitWidth = true
            label?.minimumScaleFactor = 0.6
        }

        resultLabel.font = roundedFont(size: 64, weight: .bold, style: .largeTitle)
        resultLabel.adjustsFontSizeToFitWidth = true
        resultLabel.minimumScaleFactor = 0.5

        resultDescriptionLabel.font = roundedFont(size: 24, weight: .semibold, style: .title2)
    }

    private func roundedFont(size: CGFloat, weight: UIFont.Weight, style: UIFont.TextStyle) -> UIFont {
        let base = UIFont.systemFont(ofSize: size, weight: weight)
        let descriptor = base.fontDescriptor.withDesign(.rounded) ?? base.fontDescriptor
        return UIFontMetrics(forTextStyle: style).scaledFont(for: UIFont(descriptor: descriptor, size: size))
    }
}

// MARK: - Previews (cargan la pantalla desde Main.storyboard)

#Preview("Claro") {
    UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() ?? UIViewController()
}

#Preview("Oscuro") {
    let controller = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() ?? UIViewController()
    controller.overrideUserInterfaceStyle = .dark
    return controller
}
