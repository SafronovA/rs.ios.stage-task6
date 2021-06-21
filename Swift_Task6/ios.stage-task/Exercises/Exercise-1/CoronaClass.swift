import Foundation

class CoronaClass {
    
    var seats = [Int]()
    var seatsSize: Int
    
    init(n: Int) {
        seatsSize = n
    }
    
    func seat() -> Int {
        var seatIndex = 0
        if !seats.isEmpty {
            seatIndex = getNextOptimalFreePlace()
        }
        seats.append(seatIndex)
        seats.sort()
        return seatIndex
    }
    
    func leave(_ p: Int) {
        if let i = seats.firstIndex(of: p){
            seats.remove(at: i)
        }
    }
    
    private func getNextOptimalFreePlace()-> Int{
        var maxMinDistance = 0
        var bestChoice = 0
        for i in 0...seatsSize - 1 {
            if !seats.contains(i) {
                var minDistance = 0
                for b in seats {
                    let diff = abs(i - b)
                    if minDistance == 0 {
                        minDistance = diff
                    } else {
                        minDistance = min(minDistance, diff)
                    }
                }
                if minDistance > maxMinDistance {
                    maxMinDistance = minDistance
                    bestChoice = i
                }
            }
        }
        return bestChoice
    }
}
