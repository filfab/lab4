#pragma once
#include <stdbool.h>

typedef struct factor {
    unsigned base;
    unsigned exponent;
} factor;
factor Init(unsigned b, unsigned e);

typedef struct node {
    factor elem;
    struct node* next;
} node;
typedef node* node_ptr;

typedef struct list_struct {
    node_ptr first;
    node_ptr last;
    int length;
} list_struct;
typedef list_struct* list_t;

bool is_empty(list_t l);
factor pop(list_t l);
// void push(list_t l, factor e);
void append(list_t l, factor e);

// factor get(list_t l, int i);
// void put(list_t l, int i, factor e);
// void insert(list_t l, int i, factor e);
// void del(list_t l, int i);

// void print(list_t l);
// int length(list_t l);
void clean(list_t l);

// node_ptr find(list_t l, int i);
// void test(list_t l);
