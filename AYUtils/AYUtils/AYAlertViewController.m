//
//  AYAlertViewController.m
//  AYUtils
//
//  Created by dnake_ay on 2019/9/3.
//  Copyright © 2019 dnake_ay. All rights reserved.
//

#import "AYAlertViewController.h"

@implementation AYAlertViewController

+ (void)actionSheetViewController:(UIViewController *)viewController title:(NSString *)title message:(NSString *)message actions:(NSArray *)actions actionSheet:(AYActionCompletionBlock)alert
{
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];
    
    for (int i = 0; i < actions.count; i ++) {
        
        UIAlertAction *action = [UIAlertAction actionWithTitle:actions[i] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            alert(i);
        }];
        
        [alertVC addAction:action];
        
    }
    
    [alertVC addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDestructive handler:nil]];
    
    [viewController presentViewController:alertVC animated:YES completion:nil];
    
}

+ (void)alertViewController:(UIViewController *)viewController title:(NSString *)title message:(NSString *)message cancel:(NSString *)cancel confirm:(NSString *)confirm style:(AYAlertViewControllerStylePassword)style alert:(AYAlertCompletionBlock)alert
{
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    if (style) {
        
        [alertVC addTextFieldWithConfigurationHandler:^(UITextField *textField) {
            textField.placeholder = @"Password";
            textField.secureTextEntry = YES;
        }];
        
    }
    
    // cancel
    if (cancel.length > 0) {
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancel style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            alert(alertVC);
        }];
        
        [cancelAction setValue:[UIColor grayColor] forKey:@"_titleTextColor"];
        
        [alertVC addAction:cancelAction];
    }
    
    // confirm
    if (confirm.length > 0) {
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:confirm style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            alert(alertVC);
        }];
        
        [alertVC addAction:okAction];
    }
    
    [viewController presentViewController:alertVC animated:YES completion:nil];
}

@end
