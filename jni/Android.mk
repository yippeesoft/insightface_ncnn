LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
OpenCV_CAMERA_MODULES := off
APP_ALLOW_MISSING_DEPS=true
LOCAL_CFLAGS += -fopenmp
LOCAL_CPPFLAGS += -fopenmp
LOCAL_LDFLAGS += -fopenmp

LOCAL_CFLAGS += -pie -fPIE
LOCAL_LDFLAGS += -pie -fPIE
 

LOCAL_C_INCLUDES := $(LOCAL_PATH)/include \
			../opencv/include \
			../ncnn/include

LOCAL_STATIC_LIBRARIES := \
			../opencv/lib  
LOCAL_STATIC_LIBRARIES+= ../opencv/3rdlib \
			../ncnn/lib/

LOCAL_CFLAGS += -fexceptions -frtti  -fopenmp -pthread  -fopenmp
LOCAL_CFLAGS += -std=c++11

LOCAL_LDFLAGS = -L../ncnn/lib -L../opencv/lib
LOCAL_STATIC_LIBRARIES += libopencv_contrib libopencv_legacy libopencv_ml libopencv_stitching libopencv_nonfree libopencv_objdetect libopencv_videostab libopencv_calib3d libopencv_photo libopencv_video libopencv_features2d libopencv_highgui libopencv_androidcamera libopencv_flann libopencv_imgproc libopencv_ts libopencv_core
# LOCAL_LDLIBS += -lz -llog -lncnn    -landroid     -lopencv_core  -lopencv_imgcodecs -lopencv_imgproc \
#     -ltbb -lcpufeatures -ltegra_hal -llibwebp -lIlmImf -llibjpeg -llibpng -llibtiff -llibjasper
 LOCAL_LDLIBS += -lopencv_dnn -lopencv_ml -lopencv_objdetect -lopencv_shape -lopencv_stitching -lopencv_superres \
        -lopencv_videostab -lopencv_calib3d -lopencv_features2d -lopencv_highgui -lopencv_videoio -lopencv_imgcodecs \
		-lIlmImf -llibjpeg -llibjasper -llibpng -llibtiff -llibwebp \
		-lopencv_video -lopencv_photo -lopencv_imgproc -lopencv_flann -lopencv_core -ltegra_hal -llog -lcpufeatures -lz -ltbb \
		-lncnn  -lgomp
# LOCAL_LDLIBS += -lpthread

LOCAL_MODULE    := ncnn
LOCAL_SRC_FILES := base.cpp arcface.cpp mtcnn.cpp main.cpp
 
include $(BUILD_EXECUTABLE)