﻿#import "MaterialInfoArchive.h"

@implementation MaterialInfoArchive

// 得到沙盒文件路径
+(NSString *)getFilePathName
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePathName = [documentsDirectory stringByAppendingPathComponent:@"MaterialInfo.archive"];
    return filePathName;
}

// 解档数组
+(NSMutableArray *)getList
{
    return [NSKeyedUnarchiver unarchiveObjectWithFile:[MaterialInfoArchive getFilePathName]];
}

// 归档数组
+(void)saveList:(NSMutableArray *)list
{
    if(list != nil)
    {
        //归档
        [NSKeyedArchiver archiveRootObject:list toFile:[MaterialInfoArchive getFilePathName]];
    }
}

@end

