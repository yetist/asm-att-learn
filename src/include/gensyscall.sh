#!/bin/bash

if [ -z $CC ];then
    CC=gcc
fi

if [ ! -f syscalls.csv ];then
    wget https://github.com/seccomp/libseccomp/raw/main/src/syscalls.csv
fi

defined(){
    local syscall=$1
    cat > test.c << EOF
#define _GNU_SOURCE
#include <unistd.h>
#include <sys/syscall.h>
int test(void)
{
    return $syscall;
}
EOF

    ${CC} -c -o test.o test.c > /dev/null 2>&1
    local retval=$?
    rm -f test.o test.c
    return $retval
}

cat > out.c << ENDLINE
#define _GNU_SOURCE
#include <unistd.h>
#include <sys/syscall.h>
#include <stdio.h>

#define showid(i) do{ printf("#define %-28s\t%d\n", #i, i); } while(0);

int main(int argc, char** argv)
{
ENDLINE

for i in `grep -v "^#" syscalls.csv| awk -F, '{print $1}'`; do
    if defined __NR_${i} ;then
        echo "    showid(__NR_${i});" >> out.c
    fi
done

cat >> out.c << ENDLINE
    return 0;
}
ENDLINE

${CC} -o define out.c
./define |sort -n -k 3
rm -f ./define
