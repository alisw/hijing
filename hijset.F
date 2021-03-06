* $Id$
C
C
C
	SUBROUTINE HIJSET(EFRM,FRAME,PROJ,TARG,IAP,IZP,IAT,IZT)
	CHARACTER FRAME*8,PROJ*8,TARG*8,EFRAME*8
	DOUBLE PRECISION  DD1,DD2,DD3,DD4
#define BLANKET_SAVE
#include "histrng.inc"
#include "hijcrdn.inc"
#include "hiparnt.inc"
#include "hijdat.inc"
#include "ludat1_hijing.inc"
	EXTERNAL FNKICK,FNKICK2,FNSTRU,FNSTRUM,FNSTRUS
	SAVE
	CALL TITLE
	IHNT2(1)=IAP
	IHNT2(2)=IZP
	IHNT2(3)=IAT
	IHNT2(4)=IZT
	IHNT2(5)=0
	IHNT2(6)=0
C
	HINT1(8)=MAX(ULMASS_HIJING(2112),ULMASS_HIJING(2212))
	HINT1(9)=HINT1(8)
C
	IF(PROJ.NE.'A') THEN
		IF(PROJ.EQ.'P') THEN
		    IHNT2(5)=2212
		ELSE IF(PROJ.EQ.'PBAR') THEN 
		    IHNT2(5)=-2212
		ELSE IF(PROJ.EQ.'PI+') THEN
		    IHNT2(5)=211
		ELSE IF(PROJ.EQ.'PI-') THEN
		    IHNT2(5)=-211
		ELSE IF(PROJ.EQ.'K+') THEN
		    IHNT2(5)=321
		ELSE IF(PROJ.EQ.'K-') THEN
		    IHNT2(5)=-321
		ELSE IF(PROJ.EQ.'N') THEN
		    IHNT2(5)=2112
		ELSE IF(PROJ.EQ.'NBAR') THEN
		    IHNT2(5)=-2112
		ELSE
		    WRITE(6,*) PROJ, 'wrong or unavailable proj name'
		    STOP
		ENDIF
		HINT1(8)=ULMASS_HIJING(IHNT2(5))
	ENDIF
	IF(TARG.NE.'A') THEN
		IF(TARG.EQ.'P') THEN
		    IHNT2(6)=2212
		ELSE IF(TARG.EQ.'PBAR') THEN 
		    IHNT2(6)=-2212
		ELSE IF(TARG.EQ.'PI+') THEN
		    IHNT2(6)=211
		ELSE IF(TARG.EQ.'PI-') THEN
		    IHNT2(6)=-211
		ELSE IF(TARG.EQ.'K+') THEN
		    IHNT2(6)=321
		ELSE IF(TARG.EQ.'K-') THEN
		    IHNT2(6)=-321
		ELSE IF(TARG.EQ.'N') THEN
		    IHNT2(6)=2112
		ELSE IF(TARG.EQ.'NBAR') THEN
		    IHNT2(6)=-2112
		ELSE
		    WRITE(6,*) TARG,'wrong or unavailable targ name'
		    STOP
		ENDIF
		HINT1(9)=ULMASS_HIJING(IHNT2(6))
	ENDIF

C...Switch off decay of pi0, K0S, Lambda, Sigma+-, Xi0-, Omega-.
	IF(IHPR2(12).EQ.1) THEN
	CALL LUGIVE_HIJING('MDCY(C111,1)=0')
	CALL LUGIVE_HIJING('MDCY(C310,1)=0')
	CALL LUGIVE_HIJING('MDCY(C411,1)=0;MDCY(C-411,1)=0')
	CALL LUGIVE_HIJING('MDCY(C421,1)=0;MDCY(C-421,1)=0')
	CALL LUGIVE_HIJING('MDCY(C431,1)=0;MDCY(C-431,1)=0')
	CALL LUGIVE_HIJING('MDCY(C511,1)=0;MDCY(C-511,1)=0')
	CALL LUGIVE_HIJING('MDCY(C521,1)=0;MDCY(C-521,1)=0')
	CALL LUGIVE_HIJING('MDCY(C531,1)=0;MDCY(C-531,1)=0')
        CALL LUGIVE_HIJING('MDCY(C3122,1)=0;MDCY(C-3122,1)=0')
        CALL LUGIVE_HIJING('MDCY(C3112,1)=0;MDCY(C-3112,1)=0')
