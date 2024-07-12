#include <stdio.h>
#include <log4c.h>


int main(){
	init_logger(DEBUG, "test.log");
	for(int i=0;i<=3;i++){
		debug("logger test %i %s %f", i, "okok", 3.14f);
		info("logger test %i %s %f", i, "okok", 3.14f);
		warn("logger test %i %s %f", i, "okok", 3.14f);
		error("logger test %i %s %f", i, "okok", 3.14f);
		set_level(i+1);
	}
	return 0;
}