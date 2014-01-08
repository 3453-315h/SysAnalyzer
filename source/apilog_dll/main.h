/*
'License:   GPL
'Copyright: 2005 iDefense a Verisign Company
'Site:      http://labs.idefense.com
'
'Author:    David Zimmer <david@idefense.com, dzzie@yahoo.com>
'
'         This program is free software; you can redistribute it and/or modify it
'         under the terms of the GNU General Public License as published by the Free
'         Software Foundation; either version 2 of the License, or (at your option)
'         any later version.
'
'         This program is distributed in the hope that it will be useful, but WITHOUT
'         ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
'         FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
'         more details.
'
'         You should have received a copy of the GNU General Public License along with
'         this program; if not, write to the Free Software Foundation, Inc., 59 Temple
'         Place, Suite 330, Boston, MA 02111-1307 USA
*/

#include <intrin.h>
#include <psapi.h>
#pragma comment(lib, "psapi.lib")


HMODULE  (__stdcall *Real_LoadLibraryA)(LPCSTR a0) = NULL;
BOOL     (__stdcall *Real_WriteFile)(HANDLE a0,LPCVOID a1,DWORD a2,LPDWORD a3,LPOVERLAPPED a4) = NULL;
HANDLE   (__stdcall *Real_CreateFileA)(LPCSTR a0,DWORD a1,DWORD a2,LPSECURITY_ATTRIBUTES a3,DWORD a4,DWORD a5,HANDLE a6) = NULL;
HMODULE  (__stdcall *Real_LoadLibraryExA)(LPCSTR a0,HANDLE a1,DWORD a2) = NULL;
HMODULE  (__stdcall *Real_LoadLibraryExW)(LPCWSTR a0,HANDLE a1,DWORD a2) = NULL;
HMODULE  (__stdcall *Real_LoadLibraryW)(LPCWSTR a0) = NULL;
BOOL	  (__stdcall *Real_WriteFileEx)(HANDLE a0,LPCVOID a1,DWORD a2,LPOVERLAPPED a3,LPOVERLAPPED_COMPLETION_ROUTINE a4) ;
HFILE    (__stdcall *Real__lclose)(HFILE a0) = NULL;
HFILE	  (__stdcall *Real__lcreat)(LPCSTR a0,int a1) = NULL;
HFILE	  (__stdcall *Real__lopen)(LPCSTR a0,int a1) = NULL;
UINT	  (__stdcall *Real__lread)(HFILE a0,LPVOID a1,UINT a2) = NULL;
UINT	  (__stdcall *Real__lwrite)(HFILE a0,LPCSTR a1,UINT a2) = NULL;
BOOL	  (__stdcall *Real_CreateProcessA)(LPCSTR a0,LPSTR a1,LPSECURITY_ATTRIBUTES a2,LPSECURITY_ATTRIBUTES a3,BOOL a4,DWORD a5,LPVOID a6,LPCSTR a7,struct _STARTUPINFOA* a8,LPPROCESS_INFORMATION a9) = NULL;
UINT	  (__stdcall *Real_WinExec)(LPCSTR a0,UINT a1) = NULL;
BOOL	  (__stdcall *Real_DeleteFileA)(LPCSTR a0) = NULL;
void	  (__stdcall *Real_ExitProcess)(UINT a0) = NULL;
void	  (__stdcall *Real_ExitThread)(DWORD a0) = NULL;
FARPROC  (__stdcall *Real_GetProcAddress)(HMODULE a0,LPCSTR a1) = NULL;
DWORD	  (__stdcall *Real_WaitForSingleObject)(HANDLE a0,DWORD a1) = NULL;
HANDLE	  (__stdcall *Real_CreateRemoteThread)(HANDLE a0,LPSECURITY_ATTRIBUTES a1,DWORD a2,LPTHREAD_START_ROUTINE a3,LPVOID a4,DWORD a5,LPDWORD a6) = NULL;
HANDLE	  (__stdcall *Real_OpenProcess)(DWORD a0,BOOL a1,DWORD a2) = NULL;
BOOL	  (__stdcall *Real_WriteProcessMemory)(HANDLE a0,LPVOID a1,LPVOID a2,DWORD a3,LPDWORD a4) = NULL;
HMODULE  (__stdcall *Real_GetModuleHandleA)(LPCSTR a0) = NULL;
SOCKET	  (__stdcall *Real_accept)(SOCKET a0,sockaddr* a1,int* a2) = NULL;
int	  (__stdcall *Real_bind)(SOCKET a0,SOCKADDR_IN* a1,int a2) = NULL;
int	  (__stdcall *Real_closesocket)(SOCKET a0) = NULL;
int	  (__stdcall *Real_connect)(SOCKET a0,SOCKADDR_IN* a1,int a2) = NULL;
hostent* (__stdcall *Real_gethostbyaddr)(char* a0,int a1,int a2) = NULL;
hostent* (__stdcall *Real_gethostbyname)(char* a0) = NULL;
int	  (__stdcall *Real_gethostname)(char* a0,int a1) = NULL;
int	  (__stdcall *Real_listen)(SOCKET a0,int a1) = NULL;
int	  (__stdcall *Real_recv)(SOCKET a0,char* a1,int a2,int a3) = NULL;
int	  (__stdcall *Real_send)(SOCKET a0,char* a1,int a2,int a3) = NULL;
int	  (__stdcall *Real_shutdown)(SOCKET a0,int a1) = NULL;
SOCKET   (__stdcall *Real_socket)(int a0,int a1,int a2) = NULL;
int	  (__stdcall *Real_URLDownloadToFileA)(int a0,char* a1, char* a2, DWORD a3, int a4) = NULL;
int	  (__stdcall *Real_URLDownloadToCacheFileA)(int a0,char* a1, char* a2, DWORD a3, DWORD a4, int a5) = NULL;
LPSTR    (__stdcall *Real_GetCommandLineA)( VOID ) = NULL;
BOOL     (__stdcall *Real_IsDebuggerPresent)(VOID) = NULL;
BOOL     (__stdcall *Real_GetVersionExA)( LPOSVERSIONINFOA a0 ) = NULL;
HGLOBAL  (__stdcall *Real_GlobalAlloc)( UINT a0, DWORD a1 ) = NULL;
DWORD    (__stdcall *Real_GetCurrentProcessId)( VOID ) = NULL;
BOOL     (__stdcall *Real_DebugActiveProcess)( DWORD a0 ) = NULL;
BOOL     (__stdcall *Real_ReadFile)( HANDLE a0, LPVOID a1, DWORD a2, LPDWORD a3, LPOVERLAPPED a4 ) = NULL;
VOID     (__stdcall *Real_GetSystemTime)( LPSYSTEMTIME a0 ) = NULL;
HANDLE   (__stdcall *Real_CreateMutexA)(int a0, int a1, int a2) = NULL;
BOOL     (__stdcall *Real_ReadProcessMemory)( HANDLE a0, PVOID64 a1, PVOID64 a2, DWORD a3, LPDWORD a4 ) = NULL;
DWORD    (__stdcall *Real_GetVersion)(void) = NULL;
BOOL     (__stdcall *Real_CopyFileA)(char* lpExistingFile, char* lpNewFile, BOOL bFailIfExists) = NULL;
BOOL	  (__stdcall *Real_InternetGetConnectedState)( LPDWORD a0, DWORD a1 ) = NULL;
int (__stdcall *Real_RegCreateKeyA )( HKEY a0, LPCSTR a1, PHKEY a2 ) = NULL;
int (__stdcall *Real_RegDeleteKeyA )( HKEY a0, LPCSTR a1 ) = NULL;
int (__stdcall *Real_RegDeleteValueA )( HKEY a0, LPCSTR a1 ) = NULL;
int (__stdcall *Real_RegEnumKeyA )( HKEY a0, DWORD a1, LPSTR a2, DWORD a3 ) = NULL;
int (__stdcall *Real_RegEnumValueA )( HKEY a0, DWORD a1, LPSTR a2, LPDWORD a3, LPDWORD a4, LPDWORD a5, LPBYTE a6, LPDWORD a7 ) = NULL;
int (__stdcall *Real_RegQueryValueA )( HKEY a0, LPCSTR a1, LPSTR a2, PLONG   a3 ) = NULL;
int (__stdcall *Real_RegSetValueA )( HKEY a0, LPCSTR a1, DWORD a2, LPCSTR a3, DWORD a4 ) = NULL;
int (__stdcall *Real_RegCreateKeyExA )( HKEY a0, LPCSTR a1, DWORD a2, LPSTR a3, DWORD a4, REGSAM a5, LPSECURITY_ATTRIBUTES a6, PHKEY a7, LPDWORD a8 ) = NULL;
int (__stdcall *Real_RegOpenKeyA )( HKEY a0, LPCSTR a1, PHKEY a2 ) = NULL;
int (__stdcall *Real_RegOpenKeyExA )( HKEY a0, LPCSTR a1, DWORD a2, REGSAM a3, PHKEY a4 ) = NULL;
int (__stdcall *Real_RegQueryValueExA )( HKEY a0, LPCSTR a1, LPDWORD a2, LPDWORD a3, LPBYTE a4, LPDWORD a5 ) = NULL;
int (__stdcall *Real_RegSetValueExA )( HKEY a0, LPCSTR a1, DWORD a2, DWORD a3, CONST BYTE* a4, DWORD a5 ) = NULL;
VOID (__stdcall *Real_Sleep)( DWORD a0 ) = NULL;
DWORD (__stdcall *Real_GetTickCount)( VOID ) = NULL;
int (__stdcall *Real_ZwQuerySystemInformation)(int SystemInformationClass, int SystemInformation, int SystemInformationLength, int ReturnLength) = NULL;
int (__stdcall *Real_ZwSystemDebugControl)( int Command, int InputBuffer, int InputBufferLength,int OutputBuffer, int OutputBufferLength, int ReturnLength) = NULL;
BOOL (__stdcall *Real_CloseHandle)( HANDLE a0 ) = NULL;
LPVOID (__stdcall *Real_VirtualAllocEx)( HANDLE a0, LPVOID a1, DWORD a2, DWORD a3, DWORD a4 ) = NULL;
HANDLE (__stdcall *Real_CreateToolhelp32Snapshot)(DWORD dwFlags,DWORD th32ProcessID) = NULL;  //11.26.13
BOOL   (__stdcall *Real_Process32First)(HANDLE hSnapshot, LPPROCESSENTRY32 lppe) = NULL;     // 
BOOL   (__stdcall *Real_Process32Next)(HANDLE hSnapshot, LPPROCESSENTRY32 lppe) = NULL;     // 
BOOL   (__stdcall *Real_Module32First)(HANDLE hSnapshot, LPMODULEENTRY32 lpme) = NULL;     // 
BOOL   (__stdcall *Real_Module32Next)(HANDLE hSnapshot, LPMODULEENTRY32 lpme) = NULL;     // 