C        CALL LUGIVE_HIJING('MDCY(C3212,1)=0;MDCY(C-3212,1)=0')
        CALL LUGIVE_HIJING('MDCY(C3222,1)=0;MDCY(C-3222,1)=0')
        CALL LUGIVE_HIJING('MDCY(C3312,1)=0;MDCY(C-3312,1)=0')
        CALL LUGIVE_HIJING('MDCY(C3322,1)=0;MDCY(C-3322,1)=0')
        CALL LUGIVE_HIJING('MDCY(C3334,1)=0;MDCY(C-3334,1)=0')
	ENDIF
	IF(IHPR2(12).EQ.2) THEN
	CALL LUGIVE_HIJING('MDCY(C111,1)=0')
	CALL LUGIVE_HIJING('MDCY(C310,1)=0')
	CALL LUGIVE_HIJING('MDCY(C411,1)=0;MDCY(C-411,1)=0')
	CALL LUGIVE_HIJING('MDCY(C421,1)=0;MDCY(C-421,1)=0')
	CALL LUGIVE_HIJING('MDCY(C431,1)=0;MDCY(C-431,1)=0')
	CALL LUGIVE_HIJING('MDCY(C4122,1)=0;MDCY(C-4122,1)=0')
	CALL LUGIVE_HIJING('MDCY(C4132,1)=0;MDCY(C-4132,1)=0')
	CALL LUGIVE_HIJING('MDCY(C4232,1)=0;MDCY(C-4232,1)=0')
	CALL LUGIVE_HIJING('MDCY(C4332,1)=0;MDCY(C-4332,1)=0')
	CALL LUGIVE_HIJING('MDCY(C511,1)=0;MDCY(C-511,1)=0')
	CALL LUGIVE_HIJING('MDCY(C521,1)=0;MDCY(C-521,1)=0')
	CALL LUGIVE_HIJING('MDCY(C531,1)=0;MDCY(C-531,1)=0')
	CALL LUGIVE_HIJING('MDCY(C5122,1)=0;MDCY(C-5122,1)=0')
	CALL LUGIVE_HIJING('MDCY(C5132,1)=0;MDCY(C-5132,1)=0')
	CALL LUGIVE_HIJING('MDCY(C5232,1)=0;MDCY(C-5232,1)=0')
	CALL LUGIVE_HIJING('MDCY(C5332,1)=0;MDCY(C-5332,1)=0')
        CALL LUGIVE_HIJING('MDCY(C3122,1)=0;MDCY(C-3122,1)=0')
        CALL LUGIVE_HIJING('MDCY(C3112,1)=0;MDCY(C-3112,1)=0')
        CALL LUGIVE_HIJING('MDCY(C3222,1)=0;MDCY(C-3222,1)=0')
        CALL LUGIVE_HIJING('MDCY(C3312,1)=0;MDCY(C-3312,1)=0')
        CALL LUGIVE_HIJING('MDCY(C3322,1)=0;MDCY(C-3322,1)=0')
        CALL LUGIVE_HIJING('MDCY(C3334,1)=0;MDCY(C-3334,1)=0')
	ENDIF
	IF(IHPR2(12).EQ.3) THEN
	CALL LUGIVE_HIJING('MDCY(C310,1)=0')
        CALL LUGIVE_HIJING('MDCY(C3122,1)=0;MDCY(C-3122,1)=0')
        CALL LUGIVE_HIJING('MDCY(C3112,1)=0;MDCY(C-3112,1)=0')
        CALL LUGIVE_HIJING('MDCY(C3222,1)=0;MDCY(C-3222,1)=0')
        CALL LUGIVE_HIJING('MDCY(C3312,1)=0;MDCY(C-3312,1)=0')
        CALL LUGIVE_HIJING('MDCY(C3322,1)=0;MDCY(C-3322,1)=0')
        CALL LUGIVE_HIJING('MDCY(C3334,1)=0;MDCY(C-3334,1)=0')
	ENDIF


	MSTU(12)=0
	MSTU(21)=1
	IF(IHPR2(10).EQ.0) THEN
		MSTU(22)=0
		MSTU(25)=0
		MSTU(26)=0
	ENDIF
	MSTJ(12)=IHPR2(11)
	PARJ(21)=HIPR1(2)
	PARJ(41)=HIPR1(3)
	PARJ(42)=HIPR1(4)
