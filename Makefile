#-----------------------------------------------------------------------------
# Quy Lam
# qlam
# 12M
# 03/30/16
#-----------------------------------------------------------------------------
# Makefile
# Makefile to complile two HelloUser classes
# A Makefile with macros 
#-----------------------------------------------------------------------------

JAVASRC    = HelloUser.java HelloUser2.java
SOURCES    = README Makefile $(JAVASRC)
MAINCLASS  = HelloUser2
CLASSES    = HelloUser.class HelloUser2.class
JARFILE    = Hello
SUBMIT     = submit cmps012b-pt.s16 lab1
CHECK      = ls /afs/cats.ucsc.edu/class/cmps012b-pt.s16/lab1/qlam

all: $(JARFILE)

$(JARFILE): $(CLASSES)
	echo Main-class: $(MAINCLASS) > Manifest	
	jar cvfm $(JARFILE) Manifest $(CLASSES)
	rm Manifest
	chmod +x $(JARFILE)

$(CLASSES): $(JAVASRC)
	javac -Xlint $(JAVASRC)

clean:
	rm $(CLASSES) $(JARFILE)

submit: $(SOURCES)
	$(SUBMIT) $(SOURCES)

check:
	$(CHECK)