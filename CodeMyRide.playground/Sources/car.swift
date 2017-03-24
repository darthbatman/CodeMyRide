import SpriteKit

public class Car: SKView {
    
    public var backgroundSprite0: SKSpriteNode = SKSpriteNode()
    public var backgroundSprite1: SKSpriteNode = SKSpriteNode()
    public var carBodySprite: SKSpriteNode = SKSpriteNode()
    public var wheelBackSprite: SKSpriteNode = SKSpriteNode()
    public var wheelFrontSprite: SKSpriteNode = SKSpriteNode()
    public var headlightSprite: SKSpriteNode = SKSpriteNode()
    public var brakelightSprite: SKSpriteNode = SKSpriteNode()
    public var wiperSprite: SKSpriteNode = SKSpriteNode()
    public var acceleratorPedalSprite: SKSpriteNode = SKSpriteNode()
    public var brakePedalSprite: SKSpriteNode = SKSpriteNode()
    
    public var acceleratorPedalSpriteTapped: Bool = false
    public var brakePedalSpriteTapped: Bool = false
    
    var rainParticle: SKEmitterNode = SKEmitterNode()
    
    public init(){
        
        let frame = CGRect(x: 0, y: 0, width: 512, height: 512)
        
        let scene = SKScene(size: frame.size)
        
        super.init(frame: frame)
        
        backgroundSprite0 = SKSpriteNode(imageNamed: "background")
        backgroundSprite0.scale(to: frame.size)
        backgroundSprite0.position = CGPoint(x: scene.frame.size.width / 2, y: scene.frame.size.height / 2)
        scene.addChild(backgroundSprite0)
        
        backgroundSprite1 = SKSpriteNode(imageNamed: "background")
        backgroundSprite1.scale(to: frame.size)
        backgroundSprite1.position = CGPoint(x: scene.frame.size.width / 2 + 512, y: scene.frame.size.height / 2)
        scene.addChild(backgroundSprite1)
        
        carBodySprite = SKSpriteNode(imageNamed: "car_body_grey")
        carBodySprite.position = CGPoint(x: 256, y: 260)
        carBodySprite.size = CGSize(width: 380, height: 160)
        scene.addChild(carBodySprite)
        
        wheelBackSprite = SKSpriteNode(imageNamed: "car_wheel_grey")
        wheelBackSprite.position = CGPoint(x: 124, y: 200)
        wheelBackSprite.size = CGSize(width: 80, height: 80)
        scene.addChild(wheelBackSprite)
        
        wheelFrontSprite = SKSpriteNode(imageNamed: "car_wheel_grey")
        wheelFrontSprite.position = CGPoint(x: 380, y: 200)
        wheelFrontSprite.size = CGSize(width: 80, height: 80)
        scene.addChild(wheelFrontSprite)
        
        headlightSprite = SKSpriteNode(imageNamed: "headlight")
        headlightSprite.position = CGPoint(x: 480, y: 240)
        headlightSprite.size = CGSize(width: 60, height: 30)
        scene.addChild(headlightSprite)
        
        brakelightSprite = SKSpriteNode(imageNamed: "brakelight")
        brakelightSprite.position = CGPoint(x: 50, y: 250)
        brakelightSprite.size = CGSize(width: 40, height: 30)
        scene.addChild(brakelightSprite)
        
        wiperSprite = SKSpriteNode(imageNamed: "wiper")
        wiperSprite.anchorPoint = CGPoint(x: 1, y: 0)
        wiperSprite.position = CGPoint(x: 347, y: 280)
        wiperSprite.size = CGSize(width: 50, height: 50)
        scene.addChild(wiperSprite)
        
        acceleratorPedalSprite = SKSpriteNode(imageNamed: "pedal")
        acceleratorPedalSprite.size = CGSize(width: 30, height: 60)
        acceleratorPedalSprite.position = CGPoint(x: 480, y: 260)
        scene.addChild(acceleratorPedalSprite)
        
        brakePedalSprite = SKSpriteNode(imageNamed: "pedal")
        brakePedalSprite.size = CGSize(width: 30, height: 60)
        brakePedalSprite.position = CGPoint(x: 32, y: 260)
        scene.addChild(brakePedalSprite)
        
        headlightSprite.isHidden = true
        brakelightSprite.isHidden = true
        
        presentScene(scene)
        
    }
    
    public func speedUp(){
        wheelBackSprite.run(SKAction.repeatForever((SKAction.rotate(byAngle: (-2) * .pi, duration: 2))))
        wheelFrontSprite.run(SKAction.repeatForever((SKAction.rotate(byAngle: (-2) * .pi, duration: 2))))
        backgroundSprite0.run(SKAction.repeatForever((SKAction.sequence([SKAction.moveBy(x: -512, y: 0, duration: 3), SKAction.move(to: CGPoint(x: 256, y: 256), duration: 0)]))), withKey: "scroll")
        backgroundSprite1.run(SKAction.repeatForever((SKAction.sequence([SKAction.moveBy(x: -512, y: 0, duration: 3), SKAction.move(to: CGPoint(x: 256 + 512, y: 256), duration: 0)]))), withKey: "scroll")
        carBodySprite.run(SKAction.repeatForever(SKAction.sequence([SKAction.moveBy(x: 0, y: 3, duration: 0.24), SKAction.moveBy(x: 0, y: -3, duration: 0.24)])), withKey: "bounce")
        wheelBackSprite.run(SKAction.repeatForever(SKAction.sequence([SKAction.moveBy(x: 0, y: 3, duration: 0.24), SKAction.moveBy(x: 0, y: -3, duration: 0.24)])), withKey: "bounce")
        wheelFrontSprite.run(SKAction.repeatForever(SKAction.sequence([SKAction.moveBy(x: 0, y: 3, duration: 0.24), SKAction.moveBy(x: 0, y: -3, duration: 0.24)])), withKey: "bounce")
        headlightSprite.run(SKAction.repeatForever(SKAction.sequence([SKAction.moveBy(x: 0, y: 3, duration: 0.24), SKAction.moveBy(x: 0, y: -3, duration: 0.24)])), withKey: "bounce")
        brakelightSprite.run(SKAction.repeatForever(SKAction.sequence([SKAction.moveBy(x: 0, y: 3, duration: 0.24), SKAction.moveBy(x: 0, y: -3, duration: 0.24)])), withKey: "bounce")
        wiperSprite.run(SKAction.repeatForever(SKAction.sequence([SKAction.moveBy(x: 0, y: 3, duration: 0.24), SKAction.moveBy(x: 0, y: -3, duration: 0.24)])), withKey: "bounce")
    }
    
