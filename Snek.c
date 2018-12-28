#include <gb/gb.h>
#include "Body.c"
#include "Food.c"

int size = 1; // Initial size.
int addx; // Growth x position.
int addy; // Growth y position
int i; // Loop iterator.
int newx; // next x position during movement.
int newy; // next y position during movement.
char newdir; // next direction during movement.
int pastx; // old x position to be assigned to the next body section.
int pasty; // old y position to be assigned to the next body section.
char pastdir; // old direction to be assigned to the next body section.

// Snake body section definition:
struct Snek {
  int xpos; // x position.
  int ypos; // y position.
  char dir; // direction.
};

// Snake definition (Array of body sections):
struct Snek S[10] ={
  {80,80,'r'}, // Head start point.
  // Possible body parts:
  {0,0,'r'},
  {0,0,'r'},
  {0,0,'r'},
  {0,0,'r'},
  {0,0,'r'},
  {0,0,'r'},
  {0,0,'r'},
  {0,0,'r'},
  {0,0,'r'}
};

// Growth function:
void grow()
{
  // Add another body sprite.
  set_sprite_tile(size,0);

  // Check the tail direction:
  switch(S[size-1].dir)
  {
    // if tail is moving right:
    case 'r':
      // Add new tail behind old tail.
      addx = S[size-1].xpos - 8 ;
      addy = S[size-1].ypos ;
      move_sprite(size,addx,addy);
      delay(100);

      // Save new tail position in Snake struct.
      S[size].xpos = S[size-1].xpos - 8;
      S[size].ypos = S[size-1].ypos;
      S[size].dir = S[size-1].dir;
      break ;

    // if tail is moving left:
    case 'l':
      // Add new tail behind old tail.
      addx = S[size-1].xpos + 8 ;
      addy = S[size-1].ypos ;
      move_sprite(size,addx,addy);
      delay(100);

      // Save new tail position in Snake struct.
      S[size].xpos = S[size-1].xpos + 8;
      S[size].ypos = S[size-1].ypos;
      S[size].dir = S[size-1].dir;
      break ;

    // if tail is moving up:
    case 'u':
      // Add new tail behind old tail.
      addx = S[size-1].xpos ;
      addy = S[size-1].ypos +8 ;
      move_sprite(size,addx,addy);
      delay(100);

      // Save new tail position in Snake struct.
      S[size].xpos = S[size-1].xpos;
      S[size].ypos = S[size-1].ypos + 8;
      S[size].dir = S[size-1].dir;
      break ;

    // if tail is moving down:
    case 'd':
      // Add new tail behind old tail.
      addx = S[size-1].xpos ;
      addy = S[size-1].ypos -8 ;
      move_sprite(size,addx,addy);
      delay(100);

      // Save new tail position in Snake struct.
      S[size].xpos = S[size-1].xpos;
      S[size].ypos = S[size-1].ypos - 8;
      S[size].dir = S[size-1].dir;
      break ;
  }
  // Show new tail sprite.
  SHOW_SPRITES ;
  // Increment snake size.
  size += 1 ;

}

