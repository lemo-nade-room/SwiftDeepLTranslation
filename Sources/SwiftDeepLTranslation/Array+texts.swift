import Foundation

extension Array where Element == String {
    var texts: [[Element]] {
        stride(from: 0, to: self.count, by: 50).map {
            Array(self[$0..<Swift.min($0 + 50, self.count)])
        }
    }
}
