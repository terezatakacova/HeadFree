import Foundation
import CoreGraphics
import ImageIO

let size = 1024
let colorSpace = CGColorSpaceCreateDeviceRGB()
let ctx = CGContext(data: nil, width: size, height: size, bitsPerComponent: 8, bytesPerRow: size * 4, space: colorSpace, bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue)!

let cream = CGColor(red: 0.955, green: 0.935, blue: 0.885, alpha: 1)
let olive = CGColor(red: 0.43, green: 0.51, blue: 0.355, alpha: 1)
let oliveLight = CGColor(red: 0.60, green: 0.66, blue: 0.50, alpha: 1)
let olivePale = CGColor(red: 0.72, green: 0.75, blue: 0.63, alpha: 1)
let line = CGColor(red: 0.54, green: 0.50, blue: 0.38, alpha: 1)

ctx.setFillColor(cream)
ctx.addPath(CGPath(roundedRect: CGRect(x: 4, y: 4, width: 1016, height: 1016), cornerWidth: 115, cornerHeight: 115, transform: nil))
ctx.fillPath()

func leaf(_ x: CGFloat, _ y: CGFloat, _ w: CGFloat, _ h: CGFloat, _ angle: CGFloat, _ color: CGColor) {
    ctx.saveGState()
    ctx.translateBy(x: x, y: y)
    ctx.rotate(by: angle)
    let p = CGMutablePath()
    p.move(to: CGPoint(x: 0, y: -h/2))
    p.addCurve(to: CGPoint(x: 0, y: h/2), control1: CGPoint(x: -w/2, y: -h/5), control2: CGPoint(x: -w/2, y: h/3))
    p.addCurve(to: CGPoint(x: 0, y: -h/2), control1: CGPoint(x: w/2, y: h/3), control2: CGPoint(x: w/2, y: -h/5))
    p.closeSubpath()
    ctx.setFillColor(color)
    ctx.addPath(p)
    ctx.fillPath()
    ctx.setStrokeColor(line)
    ctx.setLineWidth(2)
    ctx.move(to: CGPoint(x: 0, y: h/2 - 5))
    ctx.addLine(to: CGPoint(x: 0, y: -h/2 + 5))
    ctx.strokePath()
    ctx.restoreGState()
}

ctx.saveGState()
ctx.setStrokeColor(line)
ctx.setLineWidth(7)
ctx.setLineCap(.round)
ctx.move(to: CGPoint(x: 235, y: 875))
ctx.addCurve(to: CGPoint(x: 390, y: 250), control1: CGPoint(x: 250, y: 610), control2: CGPoint(x: 325, y: 380))
ctx.strokePath()
ctx.restoreGState()

leaf(275, 720, 190, 285, -0.82, oliveLight)
leaf(335, 610, 205, 305, -0.55, olive)
leaf(300, 495, 190, 285, -0.95, olivePale)
leaf(385, 395, 190, 290, -0.30, olive)
leaf(405, 285, 185, 285, 0.18, oliveLight)
leaf(475, 470, 190, 285, 0.62, oliveLight)
leaf(450, 590, 200, 300, 0.82, olive)
leaf(355, 760, 175, 255, 1.05, olivePale)

ctx.saveGState()
ctx.setStrokeColor(line)
ctx.setLineWidth(5)
ctx.setLineCap(.round)
let face = CGMutablePath()
face.move(to: CGPoint(x: 600, y: 270))
face.addCurve(to: CGPoint(x: 720, y: 330), control1: CGPoint(x: 690, y: 260), control2: CGPoint(x: 730, y: 290))
face.addCurve(to: CGPoint(x: 770, y: 410), control1: CGPoint(x: 755, y: 355), control2: CGPoint(x: 790, y: 380))
face.addCurve(to: CGPoint(x: 755, y: 475), control1: CGPoint(x: 780, y: 440), control2: CGPoint(x: 765, y: 455))
face.addCurve(to: CGPoint(x: 790, y: 505), control1: CGPoint(x: 772, y: 485), control2: CGPoint(x: 785, y: 500))
face.addCurve(to: CGPoint(x: 760, y: 530), control1: CGPoint(x: 805, y: 510), control2: CGPoint(x: 790, y: 525))
face.addCurve(to: CGPoint(x: 700, y: 535), control1: CGPoint(x: 735, y: 535), control2: CGPoint(x: 715, y: 540))
face.addCurve(to: CGPoint(x: 680, y: 600), control1: CGPoint(x: 690, y: 555), control2: CGPoint(x: 675, y: 585))
face.addCurve(to: CGPoint(x: 635, y: 680), control1: CGPoint(x: 665, y: 625), control2: CGPoint(x: 650, y: 655))
ctx.addPath(face)
ctx.strokePath()

ctx.setLineWidth(4)
ctx.move(to: CGPoint(x: 704, y: 430))
ctx.addCurve(to: CGPoint(x: 738, y: 430), control1: CGPoint(x: 715, y: 422), control2: CGPoint(x: 730, y: 422))
ctx.strokePath()
ctx.move(to: CGPoint(x: 704, y: 468))
ctx.addCurve(to: CGPoint(x: 750, y: 470), control1: CGPoint(x: 720, y: 478), control2: CGPoint(x: 738, y: 478))
ctx.strokePath()
ctx.restoreGState()

let image = ctx.makeImage()!
let out = CommandLine.arguments.dropFirst().first ?? "AppIcon.png"
let url = URL(fileURLWithPath: out)
let dest = CGImageDestinationCreateWithURL(url as CFURL, "public.png" as CFString, 1, nil)!
CGImageDestinationAddImage(dest, image, nil)
CGImageDestinationFinalize(dest)
print(out)
