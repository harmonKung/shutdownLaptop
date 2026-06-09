/*
harmon u
2026/6/8
code on swift for the phone app
*/

import SwiftUI

struct ContentView: View {

    @State private var status = "Ready"

    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {

                Image(systemName: "power")
                    .font(.system(size: 80))
                    .foregroundColor(.red)

                Text("Laptop Remote Control")
                    .font(.title)

                Text(status)
                    .foregroundColor(.secondary)

                Button(role: .destructive) {
                    sendShutdown()
                } label: {
                    Label("Shutdown Laptop", systemImage: "power")
                        .font(.title2)
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)

                Spacer()
            }
            .padding()
            .navigationTitle("Remote")
        }
    }

    func sendShutdown() {

        status = "Sending..."

        Task {

            let ip = "insert_laptop_ip(ipve4)"
            let token = "insert_secret_here"

            let urlString =
                "http://\(ip):5000/shutdown?token=\(token)"

            guard let url = URL(string: urlString) else {
                await MainActor.run {
                    status = "Invalid URL"
                }
                return
            }

            do {
                let (_, response) =
                    try await URLSession.shared.data(from: url)

                if let httpResponse = response as? HTTPURLResponse {

                    await MainActor.run {

                        if httpResponse.statusCode == 200 {
                            status = "Shutdown command sent"
                        } else {
                            status = "Server error: \(httpResponse.statusCode)"
                        }
                    }
                }

            } catch {

                await MainActor.run {
                    status = "Failed to connect"
                }
            }
        }
    }
}

#Preview {
    ContentView()
}