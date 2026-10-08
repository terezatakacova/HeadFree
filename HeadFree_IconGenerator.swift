import Foundation
import CoreGraphics
import ImageIO

let size = 1024
let cs = CGColorSpaceCreateDeviceRGB()
let ctx = CGContext(data: nil, width: size, height: size, bitsPerComponent: 8,
                    bytesPerRow: size * 4, space: cs,
                    bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue)!

let paper = CGColor(red: 0.955, green: 0.935, blue: 0.885, alpha: 1)
let sage = CGColor(red: 0.47, green: 0.56, blue: 0.39, alpha: 0.78)
let sage2 = CGColor(red: 0.59, green: 0.65, blue: 0.48, alpha: 0.70)
let olive = CGColor(red: 0.34, green: 0.43, blue: 0.29, alpha: 0.82)
let olive2 = CGColor(red: 0.41, green: 0.49, blue: 0.32, alpha: 0.62)
let skin = CGColor(red: 0.89, green: 0.84, blue: 0.73, alpha: 1)
let ink = CGColor(red: 0.28, green: 0.29, blue: 0.23, alpha: 0.72)

ctx.setFillColor(paper)
ctx.addPath(CGPath(roundedRect: CGRect(x: 4, y: 4, width: 1016, height: 1016),
                   cornerWidth: 120, cornerHeight: 120, transform: nil))
ctx.fillPath()

func leaf(_ x: CGFloat, _ y: CGFloat, _ w: CGFloat, _ h: CGFloat, _ angle: CGFloat, _ color: CGColor) {
    ctx.saveGState()
    ctx.translateBy(x: x, y: y)
    ctx.rotate(by: angle)
    let p = CGMutablePath()
    p.move(to: CGPoint(x: 0, y: -h/2))
    p.addCurve(to: CGPoint(x: 0, y: h/2),
               control1: CGPoint(x: -w/2, y: -h/6),
               control2: CGPoint(x: -w/2, y: h/3))
    p.addCurve(to: CGPoint(x: 0, y: -h/2),
               control1: CGPoint(x: w/2, y: h/3),
               control2: CGPoint(x: w/2, y: -h/6))
    p.closeSubpath()
    ctx.setFillColor(color)
    ctx.addPath(p)
    ctx.fillPath()
    ctx.restoreGState()
}

func stem(_ from: CGPoint, _ to: CGPoint, _ width: CGFloat = 8) {
    ctx.saveGState()
    ctx.setStrokeColor(olive)
    ctx.setLineWidth(width)
    ctx.setLineCap(.round)
    ctx.move(to: from)
    ctx.addCurve(to: to,
                 control1: CGPoint(x: from.x + 20, y: from.y - 170),
                 control2: CGPoint(x: to.x - 40, y: to.y + 110))
    ctx.strokePath()
    ctx.restoreGState()
}

stem(CGPoint(x: 245, y: 850), CGPoint(x: 465, y: 300), 9)
leaf(270, 690, 190, 310, -0.82, sage2)
leaf(320, 575, 205, 320, -0.55, sage)
leaf(345, 455, 185, 290, -0.90, olive2)
leaf(390, 345, 180, 285, -0.35, olive)
leaf(455, 470, 190, 300, 0.62, sage2)
leaf(445, 595, 195, 295, 0.84, olive)
leaf(365, 770, 170, 255, 1.05, sage2)
leaf(500, 345, 155, 235, 0.35, sage)

let face = CGMutablePath()
face.move(to: CGPoint(x: 585, y: 300))
face.addCurve(to: CGPoint(x: 710, y: 345), control1: CGPoint(x: 665, y: 270), control2: CGPoint(x: 715, y: 300))
face.addCurve(to: CGPoint(x: 755, y: 420), control1: CGPoint(x: 745, y: 365), control2: CGPoint(x: 780, y: 390))
face.addCurve(to: CGPoint(x: 735, y: 470), control1: CGPoint(x: 765, y: 445), control2: CGPoint(x: 750, y: 458))
face.addLine(to: CGPoint(x: 775, y: 505))
face.addCurve(to: CGPoint(x: 735, y: 535), control1: CGPoint(x: 795, y: 518), control2: CGPoint(x: 775, y: 535))
face.addCurve(to: CGPoint(x: 675, y: 545), control1: CGPoint(x: 710, y: 545), control2: CGPoint(x: 690, y: 548))
face.addCurve(to: CGPoint(x: 650, y: 620), control1: CGPoint(x: 665, y: 565), control2: CGPoint(x: 650, y: 600))
face.addCurve(to: CGPoint(x: 600, y: 700), control1: CGPoint(x: 640, y: 655), control2: CGPoint(x: 620, y: 680))
face.addCurve(to: CGPoint(x: 560, y: 610), control1: CGPoint(x: 575, y: 675), control2: CGPoint(x: 555, y: 640))
face.addCurve(to: CGPoint(x: 565, y: 450), control1: CGPoint(x: 555, y: 560), control2: CGPoint(x: 550, y: 500))
face.closeSubpath()
ctx.setFillColor(skin)
ctx.addPath(face)
ctx.fillPath()

ctx.saveGState()
ctx.setStrokeColor(ink)
ctx.setLineWidth(5)
ctx.setLineCap(.round)
ctx.move(to: CGPoint(x: 694, y: 431))
ctx.addCurve(to: CGPoint(x: 735, y: 430), control1: CGPoint(x: 710, y: 423), control2: CGPoint(x: 727, y: 423))
ctx.strokePath()
ctx.restoreGState()

let image = ctx.makeImage()!
let out = CommandLine.arguments.dropFirst().first ?? "AppIcon.png"
let url = URL(fileURLWithPath: out)
let dest = CGImageDestinationCreateWithURL(url as CFURL, "public.png" as CFString, 1, nil)!
CGImageDestinationAddImage(dest, image, nil)
CGImageDestinationFinalize(dest)
print(out)