void msg(char);
void LogAPI(const char*, ...);

bool Warned=false;
HWND hServer=0;
int DumpAt=0;

extern int myPID;

void GetDllPath(char* buf){ //returns full path of dll
	
	HMODULE h = GetModuleHandleA("api_log.dll");
	if( h == NULL ) h = GetModuleHandleA("api_log.x64.dll");
	if( h == NULL ){ buf[0]=0; return;}

	HANDLE hProc = Real_OpenProcess(PROCESS_QUERY_INFORMATION | PROCESS_VM_READ, 0 , GetCurrentProcessId() );
	GetModuleFileNameExA(hProc, h , buf, MAX_PATH);
	CloseHandle(hProc);

}

/*
int bInstr(char *buf, char *match, int bufLen, int matchLen){

	int i, j;

	for(i=0; i < bufLen ; i++){
		
		if(buf[i] == match[0]){
			for(j=1; j < matchLen; j++){
				if(buf[i+j] != match[j]) break;
			}
			if(j==matchLen) return i;
		}

	}

	return -1;
}


void Seek_n_Destroy_AntiVmWare(char *calledFrom, int searchSz){

	 
	char *vmdetect="\xB8\x68\x58\x4D\x56\x8B\x5D";
	void *disable ="\xB8\x68\x61\x68\x61";
	DWORD r;
   
	int ret = bInstr( calledFrom, vmdetect, searchSz, 7);
	

	if(ret > 0){
	        				
			 int *offset = (int *)( (int)calledFrom + ret);
			 
		     HANDLE h = OpenProcess(PROCESS_ALL_ACCESS, -1 , GetCurrentProcessId());
			 WriteProcessMemory(h, offset, disable, 5, &r);
			 CloseHandle(h);

			 char buf[400];
			 if(h > 0){
				sprintf(buf, "*****   Anti-Vmware Code Disabled at offset %x", (int)calledFrom + ret);
			 }else{
				sprintf(buf, "*****   Anti-Vmware Code disable FAILED at offset %x", (int)calledFrom + ret);
			 }

			 LogAPI(buf);

	}

}
*/

