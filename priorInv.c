#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"
#include "spinlock.h"

int fd = 1;


void runHP()
{
    printf(1, "Starting High Priority\n");
    sleep(500);
    printf(1, "High got lock %d\n", fd);
    funlock(fd);   
    exit();
}

void startHP()
{
    int pid = fork();
    if (pid < 0)
    {
        // error
    }
    if (pid == 0)
    {
        // this is the child process
        runHP();
    }
    else
    {
        // this is the parent process
        // we incriment to make the child process the highest priority
        nice(pid, 10);  
    }        
    
}

int main(int argc, const char *argv[])
{
    // aquire lock
    flock(fd);
    printf(1, "Low got lock %d\n", fd);

    // start child processes
    startHP();
    startHP();
    startHP();

    sleep(10);
    int counter = 6;
    // lower priority process running
    while (counter > 0)
    {
        printf(1, "...Low priority running...\n");
        sleep(50);
        counter -= 1;
    }
    printf(1, "Low releasing lock %d\n", fd);
    funlock(fd);

    // wait on the child processes as to not create zombies
    int pidOne = wait();
    int pidTwo = wait();
    printf(1, "%d exited\n", pidOne);
    printf(1, "%d exited\n", pidTwo);

    // wait before exit just to be safe
    wait();
    exit();
    return 0;

}