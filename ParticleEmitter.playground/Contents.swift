import UIKit
import PlaygroundSupport

// Star icon credits: https://icons8.com/icons/set/star-emoji
class SceneView: UIView {

    // MARK: - Initialization
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 700, height: 400))
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Actions
    func showStars() {
        particleEmitter.emitterCells = [starParticle]
        self.layer.addSublayer(particleEmitter)
    }
    
    @objc func handleTap(sender: UIPanGestureRecognizer) {
        
        particleEmitter.emitterPosition = sender.location(in: self)
        
        if sender.state == .ended {
            particleEmitter.lifetime = 0
        } else if sender.state == .began {
            showStars()
            particleEmitter.lifetime = 1.0
        }
    }
    
    // MARK: - Properties
    lazy var panGestureRecognizer:
        UIPanGestureRecognizer = {
            let gestureRecognizer = UIPanGestureRecognizer()
            gestureRecognizer
                .addTarget(self, action: #selector(handleTap))
            return gestureRecognizer
    }()
    
    lazy var particleEmitter: CAEmitterLayer = {
        let emitter = CAEmitterLayer()
        emitter.emitterShape = .point
        emitter.renderMode = .additive
        return emitter
    }()
    
    let starParticle = StarParticle()
    
    // MARK: - UI Setup
    func setupUI() {
        self.backgroundColor = .black
        self.addGestureRecognizer(panGestureRecognizer)
    }
    
}

PlaygroundPage.current.liveView = SceneView()