C			******** set up for jetset
	IF(FRAME.EQ.'LAB') THEN
	   DD1=EFRM
	   DD2=HINT1(8)
	   DD3=HINT1(9)
	   HINT1(1)=SQRT(HINT1(8)**2+2.0*HINT1(9)*EFRM+HINT1(9)**2)
	   DD4=DSQRT(DD1**2-DD2**2)/(DD1+DD3)
	   HINT1(2)=DD4
	   HINT1(3)=0.5*DLOG((1.D0+DD4)/(1.D0-DD4))
	   DD4=DSQRT(DD1**2-DD2**2)/DD1
	   HINT1(4)=0.5*DLOG((1.D0+DD4)/(1.D0-DD4))
	   HINT1(5)=0.0
	   HINT1(6)=EFRM
	   HINT1(7)=HINT1(9)
	ELSE IF(FRAME.EQ.'CMS') THEN
	   HINT1(1)=EFRM
	   HINT1(2)=0.0
	   HINT1(3)=0.0
	   DD1=HINT1(1)
	   DD2=HINT1(8)
	   DD3=HINT1(9)
	   DD4=DSQRT(1.D0-4.D0*DD2**2/DD1**2)
	   HINT1(4)=0.5*DLOG((1.D0+DD4)/(1.D0-DD4))
	   DD4=DSQRT(1.D0-4.D0*DD3**2/DD1**2)
	   HINT1(5)=-0.5*DLOG((1.D0+DD4)/(1.D0-DD4))
	   HINT1(6)=HINT1(1)/2.0
	   HINT1(7)=HINT1(1)/2.0
	ENDIF
C		********define Lorentz transform to lab frame
c
C		********calculate the cross sections involved with
C			nucleon collisions.
	IF(IHNT2(1).GT.1) THEN
		CALL HIJWDS(IHNT2(1),1,RMAX)
		HIPR1(34)=RMAX
C			********set up Wood-Sax distr for proj.
	ENDIF
	IF(IHNT2(3).GT.1) THEN
		CALL HIJWDS(IHNT2(3),2,RMAX)
		HIPR1(35)=RMAX
C			********set up Wood-Sax distr for  targ.
	ENDIF
C
C
	I=0
20	I=I+1
	IF(I.EQ.10) GO TO 30
	IF(HIDAT0(10,I).LE.HINT1(1)) GO TO 20
30	IF(I.EQ.1) I=2
	DO 40 J=1,9
	   HIDAT(J)=HIDAT0(J,I-1)+(HIDAT0(J,I)-HIDAT0(J,I-1))
     &	   *(HINT1(1)-HIDAT0(10,I-1))/(HIDAT0(10,I)-HIDAT0(10,I-1))
40	CONTINUE
	IF(HIPR1(31).EQ.0) HIPR1(31)=HIDAT(5)
	HIPR1(30)=2.0*HIPR1(31)
C
C
	CALL HIJCRS
C
	IF(IHPR2(5).NE.0) THEN
		CALL HIFUN(3,0.0,36.0,FNKICK)
C		********booking for generating pt**2 for pt kick
	ENDIF
	CALL HIFUN(7,0.0,6.0,FNKICK2)
	CALL HIFUN(4,0.0,1.0,FNSTRU)
	CALL HIFUN(5,0.0,1.0,FNSTRUM)
	CALL HIFUN(6,0.0,1.0,FNSTRUS)
C		********booking for x distribution of valence quarks
	EFRAME='Ecm'
	IF(FRAME.EQ.'LAB') EFRAME='Elab'
	WRITE(6,100) EFRAME,EFRM,PROJ,IHNT2(1),IHNT2(2),
     &               TARG,IHNT2(3),IHNT2(4) 
100	FORMAT(//10X,'**************************************************'/
     &	10X,'*',48X,'*'/
     &	10X,'*         HIJING has been initialized at         *'/
     &	10X,'*',13X,A4,'= ',F10.2,' GeV/n',13X,'*'/
     &	10X,'*',48X,'*'/
     &	10X,'*',8X,'for ',
     &	A4,'(',I3,',',I3,')',' + ',A4,'(',I3,',',I3,')',7X,'*'/
     &	10X,'**************************************************')

	write (*,*),'Average jet cross section (mb): " ', HINT1(10)
	write (*,*),'Jet cross section (mb): " ', HINT1(11)
	write (*,*),'Geometrical N size (mb): ', HIPR1(31)
	write (*,*),'Inelastic NN cross section (mb): ', HINT1(12)
        write (*,*),'Total NN cross section (mb): ',HINT1(13) 
	RETURN
	END
