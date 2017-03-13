import SpriteKit
import PlaygroundSupport

var frame = CGRect(x: 0, y: 0, width: 512, height: 512)
var scene = SKScene(size: frame.size)

var backgroundSprite = SKSpriteNode(imageNamed: "background")
backgroundSprite.scale(to: frame.size)
backgroundSprite.position = CGPoint(x: scene.frame.size.width / 2, y: scene.frame.size.height / 2)
scene.addChild(backgroundSprite)

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
wiperSprite.position = CGPoint(x: 322, y: 305)
wiperSprite.size = CGSize(width: 50, height: 50)
scene.addChild(wiperSprite)

var view = SKView(frame: frame)
view.presentScene(scene)

PlaygroundPage.current.liveView = view