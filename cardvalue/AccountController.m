//
//  AccountController.m
//  cardvalue
//
//  Created by taoxin on 15/3/22.
//  Copyright (c) 2015年 taoxin. All rights reserved.
//

#import "AccountController.h"
#import "MyUitl.h"
#import "LoginController.h"
#import "WeUserModel.h"

@interface AccountController ()

@end

@implementation AccountController

- (void)viewDidLoad {
    
    //获取当前登录用户姓名
    WeUserModel *user = [MyUitl getUser];
    if(user != nil) {
        NSLog(@"%@",user.username);
        _accountNameLabel.text = user.username;
    }
    
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//#pragma mark - Table view data source
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
//    // Return the number of sections.
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
//    // Return the number of rows in the section.
//    return 0;
//}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark 表格列点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
    
    UILabel *label = (UILabel *) [selectedCell.contentView viewWithTag:2];//获取当前点击的链接
    
    NSLog(@"click section is %ld,row is %ld,text is %@",(long)indexPath.section,(long)indexPath.row,label.text);

    
    //从本地沙盒中获取对象
    if([MyUitl getDatafromTosandbox:@"loginUser"]) {
        //表示已经登录过,跳转到指定页面
    } else {
        //self.navigationController.navigationBar.tintColor =  [UIColor colorWithRed:27 green:160 blue:225 alpha:1.0];//设置按钮颜色
        //self.navigationItem.backBarButtonItem.image = [UIImage imageNamed:@"close.png"];
        [self performSegueWithIdentifier:@"loginSegue" sender:self];
    }   

}

/*
#pragma mark - Navigation
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
