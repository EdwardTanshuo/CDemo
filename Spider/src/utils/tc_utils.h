//
//  util.h
//  Robot
//
//  Created by ShuoTan on 5/29/17.
//  Copyright © 2017 ShuoTan. All rights reserved.
//
#ifndef util_h
#define util_h

#include <dlfcn.h>
#include <errno.h>
#include <fcntl.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <assert.h>

#ifdef __GNUC__
#define likely(x)       __builtin_expect(!!(x), 1)
#define unlikely(x)     __builtin_expect(!!(x), 0)
#else
#define likely(x)       (x)
#define unlikely(x)     (x)
#endif

#define tc_assert(x, info) \
        if(!(x)){printf("[ASSERT] - : "); printf(info); printf("\n");} \
        assert(x); 

#define tc_malloc(type) \
        ((type*)malloc(sizeof(type)))\

#define tc_malloc_nb(type, nb) \
        ((type*)malloc(sizeof(type) * (nb)))

#define tc_log(domain, x) \
        printf("[DEBUG] - %s: %s\n", (domain), (x))

#define tc_append(target, new_str, size) \
        (realloc(sizeof(type)))

#define tc_init(p, type)\
        memset(p, 0, sizeof(type))

#define tc_error(domain, x) \
        printf("[ERROR] - %s: %s\n", (domain), (x))

void rand_str(char *dest, size_t length);
char *url_encode(char *str);
char *url_decode(char *str);
#endif /* util_h */
