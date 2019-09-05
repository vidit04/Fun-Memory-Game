# Fun-Memory-Game

### Overview of Implemented Theory


A “Fun Memory Game” consists of a data base of 30 index cards and five boxes. 5 five different boxes named A, B, C, D, E. On every index card there is a question, a hint and the answer. Every index card is put in one of the boxes.
The Leitner system is a widely used method of efficiently using flashcards that was proposed by the German science journalist Sebastian Leitner in the 1970s.

According to “Fun Memory Game”, In every round 15 index card will be selected from the boxes and the question on it should be answered. Cards will be selected in 5 packs M (5 cards),  N (4 cards), O (3 cards) ,P (2 cards) ,Q (1 card). If the answer is correct, the index card will be putted in the next box or remain in the Box E if is already in it. If the question can be answered only with the help of a hint, it remains in the box. If the answer wrong, the card goes to box number A. If all questions in box E, the game is finished.

Every round of the “Fun Memory Flashcard Game” will be initialized by the following scheme: 15 card to be chosen

•	5 cards from Box A = Pack M

•	4 cards from Box B = Pack N

•	3 cards from Box C = Pack O

•	2 cards from Box D = Pack P

•	1 cards from Box E = Pack Q

If Index box contain less questions for assigned Pack, then the Pack quantity will be fulfilled from box next to it, means it will be filled with Index cards from the next box with a higher alphabet.
 

### Manual for “Fun Memory Game”

•	To play “Fun Memory Game” run Game.m file.

    -Alone with Game.m, other file Book1.xlsx & Pic.jpg should be present in same folder.

•	When you press run command, first 15 set of Index card will be displayed on screen one by one in Round 1.

o	Pack M = 5 cards from Box A

o	Pack N = 4 cards from Box B

o	Pack O = 3 cards from Box C

o	Pack P = 2 cards from Box D

o	Pack Q = 1 card from Box E

•	Objective of game is to enter correct option to Index Card displayed. Options allowed to enter in Input box is A, B, C and D. Option entered should be in capital letter. If input box is kept blank then also it will be considered as wrong answer.

•	To freeze your option, enter the desired option in blank space & press the Push Button.

•	Repeat the process till the Round consist of 15 Index cards is not complete.

•	During the Game we can use Hint & Get Answer option, if we are not aware of answers.

•	Get Answer option can only be activated by using Hint push button first.

•	After completing every round of 15 Index Cards we can decide, either we want to continue or quit from message box displayed in end of round completion.

•	Index Cards will move from one box to other on basis of 3 criteria.

     o	When selected option is correct, Index Card will move from one box to other in alphabetic order. But Index Card of box E will remain in box E for correct answers.
     
     o	When selected option is wrong, Index Card will move to box A. But Index Card of box A will remain in box A for wrong answers.
     
     o	When Hint is used for Index Card ,
         	Index card will stay in same box .If selected option is correct.
         	Index card will move to box A .If selected option is wrong.
 
•	Within Game window , we can check backend data of Index Cards
      o	Index Cards availability before starting the Round in boxes A, B, C, D, and E.
      o	Index Cards pickup pattern for M, N, O, P, and Q packs for present Round.
      o	Real time data for number of correct answers for present Round.
      
•	Game will ask to restart the program again.
     o	When there are insufficient Index cards in box E for pickup.
     o	When box E is full of all 30 Index cards.
