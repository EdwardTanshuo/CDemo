//
//  worker.c
//  Robot
//
//  Created by ShuoTan on 5/29/17.
//  Copyright © 2017 ShuoTan. All rights reserved.
//
#include "worker.h"
#include "tc_utils.h"

//share resource
static TCPool* pool = NULL;

// queue operation
#define tc_queue_front(queue) \
        ((queue)->head)

#define tc_dequeue(queue) \
        if((queue)->size == 1) { \
            (queue)->tail = (queue)->head = NULL; \
        } else { \
            (queue)->head = (queue)->head->next; \
        } \
        (queue)->size--

#define tc_enqueue(queue, newWorker) \
        if((queue)->size == 0) { \
            (queue)->head = (queue)->tail = newWorker; \
            (newWorker)->next = NULL; \
        } else { \
            (queue)->tail = (queue)->tail->next = (newWorker); \
            (queue)->tail->next = NULL; \
        } \
        (queue)->size++

#define tc_remove(queue, target) \
        TCWorker* iter = NULL; \
        TCWorker* pre = NULL; \
        for(iter = (queue)->head; iter != NULL; iter = iter->next) { \
            if(iter == (target)) { \
                if(pre) { \
                    pre->next = iter->next; \
                } else { \
                    (queue)->head = iter->next; \
                } \
                (queue)->size--; \
                if((queue)->size == 0) { \
                    (queue)->head = (queue)->tail = NULL; \
                } \
                iter->next = NULL; \
                break; \
            } \
            pre = iter; \
        }


#define tc_init_worker(newWorker, process, arg) \
        (newWorker)->process = (process); \
        memset((newWorker)->arg, 0, ARG_LENGTH); \
        memcpy((newWorker)->arg, arg, ARG_LENGTH); \
        (newWorker)->is_working = 0; \
        (newWorker)->next = NULL; \
        rand_str(newworker->ID, HASH_LENGTH); \
        newworker->ID[HASH_LENGTH] = '\0'

#define tc_queue_is_full(queue) \
        ((queue)->size >= (queue)->max_size)

#define tc_queue_is_empty(queue) \
        ((queue)->size == 0)


// router
void *thread_routine (void *arg);

//initialize pool
int worker_pool_init(int max_thread_num) {
    if(pool) {
        tc_log("pool", "already inited");
        return -1;
    }
    if(max_thread_num <= 0) {
        max_thread_num = DEFAULT_POOL_SIZE;
    }
    pool = tc_malloc(TCPool);
    tc_init(pool, TCPool);
    
    pthread_mutex_init (&(pool->queue_lock), NULL);
    pthread_cond_init (&(pool->queue_ready), NULL);
  
    pool->max_thread_num = max_thread_num;
    pool->threadid  = tc_malloc_nb(pthread_t, max_thread_num);
    
    // create queues
    pool->working_queue = tc_malloc(TCWorkerQueue);
    pool->waiting_queue = tc_malloc(TCWorkerQueue);
    pool->recycle_queue = tc_malloc(TCWorkerQueue);
    
    // init queues
    tc_init(pool->working_queue, TCWorkerQueue);
    pool->working_queue->max_size = max_thread_num;
    tc_init(pool->waiting_queue, TCWorkerQueue);
    pool->waiting_queue->max_size = MAX_WAITING_SIZE;
    tc_init(pool->recycle_queue, TCWorkerQueue);
    pool->waiting_queue->max_size = MAX_RECYCLE_SIZE;;
  
    // create threads
    int i = 0;
    for(i = 0; i < max_thread_num; i++) {
        pthread_create (&(pool->threadid[i]), NULL, thread_routine,NULL);
    }

#ifdef DEBUG_LOG
    tc_log("pool", "inited");
#endif
    return 0;
}

