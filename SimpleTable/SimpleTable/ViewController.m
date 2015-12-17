//
//  ViewController.m
//  SimpleTable
//
//  Created by Phuong on 12/17/15.
//  Copyright © 2015 Appcoda. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation ViewController
{
    NSArray *arrayName;
    NSArray *arrayImage;
    NSArray *arrayPrice;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    arrayName = [NSArray arrayWithObjects:@"Iphone",@"Samsung", @"Oppo", @"HTC", nil];
    arrayPrice = [NSArray arrayWithObjects:@"$299",@"$350",@"$350",@"$499",@"$899",nil];
    arrayImage = [NSArray arrayWithObjects:@"dog.png",@"cat.png",@"mouse.png",@"ball.png", nil];
    // Do any additional setup after loading the view, typically from a nib.
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [arrayImage count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *tableCellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableCellIdentifier];
    if (cell ==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:tableCellIdentifier];
    }
    UIImageView *image  = (UIImageView *)[cell.contentView viewWithTag:100];
    image.image = [UIImage imageNamed:[arrayImage objectAtIndex:indexPath.row]];
    
    UILabel *name = (UILabel *)[cell.contentView viewWithTag:101];
    name.text = [arrayName objectAtIndex:indexPath.row];
    
    UILabel *price = (UILabel *)[cell.contentView viewWithTag:102];
    price.text = [arrayPrice objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:[arrayName objectAtIndex:indexPath.row] message:[arrayPrice objectAtIndex:indexPath.row] preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction
                                   actionWithTitle:NSLocalizedString(@"Cancel", @"Cancel action")
                                   style:UIAlertActionStyleCancel
                                   handler:^(UIAlertAction *action)
                                   {
                                       NSLog(@"Cancel action");
                                   }];
    
    UIAlertAction *okAction = [UIAlertAction
                               actionWithTitle:NSLocalizedString(@"OK", @"OK action")
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction *action)
                               {
                                   NSLog(@"OK action");
                               }];
    
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
