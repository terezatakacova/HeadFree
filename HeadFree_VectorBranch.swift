// MARK: - FINAL INTRO BRANCH

private struct HFIntroLeaf: View {
    let color: Color
    let rotation: Double
    let scale: CGFloat

    var body: some View {
        ZStack {
            Path { p in
                p.move(to: CGPoint(x: 36, y: 112))
                p.addCurve(to: CGPoint(x: 32, y: 8), control1: CGPoint(x: -2, y: 65), control2: CGPoint(x: 4, y: 22))
                p.addCurve(to: CGPoint(x: 36, y: 112), control1: CGPoint(x: 72, y: 72), control2: CGPoint(x: 70, y: 32))
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

private struct HFIntroFace: View {
    var body: some View {
        Path { p in
            p.move(to: CGPoint(x: 238, y: 54))
            p.addCurve(to: CGPoint(x: 282, y: 78), control1: CGPoint(x: 270, y: 50), control2: CGPoint(x: 286, y: 62))
            p.addCurve(to: CGPoint(x: 304, y: 116), control1: CGPoint(x: 296, y: 86), control2: CGPoint(x: 314, y: 102))
            p.addCurve(to: CGPoint(x: 298, y: 145), control1: CGPoint(x: 310, y: 130), control2: CGPoint(x: 306, y: 140))
            p.addCurve(to: CGPoint(x: 314, y: 158), control1: CGPoint(x: 304, y: 149), control2: CGPoint(x: 312, y: 154))
            p.addCurve(to: CGPoint(x: 300, y: 170), control1: CGPoint(x: 320, y: 160), control2: CGPoint(x: 312, y: 168))
            p.addCurve(to: CGPoint(x: 270, y: 172), control1: CGPoint(x: 288, y: 172), control2: CGPoint(x: 280, y: 175))
            p.addCurve(to: CGPoint(x: 258, y: 205), control1: CGPoint(x: 266, y: 182), control2: CGPoint(x: 258, y: 196))
            p.addCurve(to: CGPoint(x: 235, y: 248), control1: CGPoint(x: 252, y: 218), control2: CGPoint(x: 244, y: 236))
        }
        .stroke(hfLine, style: StrokeStyle(lineWidth: 2.2, lineCap: .round, lineJoin: .round))
        Path { p in
            p.move(to: CGPoint(x: 268, y: 124))
            p.addCurve(to: CGPoint(x: 285, y: 124), control1: CGPoint(x: 274, y: 120), control2: CGPoint(x: 281, y: 120))
            p.move(to: CGPoint(x: 269, y: 145))
            p.addCurve(to: CGPoint(x: 290, y: 146), control1: CGPoint(x: 275, y: 150), control2: CGPoint(x: 285, y: 150))
        }
        .stroke(hfLine, style: StrokeStyle(lineWidth: 1.8, lineCap: .round))
    }
}

struct HFIntroBotanicalBranch: View {
    var body: some View {
        ZStack {
            Path { p in
                p.move(to: CGPoint(x: 82, y: 430))
                p.addCurve(to: CGPoint(x: 112, y: 250), control1: CGPoint(x: 80, y: 350), control2: CGPoint(x: 96, y: 290))
                p.addCurve(to: CGPoint(x: 132, y: 72), control1: CGPoint(x: 112, y: 190), control2: CGPoint(x: 126, y: 120))
            }
            .stroke(hfGreen.opacity(0.58), style: StrokeStyle(lineWidth: 4, lineCap: .round))

            HFIntroLeaf(color: hfGreenLight, rotation: -62, scale: 1.10).offset(x: 32, y: 118)
            HFIntroLeaf(color: hfGreen, rotation: -38, scale: 1.02).offset(x: 20, y: 200)
            HFIntroLeaf(color: hfGreenLight, rotation: -18, scale: 0.96).offset(x: 35, y: 286)
            HFIntroLeaf(color: hfGreen, rotation: 18, scale: 1.02).offset(x: 95, y: 170)
            HFIntroLeaf(color: hfGreenLight, rotation: 34, scale: 0.92).offset(x: 112, y: 250)
            HFIntroLeaf(color: hfGreen, rotation: 48, scale: 0.88).offset(x: 126, y: 330)
            HFIntroLeaf(color: hfGreenLight, rotation: 70, scale: 0.78).offset(x: 96, y: 88)

            HFIntroFace()
                .offset(x: 12, y: 86)
        }
        .allowsHitTesting(false)
    }
}