// add workers into waiting queue
int worker_start(void *(*process) (char *arg), char *arg, int block) {
    TCWorker* newworker = NULL;
    if(!pool){
        return -1;
    }
    
    pthread_mutex_lock(&(pool->queue_lock));
    if(!block && tc_queue_is_full(pool->waiting_queue)) {
        pthread_mutex_unlock(&(pool->queue_lock));
        return -1;
    }
    
    while (tc_queue_is_full(pool->waiting_queue) && !pool->shutdown && block) {
        pthread_cond_wait(&(pool->queue_ready), &(pool->queue_lock));
    }
    
    //if pool need shutdown, do nothing
    if(pool->shutdown){
        pthread_mutex_unlock(&(pool->queue_lock));
        return -1;
    }
    
    // if there is a recycled worker, dequeue it from recycle queue
    if(pool->recycle_queue && !tc_queue_is_empty(pool->recycle_queue)) {
        newworker = tc_queue_front(pool->recycle_queue);
        tc_dequeue(pool->recycle_queue);
        
    } else {
        // initialize the worker, assign it with a random ID
        newworker = tc_malloc(TCWorker);
        if(!newworker) {
            pthread_mutex_unlock(&(pool->queue_lock));
            return -1;
        }
    }
    tc_init_worker(newworker, process, arg);
    
    /*将任务加入到等待队列中*/
    tc_enqueue(pool->waiting_queue, newworker);
    char str[200];
    sprintf(str, "working: %d; waiting: %d; recycle: %d", pool->working_queue->size, pool->waiting_queue->size, pool->recycle_queue->size);
#ifdef DEBUG_LOG
    tc_log("worker added", str);
#endif
    pthread_mutex_unlock (&(pool->queue_lock));
    pthread_cond_signal (&(pool->queue_ready));
    return 0;
}

int worker_pool_destroy() {
    /*防止两次调用*/
    if (pool->shutdown)
        return -1;
    pool->shutdown = 1;
    pthread_cond_broadcast (&(pool->queue_ready));
  
    int i;
    for (i = 0; i < pool->max_thread_num; i++)
        pthread_join (pool->threadid[i], NULL);
    free (pool->threadid);
    
    /*销毁等待队列*/
    TCWorker* head = NULL;
    while (tc_queue_is_empty(pool->waiting_queue)){
        head = tc_queue_front(pool->waiting_queue);
        tc_dequeue(pool->waiting_queue);
        free(head);
    }
    
    /*销毁对象池*/
    while (pool->recycle_queue != NULL){
        head = tc_queue_front(pool->recycle_queue);
        tc_dequeue(pool->recycle_queue);
        free(head);
    }
    
    /*销毁工作队列*/
    while (pool->working_queue != NULL){
        head = tc_queue_front(pool->working_queue);
        tc_dequeue(pool->working_queue);
        free(head);
    }
    pthread_mutex_destroy(&(pool->queue_lock));
    pthread_cond_destroy(&(pool->queue_ready));
    
    free(pool->working_queue);
    free(pool->waiting_queue);
    free(pool->recycle_queue);
    free(pool);
    pool = NULL;
#ifdef DEBUG_LOG
    tc_log("pool", "destroyed");
#endif
    return 0;
}

void *thread_routine(void *arg) {
    while(true){
        pthread_mutex_lock (&(pool->queue_lock));
        while ((tc_queue_is_full(pool->working_queue) || tc_queue_is_empty(pool->waiting_queue)) && !pool->shutdown) {
            pthread_cond_wait (&(pool->queue_ready), &(pool->queue_lock));
        }
        
        if (pool->shutdown) {
            pthread_mutex_unlock (&(pool->queue_lock));
            pthread_exit (NULL);
        }
    
        TCWorker* worker = tc_queue_front(pool->waiting_queue);
        worker->cur_thread = pthread_self();
        tc_dequeue(pool->waiting_queue);
        tc_enqueue(pool->working_queue, worker);
        
        pthread_mutex_unlock (&(pool->queue_lock));
        
        //执行任务
        worker->is_working = 1;
#ifdef DEBUG_LOG
        tc_log(worker->ID, "begin");
#endif
        (*(worker->process)) (worker->arg);
#ifdef DEBUG_LOG
        tc_log(worker->ID, "done");
#endif
        worker->is_working = 0;
        
        //回收工作
        pthread_mutex_lock (&(pool->queue_lock));
        tc_remove(pool->working_queue, worker);
        
        if(tc_queue_is_full(pool->recycle_queue)) {
            free(worker);
            worker = NULL;
        } else {
            tc_enqueue(pool->recycle_queue, worker);
        }
        pthread_mutex_unlock (&(pool->queue_lock));
        pthread_cond_signal (&(pool->queue_ready));
    }
}
