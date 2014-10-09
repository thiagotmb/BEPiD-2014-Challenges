//
//  CarTableViewController.m
//  semiNovos
//
//  Created by Phelippe Augusto de Amorim on 9/29/14.
//  Copyright (c) 2014 Phelippe Augusto de Amorim. All rights reserved.
//

#import "CarTableViewController.h"
#import "CarViewController.h"
#import "CarModel.h"
#import "Car.h"

@interface CarTableViewController ()

@end

@implementation CarTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.tabBarController.navigationItem.title = @"Carros";
    
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   
    
    return [[CarModel sharedModel] allCars].count;

    //#error Retornar o número de carros não vendidos cadastrados
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *tableViewCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    
    Car *currentCar =  [[[CarModel sharedModel] allCars] objectAtIndex:indexPath.row];
    tableViewCell.textLabel.text = currentCar.model;
    tableViewCell.detailTextLabel.text = currentCar.modelYear;
    
    return tableViewCell;
    //#error Retornar uma UITableViewCell preenchida com os dados do carro.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CarViewController *carViewController = [[CarViewController alloc] init];
    
    carViewController.car = [[[CarModel sharedModel] allCars] objectAtIndex:indexPath.row];
    
    [self.navigationController pushViewController:carViewController animated:YES];

//#error Push na classe CarViewController na navigationController com o carro selecionado.
}

- (void)createItem
{
    CarViewController *cvc = [[CarViewController alloc] init];
    
    [self.navigationController pushViewController:cvc animated:YES];
}

@end