char* ipfromlng(SOCKADDR_IN* sck){
	
	char *ip = (char*)malloc(16);
	unsigned char *x= (unsigned char*)(((int)sck)+4);
	sprintf(ip,"%d.%d.%d.%d\x00", x[0], x[1], x[2], x[3]);
	return ip;

}

void GetHive(HKEY hive, char* buf){

	switch((int)hive){
		case 0x80000000:
				 strcpy(buf, "HKCR\\");
				 break;
		
		case 0x80000001:
				 strcpy(buf, "HKCU\\");
				 break;

		case 0x80000002:
					 strcpy(buf, "HKLM\\");
					 break;

		case 0x80000003:
					 strcpy(buf, " HKU\\");
					 break;

		case 0x80000004 :
					 strcpy(buf, "HKPD\\");
					 break;

		case 0x80000005 :
					 strcpy(buf, "HKPD\\");
					 break;

		case 0x80000006 :
					 strcpy(buf, "HKCC\\");
					 break;
	
		default:
					 //sprintf(buf, "%x", (int)hive);
					 buf[0] = 0;

	};
}



//todo: if we cant find message window dump to log file?

void FindVBWindow(){
	char *vbIDEClassName = "ThunderFormDC" ;
	char *vbEXEClassName = "ThunderRT6FormDC" ;
	char *vbWindowCaption = "ApiLogger" ;

	hServer = FindWindowA( vbIDEClassName, vbWindowCaption );
	if(hServer==0) hServer = FindWindowA( vbEXEClassName, vbWindowCaption );

	if(hServer==0){
		if(!Warned){
			MessageBox(0,"Could not find msg window","",0);
			Warned=true;
		}
	}
	else{
		if(!Warned){
			//first time we are being called we could do stuff here...
			Warned=true;

		}
	}	

} 

