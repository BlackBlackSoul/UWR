#include <semaphore.h>
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <sys/wait.h>
#include <unistd.h>
#include <sys/mman.h>
#include <sys/stat.h>


struct Shared
{
    sem_t isEmpty ;
    sem_t isFull ;
    unsigned int count ;
} * g_shm ;

void producer(void) {
    while (1) {     
        sem_wait(&g_shm->isEmpty);
	printf("Wyprodukowalem, aktualna wielkosc magazynu: %d\n", ++g_shm->count);
        sem_post(&g_shm->isFull);
    }
}

void consumer(void) {
    while (1) {
        sem_wait(&g_shm->isFull);
	printf("Pobralem, aktualna wielkosc magazynu: %d\n", --g_shm->count);
        sem_post(&g_shm->isEmpty);
    }
}

int main()
{
    int fileDescriptor = shm_open("/data", O_CREAT | O_RDWR | O_TRUNC, S_IRUSR | S_IWUSR);
    ftruncate(fileDescriptor, sizeof(struct Shared));
    g_shm = mmap( NULL , sizeof(struct Shared ) , PROT_READ | PROT_WRITE , MAP_SHARED, fileDescriptor , 0 );
    sem_init( & g_shm->isEmpty , 1 , 10 );
    sem_init( & g_shm->isFull , 1 , 0 );
    g_shm->count = 0 ;
    int pid;
 
    if ((pid = fork()) < 0){
	perror ("An error occurred during execution \n");
	exit(1);
    } 
    else if ((pid = fork())== 0){
	consumer();
 	exit(0);
    }
    
    
    producer();
    return 1;
}
