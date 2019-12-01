//
//  ViewController.m
//  WebBrowser_ObjC
//
//  Created by Shivam Patel on 01/12/19.
//  Copyright © 2019 Shivam Patel. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.webView1 loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://google.com"]]];
    self.searchBar.delegate = self;
    [self.webView1 addSubview:self.actInd];
    
    self.webView1.navigationDelegate = self;
}

- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation {
    
    [self.actInd startAnimating];
}
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    [self.actInd stopAnimating];
}

- (IBAction)stop:(id)sender {
    
    [self.webView1 stopLoading];
    
}



- (IBAction)refresh:(id)sender {
    
    [self.webView1 reload];
    
}

- (IBAction)back:(id)sender {
    
    if (self.webView1.canGoBack) {
        [self.webView1 goBack];
    }
    
}

- (IBAction)forward:(id)sender {
    if (self.webView1.canGoForward) {
        [self.webView1 goForward];
    }
    
    
    
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self.webView1 loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://%@",searchBar.text]]]];
    [self.searchBar resignFirstResponder];
}

@end
