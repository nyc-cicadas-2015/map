### Game Logic

1. Start the application 
2. (Shuffle deck)
3. Display a welcome message and instructions
4. Display a definition
5. Display a prompt for user input
6. User inputs a guess (a term/word)
7. The application provides feedback based on user response
8. If the guess is incorrect, 
		- provide negative feedback to user (e.g. "You are wrong")
		- reprompt user for feedback
		- repeat n times 
9. If the guess is correct
		- provide positive feedback to user (e.g., "You are correct!")
10. Repeat steps 4 to 9 until all definitions are exhausted
11. Display "GAME OVER"


### Classes/Modules

#### Card

A Card has a
 - term
 - definition
 - *status (e.g., correct?) - possible feature*

#### Deck

A Deck has a
 - collection of cards
 - position (current state, location within deck)

A Deck can:
 - shuffle the cards

### Game

A Game can
 - pull a card from the deck (#pull_card)
 - detemine if game is over (#game_over?)
 - keep track of guesses (#track_guesses)
 - determine if a guess is correct (#correct?) a.k.a. "checker"

### CardLoader

The CardLoader will 
	- receive a CSV file
	- parse each row of data
	- return Card objects


