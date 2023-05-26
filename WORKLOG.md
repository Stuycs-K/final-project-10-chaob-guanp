# Work Log

## GROUP MEMBER 1: Brandon Chao

### 5/22/23

Began the process on implementing the sprites into processing. Got the sprites to show up one after another showing a smooth animation of all of "Goku" moves.

### 5/23/23

Began working on the implementation of a moving sprite.

### 5/24/23

Made the sprite walk with a walking animation. Also created a crouch feature. Changed the Character interface into a class which Goku extends.

### 5/25/23

Fixes the problem where the game would run exponentially slower when two sprites were on the screen. Also made jumping smoother and made code easier to work with, read,
and understand from an outside view.

## GROUP MEMBER 2: Phillip Guan

### 5/22/23

Created the character interface and the box interface.

### 5/23/23

Began the implementation of hitboxes and hurtboxes. Tested the checkCollides() method. It works.

### 5/24/23

Created a hitbox around the Goku sprite. Follows the sprite where ever it goes. Working on the implentation of two sprites not being able to walk through each other.

### 5/25/23

Today I started working on the implementation of having the hitboxes be linked to each Pimage. Since in the MyPImage class there are arrays of both hitboxes and
hurtboxes, I am figuring out how to link each set of hitboxes to a specific PImage so when it draws that PImage it also draws the corresponding hitboxes with it.
