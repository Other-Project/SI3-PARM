sub sp, #508
sub sp, #452
@Enables MMIO

.for_loop:
	adds r0, #1
	@i++
	cmp r0, #249
	@i compareTo 249
	str r0, [sp, #4]
	@write i into the 7 seg
	bLS .for_loop
	@loop while i <= 249
@will stop at 250