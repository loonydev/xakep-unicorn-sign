#include <jni.h>
#include <string>
#include <iostream>
#include <algorithm>
#include <iterator>

void revereseArray(int arr[], int start, int end)
{
    while (start < end)
    {
        int temp = arr[start];
        arr[start] = arr[end];
        arr[end] = temp;
        start++;
        end--;
    }
}

int getSize(char* charArray){


    int size = 0;
    for(int i=0; charArray[i]!='\0';i++){
        size++;
    }
    return size;
}

extern "C"
JNIEXPORT jintArray JNICALL
Java_loony_com_nativeexample_MainActivity_magic(JNIEnv *env, jobject instance, jstring test_) {
    const char *test = env->GetStringUTFChars(test_, 0);

    jintArray result;

    const char* nativeString = env->GetStringUTFChars(test_, 0);
    char* copyed =  (char*)nativeString;

    int size = getSize(copyed);
    result = env->NewIntArray(size);

    int charArray[ 6 ] = { 12, 3, 35, 56, 43, 13};
    int j = 0;

    jint fill[size];
    for(int i=0; copyed[i]!='\0';i++) {
        int timeInt = copyed[i] ^charArray[j];
        if (timeInt < 280) {
            fill[i] = timeInt;
        }else{
            fill[i] = 0;
        }
        j = (j>5) ? ( 0 ) : (j+1);
    }
    env->SetIntArrayRegion(result, 0, size, fill);
   return result;
}