    public func slowDown(){
        wheelBackSprite.run(SKAction.repeatForever((SKAction.rotate(byAngle: (-1) * .pi, duration: 2))))
        wheelFrontSprite.run(SKAction.repeatForever((SKAction.rotate(byAngle: (-1) * .pi, duration: 2))))
        backgroundSprite0.removeAction(forKey: "scroll")
        backgroundSprite1.removeAction(forKey: "scroll")
        backgroundSprite0.run(SKAction.repeatForever((SKAction.sequence([SKAction.moveBy(x: -512, y: 0, duration: 6), SKAction.move(to: CGPoint(x: 256, y: 256), duration: 0)]))), withKey: "scroll")
        backgroundSprite1.run(SKAction.repeatForever((SKAction.sequence([SKAction.moveBy(x: -512, y: 0, duration: 6), SKAction.move(to: CGPoint(x: 256 + 512, y: 256), duration: 0)]))), withKey: "scroll")
    }
    
    public func stop(){
        wheelBackSprite.run(SKAction.repeatForever((SKAction.rotate(byAngle: (0) * .pi, duration: 2))))
        wheelFrontSprite.run(SKAction.repeatForever((SKAction.rotate(byAngle: (0) * .pi, duration: 2))))
        backgroundSprite0.removeAction(forKey: "scroll")
        backgroundSprite1.removeAction(forKey: "scroll")
        carBodySprite.removeAction(forKey: "bounce")
        wheelBackSprite.removeAction(forKey: "bounce")
        wheelFrontSprite.removeAction(forKey: "bounce")
        headlightSprite.removeAction(forKey: "bounce")
        brakelightSprite.removeAction(forKey: "bounce")
        wiperSprite.removeAction(forKey: "bounce")
    }
    
    public func turnOnHeadlight(){
        headlightSprite.isHidden = false
    }
    
    public func turnOffHeadlight(){
        headlightSprite.isHidden = true
    }
    
    public func turnOnBrakelight(){
        brakelightSprite.isHidden = false
    }
    
    public func turnOffBrakelight(){
        brakelightSprite.isHidden = true
    }
    
    public func turnOnWiper(){
        wiperSprite.run(SKAction.repeatForever(SKAction.sequence([SKAction.rotate(byAngle: 0.08 * .pi, duration: 1), SKAction.rotate(byAngle: -0.08 * .pi, duration: 1)])), withKey: "wipe")
    }
    
    public func turnOffWiper(){
        wiperSprite.removeAction(forKey: "wipe")
    }
    
    public func startRaining(){
        rainParticle = SKEmitterNode()
        rainParticle.particleLifetime = 1
        rainParticle.particleBlendMode = .alpha
        rainParticle.particleBirthRate = 40
        rainParticle.particleSpeed = 320
        rainParticle.emissionAngle = 1.5 * .pi
        rainParticle.particleSize = CGSize(width: 3, height: 4)
        rainParticle.particleColor = UIColor.blue
        rainParticle.position = CGPoint(x: 256, y: 500)
        rainParticle.particlePositionRange = CGVector(dx: (self.scene?.frame.size.width)!, dy: 0)
        self.scene?.addChild(rainParticle)
    }
    
    public func becomeNight(){
        backgroundSprite0.texture = SKTexture(imageNamed: "background_night")
        backgroundSprite1.texture = SKTexture(imageNamed: "background_night")
    }
    
    public func becomeDay(){
        backgroundSprite0.texture = SKTexture(imageNamed: "background")
        backgroundSprite1.texture = SKTexture(imageNamed: "background")
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (abs((touches.first?.location(in: brakePedalSprite).x)!) <= (brakePedalSprite.size.width / 2) && abs((touches.first?.location(in: brakePedalSprite).y)!) <= (brakePedalSprite.size.height / 2)){
            print("brakePedalSprite tapped")
            brakePedalSpriteTapped = true
        }
        else if (abs((touches.first?.location(in: acceleratorPedalSprite).x)!) <= (acceleratorPedalSprite.size.width / 2) && abs((touches.first?.location(in: acceleratorPedalSprite).y)!) <= (acceleratorPedalSprite.size.height / 2)){
            print("acceleratorPedalSprite tapped")
            acceleratorPedalSpriteTapped = true
        }
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touches ended")
        brakePedalSpriteTapped = false
        acceleratorPedalSpriteTapped = false
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
