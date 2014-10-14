//
//  ClientCarViewController.m
//  semiNovos
//
//  Created by Phelippe Augusto de Amorim on 10/2/14.
//  Copyright (c) 2014 Phelippe Augusto de Amorim. All rights reserved.
//

#import "ClientCarViewController.h"
#import "CarModel.h"
#import "Car.h"

@interface ClientCarViewController ()
@property (weak, nonatomic) IBOutlet UITableView *acquiredTableView;
@property (weak, nonatomic) IBOutlet UITableView *availableTableView;

@property NSMutableArray *avaliable;

@end

@implementation ClientCarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"Adquiridos";
    
    _avaliable = [NSMutableArray arrayWithArray:[CarModel sharedModel].allCars];
    
    if (!_acquired) {
        _acquired = [[NSMutableArray alloc] init];
    }
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if ([tableView isEqual:self.acquiredTableView]) {
        return self.acquired.count;
    }else
        if ([tableView isEqual:self.availableTableView]) {
            return self.avaliable.count;
        }else{
            
            return 0;
        }
//#error Retornar o número de carros do cliente caso a tableView seja a do cliente
//#error Retornar o número de carros disponíveis caso a tableView seja a de carros disponíveis
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *tableViewCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    
    if ([tableView isEqual:self.acquiredTableView]) {
        
        
        Car *currentCar =  [self.acquired objectAtIndex:indexPath.row];
        tableViewCell.textLabel.text = currentCar.model;
        
        tableViewCell.detailTextLabel.text = currentCar.modelYear;
        
    }else
        if ([tableView isEqual:self.availableTableView]) {
            
            
            Car *currentCar =  [_avaliable objectAtIndex:indexPath.row];
            tableViewCell.textLabel.text = currentCar.model;
            tableViewCell.detailTextLabel.text = currentCar.modelYear;
            
            
        }else{
          //Nothing to do
          
        }
    
    return tableViewCell;
//#error Caso a tabelView seja a do cliente, retorne uma UITableViewCell preenchida com os dados do carro do cliente.
//#error Caso a tabelView seja a de carros disponíveis, retorne uma UITableViewCell preenchida com os dados do carro disponível.
}

- (IBAction)addButtonClick:(id)sender {
    NSIndexPath *selectedIndexPath = [self.availableTableView indexPathForSelectedRow];
    
    if (selectedIndexPath) {
        Car *c = [_avaliable objectAtIndex:selectedIndexPath.row];
        
        [_avaliable removeObject:c];
        [_acquired addObject:c];
        
        [self.availableTableView deleteRowsAtIndexPaths:@[selectedIndexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        NSIndexPath *addIndexPath = [NSIndexPath indexPathForItem:self.acquired.count - 1 inSection:0];
        [self.acquiredTableView insertRowsAtIndexPaths:@[addIndexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (IBAction)removeButtonClick:(id)sender {
    NSIndexPath *selectedIndexPath = [self.acquiredTableView indexPathForSelectedRow];
    
    NSLog(@"Adq: %@",self.acquired);
    
    if (selectedIndexPath) {
        NSLog(@"Index: %ld", (long)selectedIndexPath.row);
        Car *c = [self.acquired objectAtIndex:selectedIndexPath.row];
        NSLog(@"Car: %@", [c description]);
        
        [_acquired removeObject:c];
        [_avaliable addObject:c];
        
        Car *availableCar = [[CarModel sharedModel] createCar];
        availableCar.color = c.color;
        availableCar.brand = c.brand;
        availableCar.model = c.model;
        availableCar.modelYear = c.modelYear;
        availableCar.manufactureYear = c.manufactureYear;
        availableCar.owner = c.owner;
        
        
        [self.acquiredTableView deleteRowsAtIndexPaths:@[selectedIndexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        NSIndexPath *addIndexPath = [NSIndexPath indexPathForItem:self.avaliable.count - 1 inSection:0];
        [self.availableTableView insertRowsAtIndexPaths:@[addIndexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

-(void)viewDidDisappear:(BOOL)animated{

    
    
}

@end
