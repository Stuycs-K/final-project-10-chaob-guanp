# Work Log

## GROUP MEMBER 1: Brandon Chao

### 5/22/23

Began the process on implementing the sprites into processing. Got the sprites to show up one after another showing a smooth animation of all of "Goku" moves.

### 5/23/23

Began working on the implementation of a moving sprite.

### 5/24/23

Made the sprite walk with a walking animation. Also created a crouch feature. Changed the Character interface into a class which Goku extends.

### 5/25/23

Jump feature where the character jumps in a parabolic curve.

### Weekend 5/26 - 5/29

Changed box interface into a class and edited the corresponding classes.

### 5/30/23

Changed hitboxes to instead of drawing rectangles, it created a rectangle from the built-in rectangle class. This way we can use the built in methods like intersect.

### 5/31/23

Made collision work, also changed up the hitboxes again.


### 6/1/23

Created collisions for top down and also added a light hit and medium hit.

### 6/2 - 6/4

Brainstormed how to fix the bugs in the current version. One bug was when both characters hit at the same time, they would both be unable to do anything for one move. Another thing brainstormed
was how to implement the stun time for combos.

### 6/6/23

Fixed bug where in the endScreen there players would still be able to attack and subsequently kill the other resulting in a different win screen. Thinking about making a character select screen
instead of win screen.

### 6/8/23

Added a timer and separated the health bars to make space for timers. New animations for when the round ends. Added victory poses. Scrapped the endScreen idea.

### 6/9/23

Fixed bugs with falling and stun. Made combos possible, just have to adjust the stun durations to our fit. Added block while crouching.

### Weekend 6/9 - 6/11

Created button class so we can make interactive buttons. Edited sprites for vegeta. Found that the sprite list is
missing some sprites and cannot find suitable replacement so we have to improvise and use an attack animations for
his walking. Might look off, but its the best we can do.

## GROUP MEMBER 2: Phillip Guan

### 5/22/23

Created the character interface and the box interface.

### 5/23/23

Began the implementation of hitboxes and hurtboxes. Tested the checkCollides() method. It works.

### 5/24/23

Created a hitbox around the Goku sprite. Follows the sprite where ever it goes. Working on the implemetation of two sprites not being able to walk through each other.

### 5/25/23

Made it so that the hitboxes aren't reliant on the draw method but the update() method so it can change due to the characters position. This makes it more
flexible. Need to include collision to this, its a little different.

### Weekend 5/26 - 5/29

Made it so the crouch hitboxes are more aligned. Tried to figure out a way to store the hitboxes locations, but no luck. Redid all current hitboxes.

### 5/30/23

Made the two players distinguishable. Found a problem on the mirroring where it treats the character on the right as player2 always, will fix tomorrow.

### 5/31/23

made the mirroring with the sprites work accordingly. Experimenting with using different set of sprites for player2.

### 6/1/23

Sprites for different players working, can clearly distinguish between player one and two.

### Weekend 6/2 - 6/4

Created end screen for after one player reaches 0 hp. Added two new image files that are for when one player or the other player wins. Right now it only has text on the top left which says who won
and some "funny" stuff. Planning on adding some stats and making it look cleaner. Maybe a highest combo reached. Want to add a rematch button.

### 6/5/23

Created a rematch button on the endscreen where when hovered over highlights yellow to indicate it. When you press your mouse while hovering over the "rematch" box, it resets players health
and sets their positions to their original positions, or 50 pixels away form their respective sides, instead of them spawning right next to each other.

### 6/9/23

Made it so the health bar changes colors to reflect the amount of health a player has. Turns red from the range of 50-25 and dark red from 25-0.

### Weekend 6/9 - 6/11

Added sounds for getting hit, music for the character select screen, and music for while you are fighting. Added hitboxes for vegeta character, mostly aligned with the character.

## Working Features:
- Character selection screen
- Two characters to pick from: Goku or Vegeta
- Light/Medium/Heavy attacks that do different damage and have different stun times
- Ability to walk around and jump
- A menu button that serves as a rematch, prompts you to character selection screen
- Music and hit sound effects

## Broken Features/Bugs
- Vegeta's hitboxes are a little off due to the fact that the sprites that we downloaded for him actually missed a couple crucial ones and we weren't able to find a suitable replacement for them.

## Resources
- For the audio, I used this YouTube video to learn: https://youtu.be/LcX36OxgZgg
- Processing reference 
