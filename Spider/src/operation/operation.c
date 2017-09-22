//
//  operation.c
//  Spider
//
//  Created by ShuoTan on 8/15/17.
//  Copyright © 2017 ShuoTan. All rights reserved.
//

#include "operation.h"
#include <string.h>
#include <stdlib.h>
#include <regex.h>

static void tc_fetch_url(char* src, int size) {
    char start[16] = "href=\"/question";
    int flag = 0;
    int start_pos = 0;
    int pos = 0;
    
    while(pos < size - 15) {
        if(!flag && !memcmp(start, src + pos, 15)) {
            flag = 1;
            pos = start_pos = pos + 6;
        } else if(flag && src[pos] == '\"'){
            pos--;
            break;
        } else {
            pos++;
        }
    }
    if(start_pos != 0) {
        char temp[256];
        memcpy(temp, src + start_pos, pos - start_pos + 1);
        temp[pos - start_pos + 1] = '\0';
        sprintf(src, "https://www.zhihu.com%s", temp);
    } else {
        src[0] = '\0';
    }
}



static TCAnswerList* tc_parse_list(char* str, int size) {
    TCAnswerList* result = malloc(sizeof(TCAnswerList));
    memset(result, 0, sizeof(TCAnswerList));
    
    int flag = 0;
    int pos = 0;
    int count = 0;
    int start = 0;
    
    char** list = NULL;
    
    while(pos < size - 10) {
        if(str[pos] == '<' && flag == 0) {
            int ret = memcmp(str + pos, "<a target=", 10);
            if(!ret) {
                start = pos;
                flag = 1;
                pos += 10;
            } else {
                pos += 10;
            }
        } else if(str[pos] == '>' && flag == 1) {
            flag = 0;
            if(!list) {
                list = malloc(sizeof(char*));
                list[0] = malloc(pos - start + 2);
                memcpy(list[0], str + start, pos - start + 1);
                list[0][pos - start + 1] = 0;
                tc_fetch_url(list[count], pos - start + 2);
            } else {
                list = realloc(list, sizeof(char*) * (count + 1));
                list[count] = malloc(pos - start + 2);
                memcpy(list[count], str + start, pos - start + 1);
                list[count][pos - start + 1] = 0;
                tc_fetch_url(list[count], pos - start + 2);
            }
            count++;
            pos++;
        } else
            pos++;
    }
    result->list = list;
    result->size = count;
   
    return result;
}

void tc_clean_list(TCAnswerList* target) {
    int size = target->size;
    for(int i = 0; i < size; i++) {
        free(target->list[i]);
    }
    free(target->list);
    free(target);
    *(&target) = NULL;
}

TCCURLCode tc_fetch_list(char* key, int limit, TCURLData* response, TCAnswerList** list) {
    if(response->data)
        free(response->data);
    response->size = 0;
    response->data = malloc(4096); /* reasonable size initial buffer */
    response->data[0] = '\0';
    char* key_encoded = url_encode(key);
    char c[MAX_URL_LEN];
    
    sprintf(c, "https://www.zhihu.com/r/search?q=%s&correction=1&type=content&offset=%d", key_encoded, limit);
    free(key_encoded);
    TCCURLCode ret = tc_get(c, response);
    
    //gen list
    *list = tc_parse_list(response->data, (int)(response->size));
    return ret;
}