// Update function.
void update(){
  // Check sneak head direction.
  switch(S[0].dir)
  {
    // When head is going left.
    case 'l':
      // For every body part:
      for(i = 0; i != size; i++)
      {
        // If it's the head:
        if(i == 0){
          // Move left:
          newx = S[i].xpos - 8;
          newy = S[i].ypos;
          newdir = S[i].dir;
          move_sprite(i,newx,newy);

          // Save old position for the next body part:
          pastx = S[i].xpos ;
          pasty = S[i].ypos;
          pastdir = S[i].dir;

          // Update position.
          S[i].xpos = newx;
          S[i].ypos = newy;
          S[i].dir = newdir;
        }

        // If it's not the head:
        else{
          // move to the position of the previous body section:
          newx = pastx ;
          newy = pasty;
          newdir = pastdir;
          move_sprite(i,newx,newy);

          // Save old position of this body section for the next one.
          pastx = S[i].xpos ;
          pasty = S[i].ypos;
          pastdir = S[i].dir;

          // Update position.
          S[i].xpos = newx;
          S[i].ypos = newy;
          S[i].dir = newdir;
        }
      }
      delay(100);
      break;
    // When head is going right.
    case 'r':
      // For every body section:
      for(i = 0; i != size; i++)
      {
        // If it's the head:
        if(i == 0){
          // Move right.
          newx = S[i].xpos + 8;
          newy = S[i].ypos;
          newdir = S[i].dir;
          move_sprite(i,newx,newy);

          // Save old position for next body section:
          pastx = S[i].xpos ;
          pasty = S[i].ypos;
          pastdir = S[i].dir;

          // Update position
          S[i].xpos = newx;
          S[i].ypos = newy;
          S[i].dir = newdir;
        }

        // If it's not the head:
        else{
          // move to the position of the previous body section:
          newx = pastx ;
          newy = pasty;
          newdir = pastdir;
          move_sprite(i,newx,newy);

          // Save old position of this body section for the next one.
          pastx = S[i].xpos ;
          pasty = S[i].ypos;
          pastdir = S[i].dir;

          // Update position.
          S[i].xpos = newx;
          S[i].ypos = newy;
          S[i].dir = newdir;
        }
      }
      delay(100);
      break ;

    case 'u':
    // For every body section:
      for(i = 0; i != size; i++)
      {
        // If it's the head:
        if(i == 0){
          // Move up.
          newx = S[i].xpos;
          newy = S[i].ypos - 8;
          newdir = S[i].dir;
          move_sprite(i,newx,newy);

          // Save old position of this body section for the next one.
          pastx = S[i].xpos ;
          pasty = S[i].ypos;
          pastdir = S[i].dir;

          // Update position.
          S[i].xpos = newx;
          S[i].ypos = newy;
          S[i].dir = newdir;
        }

        else{
          // move to the position of the previous body section:
          newx = pastx ;
          newy = pasty;
          newdir = pastdir;
          move_sprite(i,newx,newy);

          // Save old position of this body section for the next one.
          pastx = S[i].xpos ;
          pasty = S[i].ypos;
          pastdir = S[i].dir;

          // Update position.
          S[i].xpos = newx;
          S[i].ypos = newy;
          S[i].dir = newdir;
        }
      }
      delay(100);

      break ;

    case 'd':

      // For every body section:
      for(i = 0;i != size; i++)
      {
        // If it's the head:
        if(i == 0){
          // Move down.
          newx = S[i].xpos;
          newy = S[i].ypos + 8;
          newdir = S[i].dir;
          move_sprite(i,newx,newy);

          // Save old position of this body section for the next one.
          pastx = S[i].xpos ;
          pasty = S[i].ypos;
          pastdir = S[i].dir;

          // Update position.
          S[i].xpos = newx;
          S[i].ypos = newy;
          S[i].dir = newdir;
        }

        else{
          // move to the position of the previous body section:
          newx = pastx ;
          newy = pasty;
          newdir = pastdir;
          move_sprite(i,newx,newy);

          // Save old position of this body section for the next one.
          pastx = S[i].xpos ;
          pasty = S[i].ypos;
          pastdir = S[i].dir;

          // Update position.
          S[i].xpos = newx;
          S[i].ypos = newy;
          S[i].dir = newdir;
        }
      }
      delay(100);

       // Wait before checking on the joypad.
      break ;
  }
}

// Change Direction function:
void change() {
  // On joypad press:
  switch (joypad()) {
    // If left is pressed:
    case J_LEFT:
      // If the head is not moving right:
      if(S[0].dir != 'r')
      {
        // Change direction to the left.
        S[0].dir = 'l';
      }
      break;
    // If right is pressed:
    case J_RIGHT:
      // If the head is not moving to the left:
      if(S[0].dir != 'l')
      {
        // Change direction to the right.
        S[0].dir = 'r';
      }
      break;
    // If up is pressed:
    case J_UP:
      // If the head is not moving down:
      if(S[0].dir != 'd')
      {
        // Change direction to up.
        S[0].dir = 'u' ;
      }
      break;
    // If down is pressed:
    case J_DOWN:
      // If the head is not moving up:
      if(S[0].dir != 'u')
      {
        // Change direction to down.
        S[0].dir = 'd';
      }
      break;

    // If A is pressed:
    case J_A:
      // Grow (for testing):
      grow();
      break;
  }
}

// Main function:
void main()
{
  // Wait for an 8x8 sprite:
  SPRITES_8x8 ;

  // load body sprite
  set_sprite_data(0,0,body) ;
  // Set in sprite array.
  set_sprite_tile(0,0);
  // Move to starting location.
  move_sprite(0,S[0].xpos,S[0].ypos);
  // Show Sprites:
  SHOW_SPRITES;

  // Main game loop:
  while(1)
  {
      // If Joypad is pressed:
      if(joypad())
      {
        wait_vbl_done();

        change(); // Check if snake must change direction.
      }

      wait_vbl_done();
      update() ; // Move snake along.

  }
}
