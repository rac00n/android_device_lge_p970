#include <fcntl.h>
#include <string.h>
#include <cutils/properties.h>
#include <cutils/log.h>

#define LOG_TAG "bdaddr"
#define BDADDR_IF_PATH "/sys/devices/platform/bd_address/bdaddr_if"
#define BDADDR_PATH "/data/bdaddr"

/* Read bluetooth MAC from BDADDR_IF_PATH (different format),
 * write it to BDADDR_PATH, and set ro.bt.bdaddr_path to BDADDR_PATH
 *
 * Adapted from bdaddr_read.c of thunderg
 */

int main() {
    char tmpbdaddr[23]; // bt_macaddr:xxxxxxxxxxxx
    char bdaddr[18];
    int fd;

    FILE* fp = fopen(BDADDR_PATH,"r");
    if(fp!=NULL)
    {
        fgets(tmpbdaddr,23,fp);
        fflush(fp);
        fclose(fp);
        if (tmpbdaddr[0] == 0)
        {
            fprintf(stderr, "read(%s) failed\n", BDADDR_IF_PATH);
            ALOGE("Can't read %s\n", BDADDR_IF_PATH);
            return -1;
        }
    }
    else
    {
        fclose(fp);
        return -1;
    }

    sprintf(bdaddr, "%2.2s:%2.2s:%2.2s:%2.2s:%2.2s:%2.2s\0",
            tmpbdaddr,tmpbdaddr+2,tmpbdaddr+4,tmpbdaddr+6,tmpbdaddr+8,tmpbdaddr+10);

    fd = open(BDADDR_PATH, O_WRONLY|O_CREAT|O_TRUNC, 00600|00060|00006);
    if (fd < 0) {
        fprintf(stderr, "open(%s) failed\n", BDADDR_PATH);
        ALOGE("Can't open %s\n", BDADDR_PATH);
        return -2;
    }
    write(fd, bdaddr, 18);

    // Set bluetooth owner
    fchown(fd, 1002, 1002);

    close(fd);
    property_set("ro.bt.bdaddr_path", BDADDR_PATH);
    return 0;
}
