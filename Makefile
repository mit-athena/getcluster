# Makefile for getcluster
#
#	MIT Project Athena
#
#	$Source: /afs/dev.mit.edu/source/repository/athena/bin/getcluster/Makefile,v $
#	$Header: /afs/dev.mit.edu/source/repository/athena/bin/getcluster/Makefile,v 1.4 1989-09-14 11:33:35 epeisach Exp $

DESTDIR=
CFLAGS=-O
PROGS= getcluster

all: ${PROGS}

getcluster:	getcluster.o
	$(CC) getcluster.o -o getcluster -lhesiod

install: ${PROGS}
	for i in ${PROGS} ; do  \
		install -c -m 755 -s $$i ${DESTDIR}/bin/athena/$$i; \
	done
	install -c -m 644 getcluster.8 ${DESTDIR}/usr/man/man8
	install -c -m 755 save_cluster_info.sh \
		${DESTDIR}/etc/athena/save_cluster_info

clean:  ;
	-rm -f getcluster getcluster.o *~

depend:
	/usr/athena/makedepend ${CFLAGS} getcluster.c

	
