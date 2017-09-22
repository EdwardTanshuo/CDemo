//
//  httpeasy.c
//  Spider
//
//  Created by ShuoTan on 8/12/17.
//  Copyright © 2017 ShuoTan. All rights reserved.
//

#include "httpeasy.h"
#include <stdlib.h>
#include <string.h>



size_t write_data(void *ptr, size_t size, size_t nmemb, TCURLData* data) {
    size_t index = data->size;
    size_t n = (size * nmemb);
    char* tmp;
    
    data->size += (size * nmemb);
    
#ifdef DEBUG
    fprintf(stderr, "data at %p size=%ld nmemb=%ld\n", ptr, size, nmemb);
#endif
    tmp = realloc(data->data, data->size + 1);
    
    if(tmp) {
        data->data = tmp;
    } else {
        if(data->data) {
            free(data->data);
        }
        fprintf(stderr, "Failed to allocate memory.\n");
        return 0;
    }
    
    memcpy((data->data + index), ptr, n);
    data->data[data->size] = '\0';
    
    return size * nmemb;
}


TCCURLCode tc_post(const char* url, char* body, TCURLData* response) {
    CURLcode res;
    CURL* curl = curl_easy_init();
    if(!curl) {
        return CURLE_FAILED_INIT;
    }
    curl_easy_setopt(curl, CURLOPT_URL, url);
    curl_easy_setopt(curl, CURLOPT_POST, 1);
    curl_easy_setopt(curl, CURLOPT_POSTFIELDS, body);
    curl_easy_setopt(curl, CURLOPT_READFUNCTION, NULL);
    curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, write_data);
    curl_easy_setopt(curl, CURLOPT_WRITEDATA, (void*)response);
    curl_easy_setopt(curl, CURLOPT_NOSIGNAL, 1);
    curl_easy_setopt(curl, CURLOPT_SSL_VERIFYPEER, 0);
    curl_easy_setopt(curl, CURLOPT_SSL_VERIFYHOST, 0);
    curl_easy_setopt(curl, CURLOPT_CONNECTTIMEOUT, 3000);
    curl_easy_setopt(curl, CURLOPT_TIMEOUT, 3);
    res = curl_easy_perform(curl);
    curl_easy_cleanup(curl);
    return res;
}

TCCURLCode tc_get(const char* url, TCURLData* response) {
    CURLcode res;
    CURL* curl = curl_easy_init();
    if(NULL == curl) {
        return CURLE_FAILED_INIT;
    }
    curl_easy_setopt(curl, CURLOPT_URL, url);
    curl_easy_setopt(curl, CURLOPT_READFUNCTION, NULL);
    curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, write_data);
    curl_easy_setopt(curl, CURLOPT_WRITEDATA, (void*)response);
    curl_easy_setopt(curl, CURLOPT_NOSIGNAL, 1);
    curl_easy_setopt(curl, CURLOPT_CONNECTTIMEOUT, 3000);
    curl_easy_setopt(curl, CURLOPT_TIMEOUT, 3000);
    curl_easy_setopt(curl, CURLOPT_COOKIEFILE, "./cookie.txt");
    curl_easy_setopt(curl, CURLOPT_COOKIEJAR, "./cookie.txt");
    curl_easy_setopt(curl, CURLOPT_VERBOSE, 1);
    curl_easy_setopt(curl, CURLOPT_FOLLOWLOCATION, 1);
    res = curl_easy_perform(curl);
    curl_easy_cleanup(curl);
    return res;
}
