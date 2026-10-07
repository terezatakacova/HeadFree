// MARK: - VECTOR BOTANICAL BRANCH

private struct HFLeaf: View {
    let color: Color
    let rotation: Double
    let scale: CGFloat

    var body: some View {
        ZStack {
            Path { path in
                path.move(to: CGPoint(x: 35, y: 108))
                path.addQuadCurve(to: CGPoint(x: 34, y: 8), control: CGPoint(x: -4, y: 48))
                path.addQuadCurve(to: CGPoint(x: 35, y: 108), control: CGPoint(x: 76, y: 55))
            }
            .fill(color)

            Path { path in
                path.move(to: CGPoint(x: 35, y: 105))
                path.addLine(to: CGPoint(x: 35, y: 12))
            }
            .stroke(hfGold.opacity(0.72), lineWidth: 1.4)
        }
        .frame(width: 70, height: 110)
        .scaleEffect(scale)
        .rotationEffect(.degrees(rotation))
    }
}

struct HFBotanicalBranch: View {
    var body: some View {
        ZStack {
            Circle()
                .trim(from: 0.08, to: 0.82)
                .stroke(hfGold.opacity(0.75), lineWidth: 2)
                .rotationEffect(.degrees(18))
                .frame(width: 150, height: 150)

            Capsule()
                .fill(hfGold.opacity(0.9))
                .frame(width: 5, height: 220)
                .rotationEffect(.degrees(-36))
                .offset(x: -10, y: 24)

            HFLeaf(color: hfGreenLight.opacity(0.95), rotation: -58, scale: 0.92).offset(x: -46, y: 24)
            HFLeaf(color: hfGreen.opacity(0.82), rotation: -28, scale: 0.98).offset(x: -18, y: -10)
            HFLeaf(color: hfGreenLight.opacity(0.9), rotation: 12, scale: 0.9).offset(x: 18, y: 16)
            HFLeaf(color: hfGreen.opacity(0.9), rotation: 38, scale: 1.0).offset(x: 30, y: -46)
            HFLeaf(color: hfGreenLight.opacity(0.82), rotation: 64, scale: 0.82).offset(x: 2, y: -82)
        }
        .allowsHitTesting(false)
    }
}
