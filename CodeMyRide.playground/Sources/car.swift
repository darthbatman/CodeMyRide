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
    public var rainButtonTapped: Bool = false
    public var dayNightButtonTapped: Bool = false
    
    public var isInMotion: Bool = false
    public var isRaining: Bool = false
    public var isWiping: Bool = false
    public var isDay: Bool = true
    
    public var rainButton: SKSpriteNode = SKSpriteNode()
    public var dayNightButton: SKSpriteNode = SKSpriteNode()
    
    public var rainParticle: SKEmitterNode = SKEmitterNode()
    
    public var controlPanel: SKSpriteNode = SKSpriteNode()
    
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
        
        controlPanel.size = CGSize(width: scene.frame.size.width, height: 60)
        controlPanel.position = CGPoint(x: scene.frame.size.width / 2, y: 30)
        controlPanel.color = UIColor.gray
        scene.addChild(controlPanel)
        
        acceleratorPedalSprite = SKSpriteNode(imageNamed: "pedal")
        acceleratorPedalSprite.size = CGSize(width: 30, height: 60)
        acceleratorPedalSprite.position = CGPoint(x: 480, y: 30)
        scene.addChild(acceleratorPedalSprite)
        
        brakePedalSprite = SKSpriteNode(imageNamed: "pedal")
        brakePedalSprite.size = CGSize(width: 30, height: 60)
        brakePedalSprite.position = CGPoint(x: 440, y: 30)
        scene.addChild(brakePedalSprite)
        
        headlightSprite.isHidden = true
        brakelightSprite.isHidden = true
        
        rainButton.size = CGSize(width: 50, height: 50)
        rainButton.position = CGPoint(x: 50, y: 30)
        rainButton.color = UIColor.blue
        scene.addChild(rainButton)
        
        dayNightButton.size = CGSize(width: 50, height: 50)
        dayNightButton.position = CGPoint(x: 120, y: 30)
        dayNightButton.color = UIColor.black
        scene.addChild(dayNightButton)
        
        presentScene(scene)
        
        _ = Timer.scheduledTimer(withTimeInterval: 0.0001, repeats: true) { timer in
            
            if (self.backgroundSprite0.frame.maxX <= 0){
                self.backgroundSprite0.position = CGPoint(x: self.backgroundSprite1.position.x + 512, y: 256)
            }
            if (self.backgroundSprite1.frame.maxX <= 0){
                self.backgroundSprite1.position = CGPoint(x: self.backgroundSprite0.position.x + 512, y: 256)
            }
            
        }
        
    }
    
    public func speedUp(){
        if (!isInMotion){
            isInMotion = true
            wheelBackSprite.run(SKAction.repeatForever((SKAction.rotate(byAngle: (-2) * .pi, duration: 2))), withKey: "rotate")
        wheelFrontSprite.run(SKAction.repeatForever((SKAction.rotate(byAngle: (-2) * .pi, duration: 2))), withKey: "rotate")
        backgroundSprite0.run(SKAction.repeatForever((SKAction.sequence([SKAction.moveBy(x: -512, y: 0, duration: 3)]))), withKey: "scroll")
        backgroundSprite1.run(SKAction.repeatForever((SKAction.sequence([SKAction.moveBy(x: -512, y: 0, duration: 3)]))), withKey: "scroll")
        carBodySprite.run(SKAction.repeatForever(SKAction.sequence([SKAction.moveBy(x: 0, y: 3, duration: 0.24), SKAction.moveBy(x: 0, y: -3, duration: 0.24)])), withKey: "bounce")
        wheelBackSprite.run(SKAction.repeatForever(SKAction.sequence([SKAction.moveBy(x: 0, y: 3, duration: 0.24), SKAction.moveBy(x: 0, y: -3, duration: 0.24)])), withKey: "bounce")
        wheelFrontSprite.run(SKAction.repeatForever(SKAction.sequence([SKAction.moveBy(x: 0, y: 3, duration: 0.24), SKAction.moveBy(x: 0, y: -3, duration: 0.24)])), withKey: "bounce")
        headlightSprite.run(SKAction.repeatForever(SKAction.sequence([SKAction.moveBy(x: 0, y: 3, duration: 0.24), SKAction.moveBy(x: 0, y: -3, duration: 0.24)])), withKey: "bounce")
        brakelightSprite.run(SKAction.repeatForever(SKAction.sequence([SKAction.moveBy(x: 0, y: 3, duration: 0.24), SKAction.moveBy(x: 0, y: -3, duration: 0.24)])), withKey: "bounce")
        wiperSprite.run(SKAction.repeatForever(SKAction.sequence([SKAction.moveBy(x: 0, y: 3, duration: 0.24), SKAction.moveBy(x: 0, y: -3, duration: 0.24)])), withKey: "bounce")
        }
    }
    
