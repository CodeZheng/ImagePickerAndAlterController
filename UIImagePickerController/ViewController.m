//
//  ViewController.m
//  UIImagePickerController
//
//  Created by admin on 3/8/16.
//  Copyright © 2016 zhengxinxin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *imageV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.imageV.backgroundColor = [UIColor redColor];
}
- (IBAction)selectPictureBtnAction:(id)sender {
   
    UIAlertController *altC = [UIAlertController alertControllerWithTitle:@"请选择图片来源" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
    [altC addAction:[UIAlertAction actionWithTitle:@"照相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self selectPictureType:UIImagePickerControllerSourceTypeCamera];
    }]];
    [altC addAction:[UIAlertAction actionWithTitle:@"图片库" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self selectPictureType:UIImagePickerControllerSourceTypePhotoLibrary];
    }]];
    [altC addAction:[UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self selectPictureType:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
    }]];
    [altC addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"取消");
    }]];
    [self presentViewController:altC animated:YES completion:nil];
}


- (void)selectPictureType:(UIImagePickerControllerSourceType)type{
    if ([UIImagePickerController isSourceTypeAvailable:type]) {
        UIImagePickerController *picker = [[UIImagePickerController alloc]init];
        [picker setSourceType:type];
        picker.allowsEditing = YES;
        picker.delegate = self;
        [self.navigationController presentViewController:picker animated:YES completion:nil];
    }else{
        NSLog(@"照片源不可用！");
    }
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
    self.imageV.image =  info[@"UIImagePickerControllerEditedImage"];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
