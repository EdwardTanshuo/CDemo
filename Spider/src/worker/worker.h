//
//  worker.h
//  Robot
//
//  Created by ShuoTan on 5/29/17.
//  Copyright © 2017 ShuoTan. All rights reserved.
//
#ifndef worker_h
#define worker_h

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <pthread.h>
#include <assert.h>

#define DEFAULT_POOL_SIZE   500
#define MAX_RECYCLE_SIZE    500
#define MAX_WAITING_SIZE    500
#define HASH_LENGTH         32
#define ARG_LENGTH          128



//线程结构
typedef struct _tc_worker{
    int                 is_working;
    void*               (*process)(char* arg);
    struct _tc_worker*  next;
    pthread_t           cur_thread;
    char                ID[HASH_LENGTH + 1];
    char                arg[ARG_LENGTH];
} TCWorker;

//线程队列
typedef struct _tc_worker_queue{
    TCWorker*   head;
    TCWorker*   tail;
    
    int         size;
    int         max_size;
} TCWorkerQueue;

/*线程池结构*/
typedef struct _tc_pool{
    pthread_mutex_t queue_lock;
    pthread_cond_t queue_ready;
    
    TCWorkerQueue *waiting_queue;
    TCWorkerQueue *recycle_queue;
    TCWorkerQueue *working_queue;
    
    /*是否销毁线程池*/
    int shutdown;
    /*tid*/
    pthread_t *threadid;
    /*线程池中允许的活动线程数目*/
    int max_thread_num;
} TCPool;

int worker_pool_init(int max_thread_num);
int worker_start(void *(*process) (char *arg), char *arg, int block);
int worker_pool_destroy();
#endif /* worker_h */
