#include <parm.h>

#ifndef AUDIO_H
#define AUDIO_H

#define BZZCLR() (BUZZER = 0)

#define BZZSET(frequency, volume) ( {\
    int binary = frequency >> 6;\
    binary <<= 6;\
    binary += frequency& 0b111111;\
    binary <<= 8;\
    binary += volume >> 9;\
    binary <<= 8;\
    binary += (volume >> 1)&(0xf);\
    binary <<= 2;\
    binary += ((volume&0b1) << 1) + 1;\
    BUZZER = binary;\
    })

#endif