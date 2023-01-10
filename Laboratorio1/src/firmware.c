#include <pic14/pic12f675.h>

//To compile:
//sdcc -mpic14 -p16f675 blink.c
 
//To program the chip using picp:
//Assuming /dev/ttyUSB0 is the serial port.
 
//Erase the chip:
//picp /dev/ttyUSB0 16f887 -ef
 
//Write the program:
//picp /dev/ttyUSB0 16f887 -wp blink.hex
 
//Write the configuration words (optional):
//picp /dev/ttyUSB0 16f887 -wc 0x2ff4 0x3fff
 
//Doing it all at once: erasing, programming, and reading back config words:
//picp /dev/ttyUSB0 16f887 -ef -wp blink.hex -rc
 
//To program the chip using pk2cmd:
//pk2cmd -M -PPIC16f887 -Fblink.hex
 
void delay (unsigned inttiempo);
int randomNum();
int randomRange ( int min, int max, int past_num );


void main(void)
{

    TRISIO = 0b00000000; //Poner todos los pines como salidas
	GPIO = 0x00; //Poner pines en bajo

	int lower = 1, upper = 6, aleatorio = randomNum();
    unsigned int time = 500;
	aleatorio = randomRange(lower, upper, aleatorio);
 
    //Loop forever
    while ( 1 )
    {
		if(GP3)
		{
			switch (aleatorio)
			{
				case 1:
					GP0 = 1;
					delay(time);
					GP0 = 0;
					break;

				case 2:
					GP1 = 1;
					delay(time);
					GP1 = 0;
					break;

				case 3:
					GPIO = 0b00000011;
					delay(time);
					GPIO = 0b00000000;
					break;

				case 4:
					GPIO = 0b00000110;
					delay(time);
					GPIO = 0b00000000;
					break;

				case 5:
					GPIO = 0b00000111;
					delay(time);
					GPIO = 0b00000000;
					break;

				case 6:
					GPIO = 0b00010111;
					delay(time);
					GPIO = 0b00000000;
					break;
			}
		}

		else
		{
			
		}
		aleatorio = randomRange(lower, upper, aleatorio);		
    }
 
}

void delay(unsigned int tiempo)
{
	unsigned int i;
	unsigned int j;

	for(i=0;i<tiempo;i++)
	  for(j=0;j<1275;j++);
}

int randomNum()
{ 
  int next = 710467;
         
  next = ((next * next) / 100 ) % 10000 ; 
  return next ; 
} 
 
int randomRange( int min, int max, int past_num )  
{ 
  return past_num % (max+1-min) + min ;  
}