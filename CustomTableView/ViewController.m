//
//  ViewController.m
//  CustomTableView
//
//  Created by Apple on 02/08/18.
//  Copyright © 2018 Apple. All rights reserved.
//

#import "ViewController.h"
#import "TableCellClass.h"
#import "BackgroundView.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,BackgroundViewDelegate>{
    NSArray *arrData;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self checkDataCount];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return arrData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *strIdentifier = @"TableCellClass";
    TableCellClass *cell = [tableView dequeueReusableCellWithIdentifier:strIdentifier];
    if (cell == nil) {
        cell = [[TableCellClass alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:strIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.lblDummyMessage.text = [arrData objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    arrData = nil;
    [self checkDataCount];
}

- (void)checkDataCount{
    if (arrData.count == 0) {
        BackgroundView *errorView = [BackgroundView initlization];
        /*
        errorView.buttonTextColor = [UIColor redColor];
        errorView.buttonBgColor = [UIColor greenColor];
        errorView.errorMessageColor = [UIColor orangeColor];
        errorView.fontSize = 16.0;
        errorView.fontName = @"HelveticaNeue";
         */
        [errorView initWithDefaultNibAndDelegate:self message:@"Please check your internet connection." btnOK:@"Retry" errorEmojiImage:@"error-icon.png" vc:self];
    }else{
        [self.tblView reloadData];
    }
}

#pragma mark Background View Delegate Method Call...
- (void)errorMessageDelegate :(NSString *)btnTitle{
    if ([btnTitle isEqualToString:@"Retry"]) {
        arrData = [NSArray arrayWithObjects:@"Apple",@"Google",@"Amazon",@"FlipKart",@"IBM",@"Microsoft",@"Facebook",@"Yahoo",@"LinkedIn",@"Samsung",@"Nokia", nil];
        [self.tblView reloadData];
    }
}

@end
