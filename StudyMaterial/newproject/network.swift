import SwiftUI
import Network

// ViewModel to monitor network status
class NetworkMonitor: ObservableObject
{
    
    private var monitor: NWPathMonitor
    private var queue: DispatchQueue
    
    // Published property that will notify the view of network changes
    @Published var isConnected: Bool = false
    
    // Initializer
    init() {
        monitor = NWPathMonitor()
        queue = DispatchQueue(label: "NetworkMonitorQueue")
        
        // Monitor network status and update the isConnected property
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                if path.status == .satisfied {
                    print("Network is available.")
                    self.isConnected = true
                } else {
                    print("No network connection.")
                    self.isConnected = false
                }
            }
        }
        
        // Start monitoring
        monitor.start(queue: queue)
    }
    
    deinit {
        // Stop monitoring when the object is deinitialized
        monitor.cancel()
    }
}

struct Net: View {
    // Observe network changes
    @ObservedObject var networkMonitor = NetworkMonitor()
    
    var body: some View {
        VStack {
            if networkMonitor.isConnected {
                Text("Connected to the Network!")
                    .font(.largeTitle)
                    .foregroundColor(.green)
            } else {
                // Show image when there is no network connection
                Text("No Network Connection")
                    .font(.largeTitle)
                    .foregroundColor(.red)
                
                // Replace with your own image if you have one
                Image(systemName: "wifi.slash")  // "wifi.slash" is a built-in SF Symbol
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .foregroundColor(.red)
            }
            
            Spacer()
            
        }
        .padding()
        .onAppear {
            // Any setup or additional actions when the view appears
            print("ContentView appeared.")
        }
    }
}

#Preview {
    Net()
}
