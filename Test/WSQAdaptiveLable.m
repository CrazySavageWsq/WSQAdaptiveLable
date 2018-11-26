//
//  WSQAdaptiveLable.m
//  Test
//
//  Created by Crazy Wang on 2018/11/12.
//  Copyright © 2018年  Crazy Wang. All rights reserved.
//

#import "WSQAdaptiveLable.h"

@interface  WSQAdaptiveLable()
{
    WSQAdaptiveLableType tageType;
    WSQAdaptiveLableSingleOrMultiple sigMul;
}


@end


@implementation WSQAdaptiveLable


/**
*  初始化
*
*  @param frame    frame
*  @param tagArray 标签数组
*
*  
*/
- (instancetype)initWithFrame:(CGRect)frame tagArray:(NSArray*)tagArray andType:(WSQAdaptiveLableType)type andSingleOrMultiple:(WSQAdaptiveLableSingleOrMultiple)singleOrMultiple{
    
    self = [super initWithFrame:frame];
    if (self) {
        _tagArray = tagArray;
        tageType = type;
        sigMul = singleOrMultiple;
        _selseData = [NSMutableArray new];
        [self setUp];
        
    }
    return self;
}

// 初始化默认的属性
- (void)setUp{
    
    // 默认颜色
    _btnH = 20.0;
    _textColorNormal = [UIColor darkGrayColor];
    _textColorSelected = [UIColor redColor];
    _backgroundColorSelected = [UIColor whiteColor];
    _backgroundColorNormal = [UIColor whiteColor];
    _borderColorNormal = [UIColor lightGrayColor];
    _borderColorSelected = [UIColor redColor];
    _textFontNormal = [UIFont systemFontOfSize:14.0f];
    _textFontSelected = [UIFont systemFontOfSize:14.0f];

    
    // 创建标签按钮
    [self createTagButton];
}

// 重写set属性
- (void)setTagArray:(NSMutableArray *)tagArray{
    
    _tagArray = tagArray;
    
    // 重新创建标签
    [self resetTagButton];
}


// 重写set属性
- (void)setBtnH:(CGFloat)btnH{
    
    _btnH = btnH;
    
    // 重新创建标签
    [self resetTagButton];
}
- (void)setTextColorSelected:(UIColor *)textColorSelected{
    
    _textColorSelected = textColorSelected;
    // 重新创建标签
    [self resetTagButton];
}

- (void)setTextColorNormal:(UIColor *)textColorNormal{
    
    _textColorNormal = textColorNormal;
    // 重新创建标签
    [self resetTagButton];
}

- (void)setBackgroundColorSelected:(UIColor *)backgroundColorSelected{
    
    _backgroundColorSelected = backgroundColorSelected;
    // 重新创建标签
    [self resetTagButton];
}

- (void)setBackgroundColorNormal:(UIColor *)backgroundColorNormal{
    
    _backgroundColorNormal = backgroundColorNormal;
    // 重新创建标签
    [self resetTagButton];
}

- (void)setTextFontNormal:(UIFont *)textFontNormal{
    _textFontNormal = textFontNormal;
    // 重新创建标签
    [self resetTagButton];
    
}

- (void)setTextFontSelected:(UIFont *)textFontSelected{
    
    _textFontSelected = textFontSelected;
    // 重新创建标签
    [self resetTagButton];
}


#pragma mark - 清空当前的View上所有子控制器

// 重新创建标签
- (void)resetTagButton{
    
    // 移除之前的标签
    for (UIView* sub in self.subviews) {
        [sub removeFromSuperview];
    }
    // 重新创建标签
    [self createTagButton];
}

