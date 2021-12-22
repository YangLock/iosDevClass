/*:
 ## Two functions for automatically discarding and randomly choosing a card
 - **chooseOne** is a function which can randomly choose a card
 - **autoDiscard** is a function which can automatically discard
*/
import UIKit
var cards = [(1,"spade"),(2,"spade"),(3,"spade"),(4,"spade"),(5,"spade"),(6,"spade"),(7,"spade"),(8,"spade"),(9,"spade"),(10,"spade"),(11,"spade"),(12,"spade"),(13,"spade"),
             
             (1,"heart"),(2,"heart"),(3,"heart"),(4,"heart"),(5,"heart"),(6,"heart"),(7,"heart"),(8,"heart"),(9,"heart"),(10,"heart"),(11,"heart"),(12,"heart"),(13,"heart"),
             
             (1,"club"),(2,"club"),(3,"club"),(4,"club"),(5,"club"),(6,"club"),(7,"club"),(8,"club"),(9,"club"),(10,"club"),(11,"club"),(12,"club"),(13,"club"),
             (1,"diamond"),(2,"diamond"),(3,"diamond"),(4,"diamond"),(5,"diamond"),(6,"diamond"),(7,"diamond"),(8,"diamond"),(9,"diamond"),(10,"diamond"),(11,"diamond"),(12,"diamond"),(13,"diamond")
]


var num : Int = 51

func chooseOne() -> (num : Int, color : String){
    //let i : Int = Int.random(in: 0...num)
    let i = Int(arc4random_uniform(UInt32(num+1)))
    if num > 0{
        let t = cards[num]
        cards[num] = cards[i]
        cards[i] = t
        num = num - 1
        return cards[num]
    }else{
        print("All the cards have been discarded!")
        return (0,"none")
    }
}
var cardsOfPlayers: [[(num: Int, color: String)]] = []

func autoDiscard(numOfPlayers: Int, numOfCards: Int) -> [[(num: Int, color: String)]]{
    for i in 0..<numOfPlayers{
        cardsOfPlayers.append([])
        for _ in 0..<numOfCards{
            cardsOfPlayers[i].append(chooseOne())
        }
    }
    return cardsOfPlayers
}

autoDiscard(numOfPlayers: 4, numOfCards: 9)
for i in 0..<4 {
    print(cardsOfPlayers[i])
}


let monthYear = "March 2019"
var month = monthYear.components(separatedBy: " ")[0]
var year = monthYear.components(separatedBy: " ")[1]
print(month)
print(year)