char msgbuf[0x1001];

int msg(char *Buffer){
  
  if(hServer==0) FindVBWindow();
  
  COPYDATASTRUCT cpStructData;
  memset(&cpStructData,0, sizeof(struct tagCOPYDATASTRUCT )) ;
  
  _snprintf(msgbuf, 0x1000, "%x,%s", myPID, Buffer);

  cpStructData.dwData = 3;
  cpStructData.cbData = strlen(msgbuf) ;
  cpStructData.lpData = (void*)msgbuf;
  
  int ret = SendMessage(hServer, WM_COPYDATA, 0,(LPARAM)&cpStructData);

  //if ret == 0x then do something special like reconfig ?

  return ret;

} 

void LogAPI(const char *format, ...)
{
	DWORD dwErr = GetLastError();
		
	if(format){
		char buf[1024]; 
		va_list args; 
		va_start(args,format); 
		try{
 			 _vsnprintf(buf,1024,format,args);
			 msg(buf);
		}
		catch(...){}
	}

	SetLastError(dwErr);
}

#define	CalledFrom() (int)_ReturnAddress()

/*__declspec(naked) int CalledFrom(){ 
	
	_asm{
			 mov eax, [ebp+4]  //return address of parent function (were nekkid)
			 ret
	}
	
}*/

 

