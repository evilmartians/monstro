//
//  MonstroView.m
//  Monstro
//
//  Created by codefo on 22/10/16.
//  Copyright © 2016 Evil Martians. All rights reserved.
//

#import "MonstroView.h"
#import <WebKit/WebKit.h>

@implementation MonstroView

- (instancetype)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    if (!(self = [super initWithFrame:frame isPreview:isPreview])) return nil;
    
    NSURL* pageURL = [NSURL URLWithString:[[[NSURL fileURLWithPath:[[NSBundle bundleForClass:self.class].resourcePath stringByAppendingString:@"/page.html"] isDirectory:NO] description] stringByAppendingFormat:@""]];
    
    WebView* webView = [[WebView alloc] initWithFrame:NSMakeRect(0, 0, frame.size.width, frame.size.height)];
    webView.drawsBackground = NO;
    [webView.mainFrame loadRequest:[NSURLRequest requestWithURL:pageURL cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30.0]];
    
    [self addSubview:webView];
    
    return self;
}

- (void)animateOneFrame
{
    [self stopAnimation];
}

@end
