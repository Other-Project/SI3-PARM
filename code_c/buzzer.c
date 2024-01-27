#include <parm.h>
#include <audio.h>

void run()
{
	BEGIN();
	while (1)
	{
		BZZSET(512, SLIDER << 9);
	}
	END();
}
