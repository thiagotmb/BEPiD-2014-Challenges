//
//  BrandViewController.m
//  semiNovos
//
//  Created by Phelippe Augusto de Amorim on 9/29/14.
//  Copyright (c) 2014 Phelippe Augusto de Amorim. All rights reserved.
//

#import "BrandViewController.h"
#import "BrandModel.h"
#import "Brand.h"


@interface BrandViewController ()

@property (weak, nonatomic) IBOutlet UITextField *descricaoField;

@end

@implementation BrandViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Adcionar Marca";
    
    UIBarButtonItem *saveBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave
                                                                           target:self
                                                                           action:@selector(saveBrand:)];
    self.navigationItem.rightBarButtonItem = saveBtn;
    
    if (self.brand) {
        self.descricaoField.text = self.brand.brand;
//#error Caso exista o self.brand carregar os dados dele nos campos da UIView
    }
}

- (void)saveBrand:(id)sender
{
    if (!self.brand) {
       self.brand = [[BrandModel sharedModel] createBrand];
//#error Caso não exista o self.brand crie-o usando o BrandModel
    }
    
    self.brand.brand = self.descricaoField.text;
//#error Carregar o self.brand Com os dados dos campos da UIView

    [self.navigationController popViewControllerAnimated:YES];
}

@end
