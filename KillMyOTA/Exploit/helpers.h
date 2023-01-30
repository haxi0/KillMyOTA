#ifndef helpers_h
#define helpers_h

char* get_temp_file_path(void);
void test_nsexpressions(void);
char* set_up_tmp_file(void);

void xpc_crasher(char* service_name);
void respring(void); // credits to https://gist.github.com/Avangelista/bf2fa5319f8920fcc09ea061ecb56cf3

#define ROUND_DOWN_PAGE(val) (val & ~(PAGE_SIZE - 1ULL))

#endif /* helpers_h */
