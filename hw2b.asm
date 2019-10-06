	.ORG 0x02
	jmp anything
	ldi R20,HIGH(RAMEND)
	out sph,R20
	ldi R20,LOW(RAMEND)
	out spl,R20
	
	LDI R20,0x2
	sts EICRA,R20
	ldi R20,1<<INT0
	out EIMSK,R20
	sei


	Loop1:
		;sbis PINC,3
		;rjmp pincheck
		sbi DDRB,3
		sbi PORTB,3
		call DELAY250
		cbi PORTB,3
		call DELAY375
		rjmp Loop1

DELAY250:
			LDI R19,8
		g0: 
			LDI R20, 200
		g1:
			LDI r21,249
			NOP
			NOP
		g2:
			NOP
			NOP
			DEC R21
			BRNE g2
			DEC R20
			BRNE g1
			DEC R19
			BRNE g0
			ret
DELAY375:
			LDI R19,11
		f0: 
			LDI R20, 220
		f1:
			LDI r21,249
			nop
			nop
		f2:
			nop
			nop
			DEC R21
			BRNE f2
			DEC R20
			BRNE f1
			DEC R19
			BRNE f0
			ret

DELAY1333:
			LDI R19,10
		h0: 
			LDI R20, 215
		h1:
			LDI r21,250
			nop
			nop
		h2:
			nop
			nop
			DEC R21
			BRNE h2
			DEC R20
			BRNE h1
			DEC R19
			BRNE h0
			ret
	anything:
			cbi DDRB,3
			cbi PORTB,3
			sbi DDRB,2
			call DELAY1333
			cbi	DDRB,2
			cbi PORTB,2
			sbiS DDRB,3
			reti