//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Hank on 2023/1/21.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    // @ObservedObject says that viewModel has a observable object,
    // everytime the .send(), it redraws.
    var body: some View {
        Grid(viewModel.cards) {card in
            CardView(card: card).onTapGesture {
                self.viewModel.choose(card: card)
            }
                .padding(5)
        }
            .foregroundColor(Color.orange)
            .padding()
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }
    
    func body(for size: CGSize) -> some View {
        ZStack {
            Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(110-90), clockwise: true)
                .padding(5)
                .opacity(0.4)
            Text(card.content)
                .font(Font.system(size: fontSize(for: size)))
        }
        .modifier(Cardify(isFaceUp: card.isFaceUp))
    }
    
    // MARK: - Drawing Constants
    
    private func fontSize(for size: CGSize) -> CGFloat {
        return min(size.width, size.height) * 0.70
    }
}
























struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(card: game.cards[0])
        return EmojiMemoryGameView(viewModel: game)
    }
}
