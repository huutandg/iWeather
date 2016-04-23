//
//  ViewController.m
//  iWeather
//
//  Created by Tan on 4/22/16.
//  Copyright © 2016 Tan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *location;
@property (weak, nonatomic) IBOutlet UIButton *temperature;
@property (weak, nonatomic) IBOutlet UIImageView *weatherCondition;
@property (weak, nonatomic) IBOutlet UILabel *quote;
@property (weak, nonatomic) IBOutlet UILabel *degreeType;

@end

@implementation ViewController

{
    NSArray* quotes;
    NSArray* locations;
    NSArray* photoFiles;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    quotes = @[@"Một con ngựa đau cả tàu bỏ cỏ", @"Có công mài sắt có ngày nên kim", @"Chớ thấy sóng cả mà ngã tay chèo", @"Không có gì quý hơn độc lập tự do hạnh phúc", @"Đi một ngày đàng học một sàng không"];
    
    locations = @[@"Hai Ba Trung, Hanoi", @"Sydney, Australia", @"New York, USA"];
    
    photoFiles = @[@"rain", @"sunny", @"thunder", @"windy"];
    
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)convertDegree:(id)sender {
    if([self.degreeType.text  isEqual: @"C"])
    {
    float degree = [self.temperature.currentTitle floatValue];
    NSLog(@"%f", degree);
    degree = (degree * 1.8) + 32; // Đổi độ C > F
    NSString* string = [NSString stringWithFormat:@"%2.1f", degree];
    [self.temperature setTitle:string forState:(UIControlStateNormal)];
        self.degreeType.text = @"F";
    }
    
}
- (IBAction)updateWeather:(id)sender {
    int quoteIndex = arc4random_uniform(quotes.count);
    NSLog(@"%d", quoteIndex);
    self.quote.text = quotes[quoteIndex];
    
    int locationIndex = arc4random_uniform(locations.count);
    self.location.text = locations[locationIndex];
    
    int photoIndex = arc4random_uniform(photoFiles.count);
    self.weatherCondition.image = [UIImage imageNamed:photoFiles[photoIndex]];
    NSString* string = [NSString stringWithFormat:@"%2.1f", [self getTemperature]];
    [self.temperature setTitle:string forState:(UIControlStateNormal)];
    self.degreeType.text = @"C";
}

//Có dấu trừ trước khai báo là instant method
//Có dấu + trước khai báo là class method
//(float) casting: chuyển, ép sang kiểu float
- (float) getTemperature {
    return 14.0 + arc4random_uniform(18) + (float)arc4random() /(float) INT32_MAX;
}


@end
