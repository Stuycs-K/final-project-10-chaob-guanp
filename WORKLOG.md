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


## GROUP MEMBER 2: Phillip Guan

### 5/22/23

Created the character interface and the box interface.

### 5/23/23

Began the implementation of hitboxes and hurtboxes. Tested the checkCollides() method. It works.

### 5/24/23

Created a hitbox around the Goku sprite. Follows the sprite where ever it goes. Working on the implentation of two sprites not being able to walk through each other.

### 5/25/23

Made it so that the hitboxes aren't reliant on the draw method but the update() method so it can change due to the characters position. This makes it more
flexible. Need to include collision to this, its a little different.

### Weekend 5/26 - 5/29

Made it so the crouch hitboxes are more aligned. Tried to figure out a way to store the hitboxes locations, but no luck. Redid all current hitboxes.
