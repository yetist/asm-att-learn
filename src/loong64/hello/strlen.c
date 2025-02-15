/* vi: set sw=4 ts=4 sts=4 expandtab wrap ai: */
/*
 * strlen.c: This file is part of ____
 *
 * Copyright (C) 2021 yetist <yetist@yetipc>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program; if not, write to the Free Software Foundation, Inc.,
 * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 * */

#include <stdio.h>

int main(int argc, char** argv)
{
    int i = 0;
    while(i < argc) {
        printf("%s\n", argv[i]);
        i++;
    }
    return 0;
}