//    public func slowDown(){
//        wheelBackSprite.run(SKAction.repeatForever((SKAction.rotate(byAngle: (-1) * .pi, duration: 2))))
//        wheelFrontSprite.run(SKAction.repeatForever((SKAction.rotate(byAngle: (-1) * .pi, duration: 2))))
//        backgroundSprite0.removeAction(forKey: "scroll")
//        backgroundSprite1.removeAction(forKey: "scroll")
//        backgroundSprite0.run(SKAction.repeatForever((SKAction.sequence([SKAction.moveBy(x: -512, y: 0, duration: 6), SKAction.move(to: CGPoint(x: 256, y: 256), duration: 0)]))), withKey: "scroll")
//        backgroundSprite1.run(SKAction.repeatForever((SKAction.sequence([SKAction.moveBy(x: -512, y: 0, duration: 6), SKAction.move(to: CGPoint(x: 256 + 512, y: 256), duration: 0)]))), withKey: "scroll")
//    }
    
    public func stop(){
        isInMotion = false
        wheelBackSprite.removeAction(forKey: "rotate")
        wheelFrontSprite.removeAction(forKey: "rotate")
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
        if (!isWiping){
            isWiping = true
            wiperSprite.run(SKAction.repeatForever(SKAction.sequence([SKAction.rotate(byAngle: 0.08 * .pi, duration: 1), SKAction.rotate(byAngle: -0.08 * .pi, duration: 1)])), withKey: "wipe")
        }
    }
    
    public func turnOffWiper(){
        wiperSprite.removeAction(forKey: "wipe")
        isWiping = false
        wiperSprite.run(SKAction.rotate(toAngle: 0, duration: 1))
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
    
    public func stopRaining(){
        rainParticle.removeFromParent()
    }
    
    public func becomeNight(){
        backgroundSprite0.texture = SKTexture(imageNamed: "background_night")
        backgroundSprite1.texture = SKTexture(imageNamed: "background_night")
        dayNightButton.color = UIColor.yellow
    }
    
    public func becomeDay(){
        backgroundSprite0.texture = SKTexture(imageNamed: "background")
        backgroundSprite1.texture = SKTexture(imageNamed: "background")
        dayNightButton.color = UIColor.black
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (abs((touches.first?.location(in: brakePedalSprite).x)!) <= (brakePedalSprite.size.width / 2) && abs((touches.first?.location(in: brakePedalSprite).y)!) <= (brakePedalSprite.size.height / 2)){
            brakePedalSpriteTapped = true
        }
        else if (abs((touches.first?.location(in: acceleratorPedalSprite).x)!) <= (acceleratorPedalSprite.size.width / 2) && abs((touches.first?.location(in: acceleratorPedalSprite).y)!) <= (acceleratorPedalSprite.size.height / 2)){
            acceleratorPedalSpriteTapped = true
        }
        else if (abs((touches.first?.location(in: rainButton).x)!) <= (rainButton.size.width / 2) && abs((touches.first?.location(in: rainButton).y)!) <= (rainButton.size.height / 2)){
            rainButtonTapped = true
            if (!isRaining){
                startRaining()
                isRaining = true
            }
            else {
                stopRaining()
                isRaining = false
            }
        }
        else if (abs((touches.first?.location(in: dayNightButton).x)!) <= (dayNightButton.size.width / 2) && abs((touches.first?.location(in: dayNightButton).y)!) <= (dayNightButton.size.height / 2)){
            dayNightButtonTapped = true
            if (isDay){
                becomeNight()
                isDay = false
            }
            else {
                becomeDay()
                isDay = true
            }
        }
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        brakePedalSpriteTapped = false
        acceleratorPedalSpriteTapped = false
        rainButtonTapped = false
        dayNightButtonTapped = false
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
