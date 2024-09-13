#include <stdio.h>
#include <unistd.h>
#include <pthread.h>

int main() {
    pid_t pid;
    pid = fork();
    
    if (pid == 0) {
        fork();
        pthread_t tid;
        pthread_create(&tid, NULL, NULL, NULL);
    }
    
    fork();
    
    printf("Proceso ID: %d\n", getpid());
    
    // Esperar a que terminen
    sleep(2);
    
    return 0;
}