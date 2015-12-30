//
//  XLPlistFileManger.m
//  CWZA
//
//  Created by kun on 15/12/25.
//  Copyright © 2015年 北京中交兴路车联网科技有限公司. All rights reserved.
//

#import "XLPlistFileManger.h"

static XLPlistFileManger* _instance = nil;

@implementation XLPlistFileManger


+(instancetype) shareInstance
{
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        _instance = [[super allocWithZone:NULL] init] ;
    }) ;
    
    return _instance ;
}

- (NSMutableArray *)dataArray
{
    if(_dataArray == nil)
    {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}


- (NSArray *)dataArrayS
{
    if(_dataArrayS == nil)
    {
        _dataArrayS = [NSArray array];
    }
    return  _dataArrayS;
}

+(id) allocWithZone:(struct _NSZone *)zone
{
    return [XLPlistFileManger shareInstance] ;
}

-(id) copyWithZone:(struct _NSZone *)zone
{
    return [XLPlistFileManger shareInstance] ;
}



//返回数组数据
- (NSArray *) getPlistArrayData:(NSString *)plistName
{
    
    [self.dataArray removeAllObjects];
    
    //先判断是否存在该文件
    NSFileManager *fm = [NSFileManager defaultManager];
    //找到Documents文件所在的路径
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //取得第一个Documents文件夹的路径
    NSString *filePath = [path objectAtIndex:0];
    //把TestPlist文件加入
    NSString *plistPath = [filePath stringByAppendingPathComponent:plistName];
    
    //
    //NSArray *dataArray = nil;
    
    if([fm fileExistsAtPath:plistPath] == YES)
    {
        self.dataArrayS = [NSArray arrayWithContentsOfFile:plistPath];
    }
    else
    {
        //创建plist文件
        if([fm createFileAtPath:plistPath contents:nil attributes:nil])
        {
            //copy资源包数据到doc中
            NSString * s_path = [[NSBundle mainBundle] pathForResource:plistName ofType:nil];
             self.dataArrayS = [NSArray arrayWithContentsOfFile:s_path];
            //写入数据
            [ self.dataArrayS writeToFile:plistPath atomically:YES];
        }
    }
    return  self.dataArrayS;
}

- (NSMutableArray *) getPlistMutableArrayData:(NSString *)plistName
{
    //清空之前数据
    [self.dataArray removeAllObjects];
    
    //先判断是否存在该文件
    NSFileManager *fm = [NSFileManager defaultManager];
    //找到Documents文件所在的路径
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //取得第一个Documents文件夹的路径
    NSString *filePath = [path objectAtIndex:0];
    //把TestPlist文件加入
    NSString *plistPath = [filePath stringByAppendingPathComponent:plistName];
    
    //
    //NSMutableArray *dataArray = nil;
    
    if([fm fileExistsAtPath:plistPath] == YES)
    {
        self.dataArray = [NSMutableArray arrayWithContentsOfFile:plistPath];
    }
    else
    {
        //创建plist文件
        if([fm createFileAtPath:plistPath contents:nil attributes:nil])
        {
            //copy资源包数据到doc中
            NSString * s_path = [[NSBundle mainBundle] pathForResource:plistName ofType:nil];
            self.dataArray = [NSMutableArray arrayWithContentsOfFile:s_path];
            //写入数据
            [self.dataArray writeToFile:plistPath atomically:YES];
        }
    }
    return self.dataArray;
}



//返回字典数据
- (NSDictionary *) getPlistDictionryData:(NSString *)plistName
{
    //先判断是否存在该文件
    NSFileManager *fm = [NSFileManager defaultManager];
    //找到Documents文件所在的路径
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //取得第一个Documents文件夹的路径
    NSString *filePath = [path objectAtIndex:0];
    //把TestPlist文件加入
    NSString *plistPath = [filePath stringByAppendingPathComponent:plistName];
    
    //
    NSDictionary *dictionaryData = nil;
    
    if([fm fileExistsAtPath:plistPath] == YES)
    {
        dictionaryData = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    }
    else
    {
        //创建plist文件
        if([fm createFileAtPath:plistPath contents:nil attributes:nil])
        {
            //copy资源包数据到doc中
            NSString * s_path = [[NSBundle mainBundle] pathForResource:plistName ofType:nil];
             dictionaryData = [NSDictionary dictionaryWithContentsOfFile:s_path];;
            //写入数据
            [dictionaryData writeToFile:plistPath atomically:YES];
        }
    }
    return dictionaryData;
}


//返回data数据
- (NSData *) getPlistData:(NSString *)plistName
{
    //先判断是否存在该文件
    NSFileManager *fm = [NSFileManager defaultManager];
    //找到Documents文件所在的路径
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //取得第一个Documents文件夹的路径
    NSString *filePath = [path objectAtIndex:0];
    //把TestPlist文件加入
    NSString *plistPath = [filePath stringByAppendingPathComponent:plistName];
    
    //
    NSData *datas = nil;
    
    if([fm fileExistsAtPath:plistPath] == YES)
    {
        datas = [NSData dataWithContentsOfFile:plistPath];
    }
    else
    {
        //创建plist文件
        if([fm createFileAtPath:plistPath contents:nil attributes:nil])
        {
            //copy资源包数据到doc中
            NSString * s_path = [[NSBundle mainBundle] pathForResource:plistName ofType:nil];
            datas = [NSData dataWithContentsOfFile:s_path];;
            //写入数据
            [datas writeToFile:plistPath atomically:YES];
        }
    }
    return datas;
}


//返回plist文件位置
#pragma mark 获取文件plist沙盒路径
- (NSString *) getPlistPath:(NSString *)plistName
{
    NSFileManager *fm = [NSFileManager defaultManager];
    //找到Documents文件所在的路径
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    //取得第一个Documents文件夹的路径
    NSString *filePath = [path objectAtIndex:0];
    
    //把TestPlist文件加入
    
    NSString *plistPath = [filePath stringByAppendingPathComponent:plistName];
    //Get documents directory
    if ([fm fileExistsAtPath:plistPath]==YES) {
    }
    else
    {
        [fm createFileAtPath:plistPath contents:nil attributes:nil];
    }
    
    //开始创建文件
    return plistPath;
}


//返回数据类型
- (BOOL) writeDataToPlist:(id)Datas withPath:(NSString *)path
{
    return [Datas writeToFile:path atomically:YES];
}



@end