// 创建标签按钮
- (void)createTagButton{
    
    /* 初始化数据  */
    
    //记录判断是否需要创建标签的父view
    CGFloat backBseH = 0.0;
    //为了记录每行按钮的背景view
    NSInteger heng = 0;
    //整个self的高度
    _selfHeight = 0.0;
   
    // 距离左边距
    CGFloat leftX = 0;
    // 距离上边距
    CGFloat topY = 10;
    // 按钮左右间隙
    CGFloat marginX = 10;
    // 按钮上下间隙
    CGFloat marginY = 10;
    // 文字左右间隙
    CGFloat fontMargin = 10;
    
    
    //开始创建标签按钮
    for (int i = 0; i < _tagArray.count; i++) {
        
        UIButton* btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(0 + leftX, 0, 100, _btnH);
        btn.tag = 100+i;

        // 按钮文字
        [btn setTitle:_tagArray[i] forState:UIControlStateNormal];
        

        //按钮文字默认样式
        NSMutableAttributedString* btnDefaultAttr = [[NSMutableAttributedString alloc]initWithString:btn.titleLabel.text];
        // 文字大小
        [btnDefaultAttr addAttribute:NSFontAttributeName value:_textFontNormal range:NSMakeRange(0, btn.titleLabel.text.length)];
        // 默认颜色
        [btnDefaultAttr addAttribute:NSForegroundColorAttributeName value:self.textColorNormal range:NSMakeRange(0, btn.titleLabel.text.length)];
        [btn setAttributedTitle:btnDefaultAttr forState:UIControlStateNormal];
        // 默认背景颜色
        [btn setBackgroundImage:[self imageWithColor:self.backgroundColorNormal] forState:UIControlStateNormal];
       
        
        // 选中字体颜色
        NSMutableAttributedString* btnSelectedAttr = [[NSMutableAttributedString alloc]initWithString:btn.titleLabel.text];
        // 选中颜色
        [btnSelectedAttr addAttribute:NSForegroundColorAttributeName value:self.textColorSelected range:NSMakeRange(0, btn.titleLabel.text.length)];
        // 选中文字大小
        [btnSelectedAttr addAttribute:NSFontAttributeName value:_textFontSelected range:NSMakeRange(0, btn.titleLabel.text.length)];
        [btn setAttributedTitle:btnSelectedAttr forState:UIControlStateSelected];
        // 选中背景颜色
        [btn setBackgroundImage:[self imageWithColor:self.backgroundColorSelected] forState:UIControlStateSelected];
        
        // 圆角
        btn.layer.cornerRadius = btn.frame.size.height / 2.f;
        btn.layer.masksToBounds = YES;
        // 边框
        btn.layer.borderColor = self.borderColorNormal.CGColor;
        btn.layer.borderWidth = 0.5;
   
        
        // 设置按钮的边距、间隙
        [self setTagButtonMargin:btn fontMargin:fontMargin];
        
      
        // 处理换行
        if (btn.frame.origin.x + btn.frame.size.width + marginX > self.frame.size.width) {
            // 换行
            topY += _btnH + marginY;
            
            // 重置
            leftX = 0;
            btn.frame = CGRectMake(leftX, 0, 100, _btnH);
            
            // 设置按钮的边距、间隙
            [self setTagButtonMargin:btn fontMargin:fontMargin];
            
        };
        
        // 重置按钮高度
        CGRect frame = btn.frame;
        frame.size.height = _btnH;
        btn.frame = frame;
               
        //----- 选中事件
        [btn addTarget:self action:@selector(selectdButton:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = 250 +i;
        leftX += btn.frame.size.width + marginX;
        
        
        //如果不等就创建一个新的view
        if (backBseH != topY) {
            
            //是为了判断在同一行上的
            backBseH = topY;
            
            NSLog(@"backBseH:%f topY:%f",backBseH,topY);
            heng = heng +1;
            
            NSLog(@"heng:%ld",heng);
              UIView *seBackView = [[UIView alloc]initWithFrame:CGRectMake(0, backBseH, self.bounds.size.width, _btnH + marginY)];
            seBackView.tag = 5000+heng;
            [self addSubview:seBackView];
            seBackView.backgroundColor = [UIColor clearColor];
            
        }
        //设置按钮view的相对self的位置
        [self reSetVewFreme:btn andHeng:heng andbackH:backBseH andWeith:leftX -marginX];


      if (i ==_tagArray.count -1 ) {//取最后一个按钮的高度
            _selfHeight = CGRectGetHeight(btn.frame) +topY;
        }
    }
    //返回整个self的高度
    _selfHeight = _selfHeight+marginY;
    

}

// 设置按钮是居中还是居左还是居右
- (void)reSetVewFreme:(UIButton *)btn andHeng:(NSInteger)heng andbackH:(CGFloat)backBseh andWeith:(CGFloat)weth {
    
    UIView *view = (UIView *) [self viewWithTag:5000+heng];
    [view addSubview:btn];
    
    if (tageType == WSQAdaptiveLableTypeLeft) {
        
        view.frame  =CGRectMake(0.0, backBseh , weth, CGRectGetMaxY(btn.frame) );

    }else if (tageType == WSQAdaptiveLableTypeCenter){
       
        view.frame  =CGRectMake((self.bounds.size.width -weth)/2.0, backBseh , weth, CGRectGetMaxY(btn.frame) );

    }else if (tageType == WSQAdaptiveLableTypeRight){
        view.frame  =CGRectMake(self.bounds.size.width -weth, backBseh , weth, CGRectGetMaxY(btn.frame));

    }
    
    
}

// 设置按钮的边距、间隙
- (void)setTagButtonMargin:(UIButton*)btn fontMargin:(CGFloat)fontMargin{
    
    // 按钮自适应
    [btn sizeToFit];
    
    // 重新计算按钮文字左右间隙
    CGRect frame = btn.frame;
    frame.size.width += fontMargin*2;
    btn.frame = frame;
}

// 根据颜色生成UIImage
- (UIImage*)imageWithColor:(UIColor*)color{
    
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    // 开始画图的上下文
    UIGraphicsBeginImageContext(rect.size);
    
    // 设置背景颜色
    [color set];
    // 设置填充区域
    UIRectFill(CGRectMake(0, 0, rect.size.width, rect.size.height));
    
    // 返回UIImage
    UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
    // 结束上下文
    UIGraphicsEndImageContext();
    return image;
}

#pragma mark - 点击事件

// 标签按钮点击事件
- (void)selectdButton:(UIButton*)btn{
    
    if (sigMul == WSQAdaptiveLableMultiple) {//多选
        
        btn.selected = !btn.selected;
        
        
        //返回选中的标签数组下标
        if (btn.selected) {
            
            [self.selseData addObject:[NSString stringWithFormat:@"%ld",btn.tag-250]];
            btn.layer.borderColor = self.borderColorSelected.CGColor;
            
        }else{
            for (int i = 0; i <self.selseData.count; i ++) {
                
                if ([self.selseData[i] isEqualToString:[NSString stringWithFormat:@"%ld",btn.tag-250]]) {
                    
                    [self.selseData removeObjectAtIndex:i];
                }
            }
            btn.layer.borderColor = self.borderColorNormal.CGColor;
        }
        NSLog(@"%@,%ld",self.selseData,self.selseData.count);
        
        
    }else{//单选
        self.selseData = [NSMutableArray new];
        for (UIView *sub in self.subviews) {
            
            for (UIView *ssub in sub.subviews) {
                
                if ([ssub isKindOfClass:[UIButton class]]) {
                    
                    UIButton *ssubtn = (UIButton *)ssub;
                    
                    if (ssubtn.tag == btn.tag) {
                        btn.selected = !btn.selected;
                        [self.selseData addObject:[NSString stringWithFormat:@"%ld",btn.tag-250]];

                    }else{
                        ssubtn.selected = NO;
                    }
                }
            }
        }
    }
    NSLog(@"%@,%ld",self.selseData,self.selseData.count);

   

}


@end
