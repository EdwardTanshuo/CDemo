//
//  operation.h
//  Spider
//
//  Created by ShuoTan on 8/15/17.
//  Copyright © 2017 ShuoTan. All rights reserved.
//

#ifndef operation_h
#define operation_h

#include <stdio.h>
#include "httpeasy.h"
#include "tc_utils.h"

#define MAX_URL_LEN 512

typedef struct _tc_answer_list {
    int size;
    char** list;
} TCAnswerList;

TCCURLCode tc_fetch_list(char* key, int limit, TCURLData* response, TCAnswerList** list);
void tc_clean_list(TCAnswerList* target);

#endif /* operation_h */
