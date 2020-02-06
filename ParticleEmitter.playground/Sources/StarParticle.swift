import UIKit

public class StarParticle: CAEmitterCell {
    
    public override init() {
        super.init()
        self.birthRate = 30
        self.lifetime = 1.0
        self.velocity = 100
        self.velocityRange = 50
        self.emissionLongitude = 90
        self.emissionRange = .pi
        self.spinRange = 5
        self.scale = 0.5
        self.scaleRange = 0.25
        self.color = UIColor(white: 1, alpha: 1.0).cgColor
        self.alphaSpeed = -0.050
        self.contents = UIImage(named: "icons8-star-48")?.cgImage
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

