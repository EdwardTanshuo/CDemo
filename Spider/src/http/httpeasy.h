//
//  httpeasy.h
//  Spider
//
//  Created by ShuoTan on 8/12/17.
//  Copyright © 2017 ShuoTan. All rights reserved.
//

#ifndef httpeasy_h
#define httpeasy_h

#include <stdio.h>
#include "curl.h"

#define TCCURLCode CURLcode

typedef struct _tc_url_data {
    size_t size;
    char* data;
} TCURLData;

TCCURLCode tc_post(const char* url, char* body, TCURLData* response);
TCCURLCode tc_get(const char* url, TCURLData* response);

#endif /* httpeasy_h */
