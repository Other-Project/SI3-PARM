#include <parm.h>

void run()
{
	BEGIN();

	int temp = 25;
	RES = temp; // 25

	int t[5];

	t[0] = 1;
	t[1] = 3;
	t[2] = 6;
	t[3] = 9;
	t[4] = 10;

	for(int i = 0; i < 5; i++) RES = t[i]; // 1, 3, 6, 9, 10
	for(int i = 0; i < 5; i++) {
		*(t+i) = i;
		RES = *(t+i); // 0, 1, 2, 3, 4
	}
	for(int i = 0; i < 5; i++) RES = *(t+i); // 0, 1, 2, 3, 4
	for(int i = 0; i < 5; i++) RES = t[i]; // 0, 1, 2, 3, 4
	
	int *p = t + 2;
	*p = 50;

	*(p+1) = temp;
	RES = *(p+1); // 25
	p += 2;

	for(int i = 0; i < 5; i++) RES = t[i]; // 0, 1, 50, 25, 4
	for(int i = 0; i < 5; i++) RES = *(p-i); // 4, 25, 50, 1, 0

	END();
}
