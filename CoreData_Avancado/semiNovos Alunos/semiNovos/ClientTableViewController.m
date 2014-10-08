//
//  ClientTableViewController.m
//  semiNovos
//
//  Created by Phelippe Augusto de Amorim on 9/30/14.
//  Copyright (c) 2014 Phelippe Augusto de Amorim. All rights reserved.
//

#import "ClientTableViewController.h"
#import "ClientViewController.h"
#import "ClientModel.h"
#import "Client.h"

//#error Importar o Cliente.h

@interface ClientTableViewController ()

@end

@implementation ClientTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.tabBarController.navigationItem.title = @"Clientes";
    
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [[ClientModel sharedModel] allClients].count;
//#error Retornar o número de clientes cadastrados
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    
    UITableViewCell *tableViewCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    
    Client *currentClient =  [[[ClientModel sharedModel] allClients] objectAtIndex:indexPath.row];
    tableViewCell.textLabel.text = currentClient.name;
    
    tableViewCell.detailTextLabel.text = [NSString stringWithFormat:@"%@",currentClient.birthDate];
    
    return tableViewCell;

    //#error Retornar uma UITableViewCell preenchida com os dados do cliente.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    ClientViewController *clientViewController = [[ClientViewController alloc] init];
    
    clientViewController.client = [[[ClientModel sharedModel] allClients] objectAtIndex:indexPath.row];
    
    [self.navigationController pushViewController:clientViewController animated:YES];

    //#error Push na classe ClientViewController na navigationController com o cliente selecionado.
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

- (void)createItem
{
    ClientViewController *cvc = [[ClientViewController alloc] init];
    
    [self.navigationController pushViewController:cvc animated:YES];
}

@end
