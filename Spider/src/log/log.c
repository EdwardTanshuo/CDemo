//
//  log.c
//  Spider
//
//  Created by ShuoTan on 8/15/17.
//  Copyright © 2017 ShuoTan. All rights reserved.
//

#include "log.h"
#include <stdio.h>
#include <time.h>

static FILE *f = NULL;

void tc_print_log(TCLogType type, char* info, char* path) {
    if(!f) {
        f = fopen(path, "a+");
        if(!f) {
            printf("could not open log file: %s\n", path);
            exit(1);
        }
    }
    
    time_t timer;
    char time_buffer[26];
    struct tm* tm_info;
    
    time(&timer);
    tm_info = localtime(&timer);
    
    strftime(time_buffer, 26, "%Y-%m-%d %H:%M:%S", tm_info);
    puts(time_buffer);
    
    switch (type) {
        case TCLogTypeList:
            fprintf(f, "[LIST]: %s\n%s\n", time_buffer, info);
            break;
            
        default:
            break;
    }
    
    //fclose(f);
}
