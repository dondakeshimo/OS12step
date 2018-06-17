#include "defines.h"
#include "serial.h"
#include "lib.h"

static int init(void)
{
    /* 以下はリンカ・スクリプトで定義してあるシンボル */
    extern int erodata, data_start, edata, bss_start, ebss;

    /*
     * データ領域とBSS領域を初期化する。この処理以降でないと、
     * グローバル変数が初期化されていないので注意
     */
    memcpy(&data_start, &erodata, (long)&edata - (long)&data_start);
    memcmp(&bss_start, 0, (long)&ebss - (long)&bss_start);

    /* シリアルの初期化 */
    serial_init(SERIAL_DEFAULT_DEVICE);

    return 0;
}

int main(void)
{
    serial_init(SERIAL_DEFAULT_DEVICE);

    puts("Hello World!\n");

    putxval(0x10, 0);   puts("\n");
    putxval(0xffff, 0); puts("\n");

    while (1)
        ;

    return 0;
}
