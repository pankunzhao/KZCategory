//
//  XLPlistFileManger.h
//  CWZA
//
//  Created by kun on 15/12/25.
//  Copyright © 2015年 北京中交兴路车联网科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XLPlistFileManger : NSObject

/**
 *  单例实现获取文件
 *
 */
+(instancetype) shareInstance;


/**
 *  获取plist文件，如果沙盒没有就复制一份，到沙盒，沙盒存在直接返回沙盒数据
 *
 *  @param plistName plist文件名字 @"xxx.plist"
 *
 *  @return 返回数组类型
 */
- (NSArray *) getPlistArrayData:(NSString *)plistName;


/**
 *  获取plist文件，如果沙盒没有就复制一份，到沙盒，沙盒存在直接返回沙盒数据
 *
 *  @param plistName plist文件名字 @"xxx.plist"
 *
 *  @return 返回可变数组
 */
- (NSMutableArray *) getPlistMutableArrayData:(NSString *)plistName;


/**
 *  获取plist文件，如果沙盒没有就复制一份，到沙盒，沙盒存在直接返回沙盒数据
 *
 *  @param plistName plist文件名字 @"xxx.plist"
 *
 *  @return 返回字典类型
 */
- (NSDictionary *) getPlistDictionryData:(NSString *)plistName;




/**
 *  获取plist文件，如果沙盒没有就复制一份，到沙盒，沙盒存在直接返回沙盒数据
 *
 *  @param plistName plist文件名字 @"xxx.plist"
 *
 *  @return 返回data类型
 */
- (NSData *) getPlistData:(NSString *)plistName;



/**
 *  获取plist文件沙盒路径,存在返回，不存在创建文件
 *
 *  @param plistName @"xxx.plist"
 *
 *  @return 返回沙盒路径
 */
- (NSString *) getPlistPath:(NSString *)plistName;




/**
 *  写数据到plist文件
 *
 *  @param Datas 数据源
 *  @param path  路径
 *
 *  @return yes  or  no
 */

- (BOOL) writeDataToPlist:(id)Datas withPath:(NSString *)path;



@property(nonatomic,strong) NSMutableArray *dataArray;

@property (nonatomic,strong) NSArray *dataArrayS;


@end
