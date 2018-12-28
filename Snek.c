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
      S[size].xpos = S[size-1].xpos + 8;
      S[size].ypos = S[size-1].ypos;
      S[size].dir = S[size-1].dir;
      break ;

    // if tail is moving up:
    case 'u':
      addx = S[size-1].xpos ;
      addy = S[size-1].ypos +8 ;
      move_sprite(size,addx,addy);
      delay(100);
      S[size].xpos = S[size-1].xpos;
      S[size].ypos = S[size-1].ypos + 8;
      S[size].dir = S[size-1].dir;
      break ;

    // if tail is moving down:
    case 'd':
      addx = S[size-1].xpos ;
      addy = S[size-1].ypos -8 ;
      move_sprite(size,addx,addy);
      delay(100);
      S[size].xpos = S[size-1].xpos;
      S[size].ypos = S[size-1].ypos - 8;
      S[size].dir = S[size-1].dir;
      break ;
  }

  SHOW_SPRITES ;
  size += 1 ;

}

void update(){
  // wait_vbl_done();
  switch(S[0].dir)
  {
    case 'l':
    // wait_vbl_done();


      for(i = 0; i != size; i++)
      {
        if(i == 0){
          newx = S[i].xpos - 8;
          newy = S[i].ypos;
          newdir = S[i].dir;
          move_sprite(i,newx,newy);
          pastx = S[i].xpos ;
          pasty = S[i].ypos;
          pastdir = S[i].dir;

          S[i].xpos = newx;
          S[i].ypos = newy;
          S[i].dir = newdir;
        }

        else{ /// Problem.
          newx = pastx ;
          newy = pasty;
          newdir = pastdir;
          move_sprite(i,newx,newy);
          pastx = S[i].xpos ;
          pasty = S[i].ypos;
          pastdir = S[i].dir;
          S[i].xpos = newx;
          S[i].ypos = newy;
          S[i].dir = newdir;
        }
      }
      delay(100);
      break;

    case 'r':
      // wait_vbl_done();
      for(i = 0; i != size; i++)
      {
        if(i == 0){
          newx = S[i].xpos + 8;
          newy = S[i].ypos;
          newdir = S[i].dir;
          move_sprite(i,newx,newy);
          pastx = S[i].xpos ;
          pasty = S[i].ypos;
          pastdir = S[i].dir;

          S[i].xpos = newx;
          S[i].ypos = newy;
          S[i].dir = newdir;
        }

        else{ /// Problem.
          newx = pastx ;
          newy = pasty;
          newdir = pastdir;
          move_sprite(i,newx,newy);
          pastx = S[i].xpos ;
          pasty = S[i].ypos;
          pastdir = S[i].dir;
          S[i].xpos = newx;
          S[i].ypos = newy;
          S[i].dir = newdir;
        }
      }
      delay(100);
      break ;

    case 'u':
      // wait_vbl_done();
      for(i = 0; i != size; i++)
      {
        if(i == 0){
          newx = S[i].xpos;
          newy = S[i].ypos - 8;
          newdir = S[i].dir;
          move_sprite(i,newx,newy);
          pastx = S[i].xpos ;
          pasty = S[i].ypos;
          pastdir = S[i].dir;

          S[i].xpos = newx;
          S[i].ypos = newy;
          S[i].dir = newdir;
        }

        else{ /// Problem.
          newx = pastx ;
          newy = pasty;
          newdir = pastdir;
          move_sprite(i,newx,newy);
          pastx = S[i].xpos ;
          pasty = S[i].ypos;
          pastdir = S[i].dir;
          S[i].xpos = newx;
          S[i].ypos = newy;
          S[i].dir = newdir;
        }
      }
      delay(100);

      break ;

    case 'd':
      // wait_vbl_done();
      for(i = 0;i != size; i++)
      {
        if(i == 0){
          newx = S[i].xpos;
          newy = S[i].ypos + 8;
          newdir = S[i].dir;
          move_sprite(i,newx,newy);
          pastx = S[i].xpos ;
          pasty = S[i].ypos;
          pastdir = S[i].dir;

          S[i].xpos = newx;
          S[i].ypos = newy;
          S[i].dir = newdir;
        }

        else{ /// Problem.
          newx = pastx ;
          newy = pasty;
          newdir = pastdir;
          move_sprite(i,newx,newy);
          pastx = S[i].xpos ;
          pasty = S[i].ypos;
          pastdir = S[i].dir;
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

void change() {
  switch (joypad()) {

    case J_LEFT:
      if(S[0].dir != 'r')
      {
        S[0].dir = 'l';
      }
      // delay(500); // Wait before checking on the joypad.
      break;

    case J_RIGHT:
      if(S[0].dir != 'l')
      {
        S[0].dir = 'r';
      }
      // delay(500); // Wait before checking on the joypad.
      break;

    case J_UP:
      if(S[0].dir != 'd')
      {
        S[0].dir = 'u' ;
      }
      // delay(500); // Wait before checking on the joypad.
      break;

    case J_DOWN:
      if(S[0].dir != 'u')
      {
        S[0].dir = 'd';
      }
      // delay(500); // Wait before checking on the joypad.
      break;

    case J_A:
    // wait_vbl_done();
      grow();
      break;
  }
}

void main()
{
  SPRITES_8x8 ;
  set_sprite_data(0,0,body) ;
  set_sprite_tile(0,0);
  move_sprite(0,S[0].xpos,S[0].ypos);
  SHOW_SPRITES;

  while(1)
  {
      if(joypad())
      {
        wait_vbl_done();
        change();
      }
      wait_vbl_done();
      update() ;



  }
}
