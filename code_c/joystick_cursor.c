#include <parm.h>
#include <video.h>

void run()
{
    BEGIN();
    while (1) {
        int x = JOYx/4;
        int y = JOYy/8;
        PIXSET(x,y);
        SCRUPD();
        PIXCLR(x,y);
    }
    END();
}
