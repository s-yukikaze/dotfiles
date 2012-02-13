#include <windows.h>

#if !defined(FR_PRIVATE)
#define FR_PRIVATE 0x10
#endif

const char * load_font(char *fontpath)
{
    int (WINAPI *pAddFontResourceExA)(LPCSTR, DWORD, LPVOID);
    *(FARPROC*)&pAddFontResourceExA = GetProcAddress(GetModuleHandle("gdi32"), "AddFontResourceExA");
    if (pAddFontResourceExA != NULL) pAddFontResourceExA(fontpath, FR_PRIVATE, NULL);
    return "";
}

