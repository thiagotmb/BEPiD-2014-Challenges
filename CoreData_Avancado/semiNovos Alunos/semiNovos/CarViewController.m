//
//  CarViewController.m
//  semiNovos
//
//  Created by Phelippe Augusto de Amorim on 9/30/14.
//  Copyright (c) 2014 Phelippe Augusto de Amorim. All rights reserved.
//

#import "CarViewController.h"
#import "CarModel.h"
#import "Car.h"

#import "BrandModel.h"
#import "Brand.h"

@interface CarViewController ()
@property (weak, nonatomic) IBOutlet UIPickerView *brandPicker;
@property (weak, nonatomic) IBOutlet UITextField *modelTextField;
@property (weak, nonatomic) IBOutlet UITextField *colorTextField;
@property (weak, nonatomic) IBOutlet UITextField *modelYearTextField;
@property (weak, nonatomic) IBOutlet UITextField *manufactureYearTextField;

@end

@implementation CarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Adcionar Carro";
    
    UIBarButtonItem *saveBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave
                                                                             target:self
                                                                             action:@selector(saveCar:)];
    self.navigationItem.rightBarButtonItem = saveBtn;
    
    if (self.car) {
        NSInteger brandIndex = [[[BrandModel sharedModel] allBrands] indexOfObject:self.car.brand];
        [self.brandPicker selectRow:brandIndex inComponent:0 animated:YES];
        self.modelTextField.text = self.car.model;
        self.colorTextField.text = self.car.color;
        self.modelYearTextField.text = self.car.modelYear;
        self.manufactureYearTextField.text = self.car.manufactureYear;
        
//#error Caso exista o self.car carregar os dados dele nos campos da UIView
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES];
}

- (void)saveCar:(id)sender
{
    if (!self.car) {
        self.car = [[CarModel sharedModel] createCar];
//#error Caso não exista o self.car, crie-o usando o CarModel
    }
    
    NSInteger brandIndex = [self.brandPicker selectedRowInComponent:0];
    Brand *carBrand = [[[BrandModel sharedModel] allBrands] objectAtIndex:brandIndex];
    self.car.brand = carBrand;
    self.car.model = self.modelTextField.text;
    self.car.color = self.colorTextField.text;
    self.car.modelYear = self.modelYearTextField.text;
    self.car.manufactureYear = self.manufactureYearTextField.text;
//#error Carregar o self.car Com os dados dos campos da UIView
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
   return [[BrandModel sharedModel] allBrands].count;
//#error Retornar o número de marcas cadastrados
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    Brand* brandForRow = [[[BrandModel sharedModel] allBrands] objectAtIndex:row];
    return brandForRow.brand;
//#error Retornar o nome da marca selecionada
}

@end
