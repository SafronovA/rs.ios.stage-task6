import Foundation

protocol DeckBaseCompatible: Codable {
    var cards: [Card] {get set}
    var type: DeckType {get}
    var total: Int {get}
    var trump: Suit? {get}
}

enum DeckType:Int, CaseIterable, Codable {
    case deck36 = 36
}

struct Deck: DeckBaseCompatible {
    
    //MARK: - Properties
    var cardsMaxSize = 6
    var cards = [Card]()
    var type: DeckType
    var trump: Suit?
    
    var total:Int {
        return type.rawValue
    }
}

extension Deck {
    
    init(with type: DeckType) {
        self.type = type
        cards = createDeck(suits: Suit.allCases, values: Value.allCases)
    }
    
    public func createDeck(suits:[Suit], values:[Value]) -> [Card] {
        var desk:[Card] = []
        for suit in suits {
            for value in values {
                desk.append(Card(suit: suit, value: value))
            }
        }
        return desk
    }
    
    public mutating func shuffle() {
        cards.shuffle()
    }
    
    public mutating func defineTrump() {
        trump = cards.last?.suit
        setTrumpCards(for: trump!)
    }
    
    public mutating func initialCardsDealForPlayers(players: [Player]) {
        if (!players.isEmpty && players.count < 7) {
            for player in players {
                var buffer = [Card]()
                for i in 0..<cardsMaxSize {
                    buffer.append(cards[i])
                }
                player.hand = buffer
                cards.removeFirst(cardsMaxSize)
            }
        }
    }
    
    public mutating func setTrumpCards(for suit:Suit) {
        for (i, card) in cards.enumerated() {
            if card.suit == suit {
                cards[i].isTrump = true
            }
        }
    }
}

