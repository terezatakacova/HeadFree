import Foundation
import CoreGraphics
import ImageIO
import CoreText

let size = 1024
let colorSpace = CGColorSpaceCreateDeviceRGB()
let ctx = CGContext(data: nil, width: size, height: size, bitsPerComponent: 8, bytesPerRow: size * 4, space: colorSpace, bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue)!

let cream = CGColor(red: 0.955, green: 0.935, blue: 0.885, alpha: 1)
let gold = CGColor(red: 0.76, green: 0.60, blue: 0.28, alpha: 1)
let olive = CGColor(red: 0.47, green: 0.52, blue: 0.38, alpha: 1)
let oliveLight = CGColor(red: 0.68, green: 0.71, blue: 0.56, alpha: 1)
let text = CGColor(red: 0.25, green: 0.23, blue: 0.17, alpha: 1)

ctx.setFillColor(cream)
ctx.addPath(CGPath(roundedRect: CGRect(x: 4, y: 4, width: 1016, height: 1016), cornerWidth: 115, cornerHeight: 115, transform: nil))
ctx.fillPath()

ctx.saveGState()
ctx.translateBy(x: 512, y: 510)
ctx.setStrokeColor(gold)
ctx.setLineWidth(7)
ctx.strokeEllipse(in: CGRect(x: -315, y: -315, width: 630, height: 630))
ctx.restoreGState()

func leaf(_ center: CGPoint, _ w: CGFloat, _ h: CGFloat, _ angle: CGFloat, _ color: CGColor) {
    ctx.saveGState()
    ctx.translateBy(x: center.x, y: center.y)
    ctx.rotate(by: angle)
    let p = CGMutablePath()
    p.move(to: CGPoint(x: 0, y: -h/2))
    p.addCurve(to: CGPoint(x: 0, y: h/2), control1: CGPoint(x: -w/2, y: -h/6), control2: CGPoint(x: -w/2, y: h/3))
    p.addCurve(to: CGPoint(x: 0, y: -h/2), control1: CGPoint(x: w/2, y: h/3), control2: CGPoint(x: w/2, y: -h/6))
    p.closeSubpath()
    ctx.setFillColor(color)
    ctx.addPath(p)
    ctx.fillPath()
    ctx.setStrokeColor(CGColor(red: 0.76, green: 0.60, blue: 0.28, alpha: 0.55))
    ctx.setLineWidth(3)
    ctx.move(to: CGPoint(x: 0, y: h/2-8))
    ctx.addLine(to: CGPoint(x: 0, y: -h/2+8))
    ctx.strokePath()
    ctx.restoreGState()
}

ctx.saveGState()
ctx.translateBy(x: 505, y: 505)
ctx.rotate(by: -0.62)
ctx.setStrokeColor(gold)
ctx.setLineWidth(10)
ctx.move(to: CGPoint(x: -175, y: 260))
ctx.addLine(to: CGPoint(x: 120, y: -235))
ctx.strokePath()
ctx.restoreGState()

leaf(CGPoint(x: 400, y: 590), 170, 270, -0.72, oliveLight)
leaf(CGPoint(x: 500, y: 450), 175, 290, -0.22, olive)
leaf(CGPoint(x: 620, y: 590), 180, 285, 0.35, oliveLight)
leaf(CGPoint(x: 665, y: 355), 185, 300, 0.55, olive)
leaf(CGPoint(x: 525, y: 690), 170, 260, 0.95, oliveLight)

let font = CTFontCreateWithName("Georgia" as CFString, 92, nil)
let attrs: [NSAttributedString.Key: Any] = [.font: font, .foregroundColor: text]
let title = NSAttributedString(string: "HeadFree", attributes: attrs)
let line = CTLineCreateWithAttributedString(title)
let bounds = CTLineGetBoundsWithOptions(line, [])
ctx.textPosition = CGPoint(x: (1024 - bounds.width) / 2, y: 90)
ctx.setFillColor(text)
CTLineDraw(line, ctx)

let image = ctx.makeImage()!
let out = CommandLine.arguments.dropFirst().first ?? "AppIcon.png"
let url = URL(fileURLWithPath: out)
let dest = CGImageDestinationCreateWithURL(url as CFURL, "public.png" as CFString, 1, nil)!
CGImageDestinationAddImage(dest, image, nil)
CGImageDestinationFinalize(dest)
print(out)
