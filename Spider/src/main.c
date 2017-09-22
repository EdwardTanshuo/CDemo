//
//  main.c
//  Spider
//
//  Created by ShuoTan on 8/11/17.
//  Copyright © 2017 ShuoTan. All rights reserved.
//

#include <stdio.h>
#include "worker.h"
#include "httpeasy.h"
#include "hiredis.h"
#include "log.h"

void* process(char* arg) {
    printf("%s say hello\n", arg);
    sleep(1);
    return NULL;
}

int main(int argc, const char * argv[]) {
    // insert code here...
    redisContext *c = redisConnect("127.0.0.1", 6379);
    
    TCURLData data;
    tc_fetch_list("c++", 0, &data);
    tc_print_log(TCLogTypeList, data.data, "/Users/shuotan/Desktop/log.txt");
    
    return 0;
}
