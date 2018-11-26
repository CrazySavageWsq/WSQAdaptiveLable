//
//  WSQAdaptiveLable.h
//  Test
//
//  Created by Crazy Wang on 2018/11/12.
//  Copyright © 2018年 Crazy Wang. All rights reserved.
//

#import <UIKit/UIKit.h>

//按钮整体 居左 居中 居右 的样式
typedef NS_ENUM(NSInteger, WSQAdaptiveLableType) {
    WSQAdaptiveLableTypeLeft    =0,         // letf
    WSQAdaptiveLableTypeCenter  =1,          //center
    WSQAdaptiveLableTypeRight   =2,          // right
};

//单选还是多选
typedef NS_ENUM(NSInteger, WSQAdaptiveLableSingleOrMultiple) {
    WSQAdaptiveLableSingle   =0,         // 单选
    WSQAdaptiveLableMultiple  =1,          //多选
};


@interface WSQAdaptiveLable : UIView

/**
 *  初始化
 *
 *  @param frame    frame
 *  @param tagArray 标签数组
 *  @param  type    标签居左还是居右
 *  @param  singleOrMultiple 单选还是多选
 * 
 */
- (instancetype)initWithFrame:(CGRect)frame tagArray:(NSArray*)tagArray andType:(WSQAdaptiveLableType)type andSingleOrMultiple:(WSQAdaptiveLableSingleOrMultiple)singleOrMultiple;



/** 如果不设置以下属性，则使用默认 样式*/

// 标签数组
@property (nonatomic,strong) NSArray* tagArray;
//按钮的高度
@property (nonatomic,assign) CGFloat btnH;
// 选中标签文字颜色
@property (nonatomic,strong) UIColor* textColorSelected;
// 默认标签文字颜色
@property (nonatomic,strong) UIColor* textColorNormal;

// 选中标签背景颜色
@property (nonatomic,strong) UIColor* backgroundColorSelected;
// 默认标签背景颜色
@property (nonatomic,strong) UIColor* backgroundColorNormal;

// 选中标签背景边框色
@property (nonatomic,strong) UIColor* borderColorSelected;
// 默认标签背景边框色
@property (nonatomic,strong) UIColor* borderColorNormal;

//设置默认字体型号与大小
@property (nonatomic,strong) UIFont* textFontNormal;
//设置选中字体型号与大小
@property (nonatomic,strong) UIFont* textFontSelected;

// 标签总高度 获取这个属性能取得整个view所需得的高度
@property (nonatomic,assign) CGFloat selfHeight;
// 选择的标签 获取这个属性能取得选中的按钮的下标数组
@property (nonatomic,strong) NSMutableArray *selseData;

@end
