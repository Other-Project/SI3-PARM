#include <parm.h>
#include <audio.h>

#define SLEEP(times) for (int time = 0; time < times; time++)

void run()
{
	BEGIN();

	int notes[44];
	int *t = notes;

	// Au clair de la lune, mon amis Pierot
	*(t++) = 262;
	*(t++) = 262;
	*(t++) = 262;
	*(t++) = 294;
	*(t++) = 330; // aurait du etre une blanche
	*(t++) = 294; // aurait du etre une blanche
	*(t++) = 262;
	*(t++) = 330;
	*(t++) = 294;
	*(t++) = 294;
	*(t++) = 262; // aurait du etre une blanche

	// Prete moi ta plume, pour écrire un mot
	*(t++) = 262;
	*(t++) = 262;
	*(t++) = 262;
	*(t++) = 294;
	*(t++) = 330; // aurait du etre une blanche
	*(t++) = 294; // aurait du etre une blanche
	*(t++) = 262;
	*(t++) = 330;
	*(t++) = 294;
	*(t++) = 294;
	*(t++) = 262; // aurait du etre une blanche

	// Ma chandele est morte, je n'ai plus de feu
	*(t++) = 294;
	*(t++) = 294;
	*(t++) = 294;
	*(t++) = 294;
	*(t++) = 220; // aurait du etre une blanche
	*(t++) = 220; // aurait du etre une blanche
	*(t++) = 294;
	*(t++) = 262;
	*(t++) = 246;
	*(t++) = 220;
	*(t++) = 196; // aurait du etre une blanche

	// Ouvre moi ta porte, pour l'amour de dieu
	*(t++) = 262;
	*(t++) = 262;
	*(t++) = 262;
	*(t++) = 294;
	*(t++) = 330; // aurait du etre une blanche
	*(t++) = 294; // aurait du etre une blanche
	*(t++) = 262;
	*(t++) = 330;
	*(t++) = 294;
	*(t++) = 294;
	*(t++) = 262; // aurait du etre une blanche

	int vol = SLIDER << 9;
	while (1)
	{
		for (int i = 0; i < 44; i++)
		{
			BZZCLR();
			BZZSET(notes[i], vol);
			RES = i;
			SLEEP(3);
		}
	}

	END();
}
