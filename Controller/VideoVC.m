//
//  VideoVC.m
//  CreatingNodeServer
//
//  Created by HAI DANG on 3/30/18.
//  Copyright © 2018 HAI DANG. All rights reserved.
//

#import "VideoVC.h"
#import <WebKit/WebKit.h>
@interface VideoVC () <WKNavigationDelegate>
@property (weak, nonatomic) IBOutlet WKWebView *webView;

@property (weak, nonatomic) IBOutlet UILabel *titleLbl;

@property (weak, nonatomic) IBOutlet UILabel *descLbl;

@end

@implementation VideoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.webView.navigationDelegate = self;
    
    self.titleLbl.text = self.video.videoTitle;
    
    self.descLbl.text = self.video.videoDescription;
    
    [self.webView loadHTMLString:self.video.videoIframe baseURL:nil];
    
    [self injectJavascriptToWkWebview:self.webView];
    
}


- (IBAction)backBtnPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)injectJavascriptToWkWebview:(WKWebView*)webView {
    
    NSString *css = @".iframe-youtube {width: 100%; height: 100%;}";
    
    NSString* js = [NSString stringWithFormat:
                    @"var styleNode = document.createElement('style');\n"
                    "styleNode.type = \"text/css\";\n"
                    "var styleText = document.createTextNode('%@');\n"
                    "styleNode.appendChild(styleText);\n"
                    "document.getElementsByTagName('head')[0].appendChild(styleNode);\n",css];
    
    WKUserScript *userScript = [[WKUserScript alloc] initWithSource:js
                                                      injectionTime:WKUserScriptInjectionTimeAtDocumentEnd
                                                   forMainFrameOnly:YES];
    
    [self.webView.configuration.userContentController addUserScript:userScript];
    
    [[self webView] reload];
    
}

@end
