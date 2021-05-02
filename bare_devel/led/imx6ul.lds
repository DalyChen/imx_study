SECTIONS{
	. = 0X87800000;
	/* The startup code goes first into DDR RAM */
	.interrupts :
	{
		__VECTOR_TABLE = .;
		. = ALIGN(4);
		KEEP(*(.isr_vector))     /* Startup code */
		. = ALIGN(4);
	}

	.text :
	{
		obj/start.o 
		*(.text)
	}
	.rodata ALIGN(4) : {*(.rodata*)}     
	.data ALIGN(4)   : { *(.data) }    
	__bss_start = .;    
	.bss ALIGN(4)  : { *(.bss)  *(COMMON) }    
	__bss_end = .;
}