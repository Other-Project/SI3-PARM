#include <parm.h>

void run()
{
	BEGIN();

	int t[5];

	t[0] = 1;
	t[1] = 3;
	t[2] = 6;
	t[3] = 9;
	t[4] = 10;

	for(int i = 0; i < 5; i++) RES = t[i];
	for(int i = 0; i < 5; i++) {
		*(t+i) = i;
		RES = *(t+i);
	}
	for(int i = 0; i < 5; i++) RES = *(t+i);

	END();
}
