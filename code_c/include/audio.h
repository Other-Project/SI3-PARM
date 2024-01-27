#include <parm.h>

#ifndef AUDIO_H
#define AUDIO_H

// Stop le buzzer
#define BZZCLR() (BUZZER = 0)

// Défini le buzzer sur une fréquence (Hz) et un volume (0 - 131071) donnés
#define BZZSET(frequency, volume)          \
	do                                      \
	{                                       \
		int binary = frequency >> 6;         \
		binary <<= 6;                        \
		binary += frequency & 0b111111;      \
		binary <<= 8;                        \
		binary += volume >> 9;               \
		binary <<= 8;                        \
		binary += (volume >> 1) & (0xf);     \
		binary <<= 2;                        \
		binary += ((volume & 0b1) << 1) + 1; \
		BUZZER = binary;                     \
	} while (0)

#endif