#  Makefile template for Static library. 
# 1. Compile every *.cpp in the folder 
# 2. All obj files under obj folder
# 3. static library .a at lib folder
# 4. run 'make dirmake' before calling 'make'



CC=avr-g++
CFLAGS= -funsigned-char -funsigned-bitfields -DNDEBUG -I"C:\Program Files (x86)\Atmel\Studio\7.0\Packs\atmel\ATmega_DFP\1.2.150\include" -Os -ffunction-sections -fdata-sections -fpack-struct -fshort-enums -lstdint -mmcu=atmega328pb -B "C:\Program Files (x86)\Atmel\Studio\7.0\Packs\atmel\ATmega_DFP\1.2.150\gcc\dev\atmega328pb" -c -mmcu=atmega328pb
SOURCES= ./src/Adafruit_VL53L0X.h ./src/Adafruit_VL53L0X.cpp ./src/vl53l0x_api.h ./src/vl53l0x_api_calibration.h ./src/vl53l0x_api_core.h ./src/vl53l0x_api_ranging.h ./src/vl53l0x_api_strings.h ./src/vl53l0x_def.h ./src/vl53l0x_device.h ./src/vl53l0x_i2c_platform.h ./src/vl53l0x_interrupt_threshold_settings.h ./src/vl53l0x_platform.h ./src/vl53l0x_platform_log.h ./src/vl53l0x_tuning.h ./src/vl53l0x_types.h
CFILES=./src/Adafruit_VL53L0X.cpp ./src/core/src/vl53l0x_api.cpp ./src/core/src/vl53l0x_api_calibration.cpp ./src/core/src/vl53l0x_api_core.cpp ./src/core/src/vl53l0x_api_ranging.cpp ./src/core/src/vl53l0x_api_strings.cpp ./src/platform/src/vl53l0x_i2c_comms.cpp ./src/platform/src/vl53l0x_platform.cpp

UTILDIR=./src/
UTILFLAG=-ltseutil
UTILLIB=$(UTILDIR)libtseutil.a
UTILC=$(UTILDIR)hash.c $(UTILDIR)html.c $(UTILDIR)file.c $(UTILDIR)dictionary.c
UTILH=$(UTILC:.c=.h)

all:$(SOURCES) $(UTILDIR)*.h
	$(CC) $(CFLAGS) $(CFILES) 
	ar rcsv libVL530L0X.a *.o

clean:
	rm -f *.o *.a Makefile.bak

rebuild: clean all  