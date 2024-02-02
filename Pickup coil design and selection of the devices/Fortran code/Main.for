
	 INTEGER flag,i,N,Nl
	 DOUBLE PRECISION pi,R,L,V0,v,vind,vres,maxf,f,df,mu0,Z,Iex
	 DOUBLE PRECISION VC,C,a,H1,H2,D,lc,dw,startfres,stopfres
	 PARAMETER(pi=3.1415926535897932384626433832795, N=5000)

	 mu0=4.0*pi*1.0E-7

	 WRITE(*,*)'Enter the resistance of the excitation coil (Ohm).'
	 READ(*,*) R
	 WRITE(*,*)''

	 WRITE(*,*)'Enter the inductance of the excitation coil (mH).'
	 READ(*,*) L
	 WRITE(*,*)''
	 L=L*1.0E-3

	 WRITE(*,*)'Enter the diameter of the pickup coil (mm).'
	 READ(*,*) D
	 WRITE(*,*)''
	 D=D*1.0E-3

	 WRITE(*,*)'Enter the length of the pickup coil (mm).'
	 READ(*,*) lc
	 WRITE(*,*)''
	 lc=lc*1.0E-3

	 WRITE(*,*)'Enter the wire diameter used in the pickup coil (mm).'
	 READ(*,*) dw
	 WRITE(*,*)''
	 dw=dw*1.0E-3

	 WRITE(*,*)'Enter the number of layers in the pickup coil.'
	 READ(*,*) Nl
	 WRITE(*,*)''

	 WRITE(*,*)'Enter the amplitude of the excitation voltage (V).'
	 READ(*,*) V0
	 WRITE(*,*)''

	 WRITE(*,*)'Enter the maximum excitation frequency (Hz).'
	 READ(*,*) maxf
	 WRITE(*,*)''

	 WRITE(*,*)'Enter the start resonance frequency (Hz).'
	 READ(*,*) startfres
	 WRITE(*,*)''

	 WRITE(*,*)'Enter the stop resonance frequency (Hz).'
	 READ(*,*) stopfres
	 WRITE(*,*)''

	 df=maxf/N
	 OPEN(10,FILE='Excitation_coil_impedance.CSV')
	 WRITE(10,*)'Hertz',',','Ohm'
	 DO	i=0,N
	    f=df*i
	    Z=DSQRT(R**2+(2.0*pi*f*L)**2)
	    WRITE(10,100) f,Z
	 END DO
	 CLOSE(10)
100	 FORMAT(F20.8,',',F20.8)	 

	 df=(stopfres-startfres)/N
	 OPEN(20,FILE='Resonance_capacitor.CSV')
	 WRITE(20,*)'Hertz',',','Farad',',','V across C'
	 DO i=0,N
	    f=startfres+df*i
	    C=1.0/(L*(2.0*pi*f)**2)
	    VC=V0*L*2.0*pi*f/R
	    WRITE(20,200) f,C,VC
	 END DO
	 CLOSE(20)
200	 FORMAT(F20.8,',',F20.15,',',F20.8)

	 WRITE(*,*)'Units for the coil calibration coefficient H=a*I:'
	 WRITE(*,*)'Enter 1 for a[1/m]'
	 WRITE(*,*)'Enter 2 for a[Oe/A]'
	 READ(*,*) flag
	 WRITE(*,*)''

	 df=maxf/N

	 OPEN(25,FILE='Excitation_current.CSV')
	 WRITE(25,*)'Hz',',','A'
	 DO	i=0,N
	    f=df*i
	    Iex=V0/DSQRT(R**2+(2.0*pi*f*L)**2)
	    WRITE(25,250) f,Iex
	 END DO
	 CLOSE(25)
250	 FORMAT(F20.8,',',F20.8)	 

c      *********************************************
	 SELECT CASE(flag)

	 CASE(1)

	 WRITE(*,*)'Enter the coil calibration coefficient (1/m)'
	 READ(*,*) a
	 WRITE(*,*)''

	 df=maxf/N

	 OPEN(30,FILE='Scanning_field.CSV')
	 WRITE(30,*)'Hz',',','A/m',',','Oe'
	 DO	i=0,N
	    f=df*i
	    H1=a*V0/DSQRT(R**2+(2.0*pi*f*L)**2)
	    H2=H1*4.0*pi/1000.0
	    WRITE(30,300) f,H1,H2
	 END DO
	 CLOSE(30)
300	 FORMAT(F20.8,',',F20.8,',',F20.8)	 

	 OPEN(40,FILE='Pickup_voltage.CSV')
	 WRITE(40,*)'Hz',',','vind',',','vres'
	 DO	i=0,N
	    f=df*i
	    v=a*mu0*pi*V0*2.0*pi*f*DINT(lc/dw)*Nl*D**2/4.0
	    v=v*(1.0+dw*(Nl-1)/D+dw**2*(NL-1)*(2*Nl-1)/(6.0*D**2))
		vind=v/DSQRT(R**2+(2.0*pi*f*L)**2)
		vres=v/R
	    WRITE(40,400) f,vind,vres
	 END DO
	 CLOSE(40)
400	 FORMAT(F20.8,',',F20.8,',',F20.8)	 

	 CASE(2)

	 WRITE(*,*)'Enter the coil calibration coefficient (Oe/A)'
	 READ(*,*) a
	 WRITE(*,*)''

	 df=maxf/N

	 OPEN(50,FILE='Scanning_field.CSV')
	 WRITE(50,*)'Hz',',','A/m',',','Oe'
	 DO	i=0,N
	    f=df*i
	    H2=a*V0/DSQRT(R**2+(2.0*pi*f*L)**2)
	    H1=H2*1000.0/(4.0*pi)
	    WRITE(50,500) f,H1,H2
	 END DO
	 CLOSE(50)
500	 FORMAT(F20.8,',',F20.8,',',F20.8)	 

	 OPEN(60,FILE='Pickup_voltage.CSV')
	 WRITE(60,*)'Hz',',','vind',',','vres'
	 DO	i=0,N
	    f=df*i
	    v=1.0E-4*a*pi*V0*2.0*pi*f*DINT(lc/dw)*Nl*D**2/4.0
	    v=v*(1.0+dw*(Nl-1)/D+dw**2*(NL-1)*(2*Nl-1)/(6.0*D**2))
		vind=v/DSQRT(R**2+(2.0*pi*f*L)**2)
		vres=v/R
	    WRITE(60,600) f,vind,vres
	 END DO
	 CLOSE(60)
600	 FORMAT(F20.8,',',F20.8,',',F20.8)	 

	 END SELECT

	 OPEN(70,FILE='Coil_parameters.txt')
	 WRITE(70,*)'Excitation coil resistance (Ohm) = ',R
	 WRITE(70,*)'Excitation coil inductance (mH) = ',L*1000.0
	 WRITE(70,*)'Excitation voltage amplitude (V) = ',V0
	 WRITE(70,*)''
	 WRITE(70,*)'****************************************************'
	 WRITE(70,*)''
	 WRITE(70,*)'Pickup coil diameter (mm) = ',D*1000.0
	 WRITE(70,*)'Pickup coil length (mm) = ',lc*1000.0
	 WRITE(70,*)'Pickup coil wire diameter (mm) = ',dw*1000.0
	 WRITE(70,*)'Number of layers = ',Nl
	 WRITE(70,*)'Turns in each layer = ',DINT(lc/dw)
	 WRITE(70,*)'Total turns = ',Nl*DINT(lc/dw)
	 WRITE(70,*)'Total diameter (mm) = ',(D+2*NL*dw)*1000.0
	 CLOSE(70)

       STOP

	 END
