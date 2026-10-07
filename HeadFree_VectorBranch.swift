// MARK: - FINAL INTRO BRANCH

private struct HFLeaf: View {
    let color: Color
    let rotation: Double
    let scale: CGFloat

    var body: some View {
        ZStack {
            Path { p in
                p.move(to: CGPoint(x: 36, y: 112))
                p.addCurve(to: CGPoint(x: 32, y: 8),
                           control1: CGPoint(x: -2, y: 65),
                           control2: CGPoint(x: 4, y: 22))
                p.addCurve(to: CGPoint(x: 36, y: 112),
                           control1: CGPoint(x: 72, y: 72),
                           control2: CGPoint(x: 70, y: 32))
            }
            .fill(color.opacity(0.88))

            Path { p in
                p.move(to: CGPoint(x: 36, y: 108))
                p.addLine(to: CGPoint(x: 33, y: 13))
            }
            .stroke(hfGreen.opacity(0.55), lineWidth: 1.2)
        }
        .frame(width: 72, height: 116)
        .scaleEffect(scale)
        .rotationEffect(.degrees(rotation))
    }
}

struct HFBotanicalBranch: View {
    var body: some View {
        ZStack {
            Path { p in
                p.move(to: CGPoint(x: 82, y: 430))
                p.addCurve(to: CGPoint(x: 112, y: 250),
                           control1: CGPoint(x: 80, y: 350),
                           control2: CGPoint(x: 96, y: 290))
                p.addCurve(to: CGPoint(x: 132, y: 72),
                           control1: CGPoint(x: 112, y: 190),
                           control2: CGPoint(x: 126, y: 120))
            }
            .stroke(hfGreen.opacity(0.58), style: StrokeStyle(lineWidth: 4, lineCap: .round))

            HFLeaf(color: hfGreenLight, rotation: -62, scale: 1.10).offset(x: 32, y: 118)
            HFLeaf(color: hfGreen, rotation: -38, scale: 1.02).offset(x: 20, y: 200)
            HFLeaf(color: hfGreenLight, rotation: -18, scale: 0.96).offset(x: 35, y: 286)
            HFLeaf(color: hfGreen, rotation: 18, scale: 1.02).offset(x: 95, y: 170)
            HFLeaf(color: hfGreenLight, rotation: 34, scale: 0.92).offset(x: 112, y: 250)
            HFLeaf(color: hfGreen, rotation: 48, scale: 0.88).offset(x: 126, y: 330)
            HFLeaf(color: hfGreenLight, rotation: 70, scale: 0.78).offset(x: 96, y: 88)
        }
        .allowsHitTesting(false)
    }
}
