import SpriteKit
import PlaygroundSupport

var frame = CGRect(x: 0, y: 0, width: 512, height: 512)
var scene = SKScene(size: frame.size)

var backgroundSprite0 = SKSpriteNode(imageNamed: "background")
backgroundSprite0.scale(to: frame.size)
backgroundSprite0.position = CGPoint(x: scene.frame.size.width / 2, y: scene.frame.size.height / 2)
scene.addChild(backgroundSprite0)

var backgroundSprite1 = SKSpriteNode(imageNamed: "background")
backgroundSprite1.scale(to: frame.size)
backgroundSprite1.position = CGPoint(x: scene.frame.size.width / 2 + 512, y: scene.frame.size.height / 2)
scene.addChild(backgroundSprite1)

var carBodySprite = SKSpriteNode(imageNamed: "car_body_grey")
carBodySprite.position = CGPoint(x: 256, y: 260)
carBodySprite.size = CGSize(width: 380, height: 160)
scene.addChild(carBodySprite)

var wheelBackSprite = SKSpriteNode(imageNamed: "car_wheel")
wheelBackSprite.position = CGPoint(x: 124, y: 200)
wheelBackSprite.size = CGSize(width: 80, height: 80)
scene.addChild(wheelBackSprite)

var wheelFrontSprite = SKSpriteNode(imageNamed: "car_wheel")
wheelFrontSprite.position = CGPoint(x: 380, y: 200)
wheelFrontSprite.size = CGSize(width: 80, height: 80)
scene.addChild(wheelFrontSprite)

var headlightSprite = SKSpriteNode(imageNamed: "headlight")
headlightSprite.position = CGPoint(x: 480, y: 240)
headlightSprite.size = CGSize(width: 60, height: 30)
scene.addChild(headlightSprite)

var brakelightSprite = SKSpriteNode(imageNamed: "brakelight")
brakelightSprite.position = CGPoint(x: 50, y: 250)
brakelightSprite.size = CGSize(width: 40, height: 30)
scene.addChild(brakelightSprite)

var wiperSprite = SKSpriteNode(imageNamed: "wiper")
wiperSprite.anchorPoint = CGPoint(x: 1, y: 0)
wiperSprite.position = CGPoint(x: 347, y: 280)
wiperSprite.size = CGSize(width: 50, height: 50)
scene.addChild(wiperSprite)

var view = SKView(frame: frame)
view.presentScene(scene)

PlaygroundPage.current.liveView = view

// wheels: high speed
wheelBackSprite.run(SKAction.repeatForever((SKAction.rotate(byAngle: (-2) * .pi, duration: 2))))
wheelFrontSprite.run(SKAction.repeatForever((SKAction.rotate(byAngle: (-2) * .pi, duration: 2))))

// wheels: low speed
wheelBackSprite.run(SKAction.repeatForever((SKAction.rotate(byAngle: (1) * .pi, duration: 2))))
wheelFrontSprite.run(SKAction.repeatForever((SKAction.rotate(byAngle: (1) * .pi, duration: 2))))

// wheels: stopped after slowing down
wheelBackSprite.run(SKAction.repeatForever((SKAction.rotate(byAngle: (1) * .pi, duration: 2))))
wheelFrontSprite.run(SKAction.repeatForever((SKAction.rotate(byAngle: (1) * .pi, duration: 2))))

// full car bounce
carBodySprite.run(SKAction.repeatForever(SKAction.sequence([SKAction.moveBy(x: 0, y: 3, duration: 0.24), SKAction.moveBy(x: 0, y: -3, duration: 0.24)])))
wheelBackSprite.run(SKAction.repeatForever(SKAction.sequence([SKAction.moveBy(x: 0, y: 3, duration: 0.24), SKAction.moveBy(x: 0, y: -3, duration: 0.24)])))
wheelFrontSprite.run(SKAction.repeatForever(SKAction.sequence([SKAction.moveBy(x: 0, y: 3, duration: 0.24), SKAction.moveBy(x: 0, y: -3, duration: 0.24)])))
headlightSprite.run(SKAction.repeatForever(SKAction.sequence([SKAction.moveBy(x: 0, y: 3, duration: 0.24), SKAction.moveBy(x: 0, y: -3, duration: 0.24)])))
brakelightSprite.run(SKAction.repeatForever(SKAction.sequence([SKAction.moveBy(x: 0, y: 3, duration: 0.24), SKAction.moveBy(x: 0, y: -3, duration: 0.24)])))
wiperSprite.run(SKAction.repeatForever(SKAction.sequence([SKAction.moveBy(x: 0, y: 3, duration: 0.24), SKAction.moveBy(x: 0, y: -3, duration: 0.24)])))

// turn off headlight
headlightSprite.isHidden = true

// turn off brakelight
brakelightSprite.isHidden = true

// background scroll high speed
backgroundSprite0.run(SKAction.repeatForever((SKAction.sequence([SKAction.moveBy(x: -512, y: 0, duration: 3), SKAction.move(to: CGPoint(x: 256, y: 256), duration: 0)]))), withKey: "scroll")
backgroundSprite1.run(SKAction.repeatForever((SKAction.sequence([SKAction.moveBy(x: -512, y: 0, duration: 3), SKAction.move(to: CGPoint(x: 256 + 512, y: 256), duration: 0)]))), withKey: "scroll")
// background scroll low speed
backgroundSprite0.removeAction(forKey: "scroll")
backgroundSprite1.removeAction(forKey: "scroll")
backgroundSprite0.run(SKAction.repeatForever((SKAction.sequence([SKAction.moveBy(x: -512, y: 0, duration: 6), SKAction.move(to: CGPoint(x: 256, y: 256), duration: 0)]))), withKey: "scroll")
backgroundSprite1.run(SKAction.repeatForever((SKAction.sequence([SKAction.moveBy(x: -512, y: 0, duration: 6), SKAction.move(to: CGPoint(x: 256 + 512, y: 256), duration: 0)]))), withKey: "scroll")

// turn on windshield wiper
wiperSprite.run(SKAction.repeatForever(SKAction.sequence([SKAction.rotate(byAngle: 0.08 * .pi, duration: 1), SKAction.rotate(byAngle: -0.08 * .pi, duration: 1)])), withKey: "wipe")

// turn off windshield wiper
wiperSprite.removeAction(forKey: "wipe")

// start raining
var rainParticle = SKEmitterNode()
rainParticle.particleLifetime = 2
rainParticle.particleBlendMode = .alpha
rainParticle.particleBirthRate = 10
rainParticle.particleSpeed = 160
rainParticle.emissionAngle = 1.5 * .pi
rainParticle.particleSize = CGSize(width: 3, height: 4)
rainParticle.particleColor = UIColor.blue
rainParticle.position = CGPoint(x: 256, y: 500)
rainParticle.particlePositionRange = CGVector(dx: scene.frame.size.width, dy: 0)
scene.addChild(rainParticle)

