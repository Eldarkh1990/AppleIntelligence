import SwiftUI

struct ContentView: View {
    let options = (1...11).map { "Option \($0)" }
    @State private var selectedOption: String?
    @State private var outputText: String = ""

    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [.black, .gray]), startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            VStack(spacing: 12) {
                Text("Apple Intelligence")
                    .font(.system(size: 28, weight: .semibold, design: .rounded))
                    .foregroundColor(.white)
                    .padding(.bottom, 20)

                ScrollView {
                    ForEach(options, id: \.self) { option in
                        Button(action: {
                            selectedOption = option
                            outputText = "You selected \(option).\nThis is a colorful AI response."
                        }) {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(.ultraThinMaterial)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(
                                            AngularGradient(
                                                gradient: Gradient(colors: [
                                                    .cyan, .blue, .purple, .pink, .cyan,
                                                ]),
                                                center: .center),
                                            lineWidth: 1.5
                                        )
                                        .blur(radius: 1)
                                        .opacity(0.8)
                                )
                                .frame(height: 50)
                                .overlay(
                                    Text(option)
                                        .foregroundColor(.white)
                                        .font(.system(size: 16, weight: .medium)))
                        }
                        .padding(.horizontal)
                        .padding(.bottom, 4)
                    }
                }

                if !outputText.isEmpty {
                    Text(outputText)
                        .font(.system(size: 16, design: .rounded))
                        .foregroundStyle(
                            LinearGradient(
                                gradient: Gradient(colors: [.pink, .orange, .purple]),
                                startPoint: .leading, endPoint: .trailing)
                        )
                        .multilineTextAlignment(.center)
                        .padding()
                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 10))
                        .padding(.top, 20)
                }

                Spacer()
            }
            .padding()
        }
    }
}
