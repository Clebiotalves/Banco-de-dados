-- criação do banco de dados para o cenário de E-commerce
create database ecommerce;
use ecommerce;
-- drop database ecommerce;

create table client (
	idClient int auto_increment,
    fname varchar(20) not null,
    minit char(3) not null,
    lname varchar (20) not null,
    cpf char(11) not null,
    data_nascimento date not null,
    constraint pk_client primary key (idClient), 
    constraint unique_cpf_client unique (cpf)
 );
 
 -- criando tabela Endereço
create table address(
	idAdrress int auto_increment,
	idClient int,
    typeAddress varchar (30)not null,
    zipCode char(9) not null,
    street varchar (30) not null,
    country varchar (30),
    constraint pk_address primary key (idAdrress),
    constraint fk_address_client foreign key (idClient) references client (idClient)
 ); 

-- criar tabela produto

-- size = dimensão do produto
-- drop  table product;
create table product (
		idProduct int auto_increment,
        Pname varchar(15) not null,
        Classification_Kids bool default false,
        category enum ('Eletrônico','Vestimenta','Brinquedos','Alimento','Móveis') not null,
        avaliação float default 0,
        size varchar(10),
        constraint pk_idProduct primary key (idProduct)
);
-- criar tabela pedido
create table orders(
	idOrder int auto_increment,
    idOrderClient int,
    order_status enum('Cancelado', 'Confirmado', 'Em processamento') default 'Em processamento',
    order_description varchar(45),
    send_value float default 10,
    paymentCash bool default false,
    idPayment int,
    constraint pk_idorder primary key (idOrder),
    constraint fk_orders_client foreign key (idOrderClient) references client (idClient)
);

-- para ser continuando no desafio :termine de implementar a tabela e crie a conexão com as tabelas necessárias

-- além disso, reflita essa modificação no diagrama de esquema relacional

-- criando pagamento
create table payments(
	idClient int,
    idPayment int auto_increment,
    typePayment enum('boleto','Cartão','Dois cartão' , 'Pix'),
    totalPrice decimal(7,2) not null,
    paymentStatus enum('Autorizado','Não Autorizado','Processando','Estornado')default 'Processando',
    limitAvalilable float,
    primary key(idClient, idPayment),
    constraint fk_pay_order foreign key(idPayment) references orders(idOrder),
	constraint fk_pay_product foreign key(idClient) references product(idProduct)
);
-- criando tabela cartão de credito

create table CreditCard(
idCredicard int auto_increment primary key,
idPayment int,
credCardFlag varchar(20) not null,
cardNumber char(16) not null,
expirationDate date not null,
cardHolderName varchar(45) not null,
securityCode char(3) not null,
constraint fk_creditCard_payment foreign key (idPayment) references payments (idPayment)
);
-- criando tabela pix
 
create table Cash(
idCash int auto_increment primary key,
idPayCash int,
typePix enum('CPF','E-mail','Telefone','Chave Aleatória') not null,
Pix varchar(45),
constraint fk_pay_cash foreign key(idPayCash) references Payments(idPayment)
);

-- criando tabela Boleto 

create table ticket(
idTicket int auto_increment primary key,
idPayTicket int,
bankName varchar(30) not null,
barCode char(50) not null,
dueDate date not null,
constraint fk_pay_ticket foreign key(idPayTicket) references payments(idPayment)
);

-- criar tabela estoque
create table productStorage(
    idProductStorage int auto_increment primary key,
    storageLocation varchar(255),
    quantity int default 0
);

-- criar tabela fornecedor
create table supplier(
    idSupplier int auto_increment primary key,
    SocialName varchar (255) not null,
    CNPJ char(15) not null,
    contact char(11) not null,
    constraint unique_supplier unique (CNPJ)
);

-- criar tabela vendedor
create table seller(
    idSeller int auto_increment primary key,
    SocialName varchar(255) not null,
    AbstName varchar(255),
    CNPJ char(15),
    CPF char(9),
    location varchar(255),
    contact char(11) not null,
    constraint unique_cnpj_seller unique (CNPJ),
    constraint unique_cpf_seller unique (CPF)
);

-- criar tabela relacionamento Produto e Vendedor
create table productSeller(
    idSeller int,
    idProduct int,
    prodQuantity int default 1,
    constraint pk_idSeller_idProduct primary key(idSeller, idProduct),
    constraint fk_product_seller foreign key (idSeller) references seller(idSeller),
    constraint fk_product_product foreign key (idProduct) references product (idProduct)
);

-- criar tabela relacionamento Produto e Pedido
create table productOrder(
	idPOrder int,
    idPOproduct int,
    poQuantity int default 1,
    poStatus enum ('Disponível', 'Sem estoque') default 'Disponível',
	constraint pk_idPOrder_idPOproduct primary key (idPOrder, idPOproduct),
    constraint fk_idPOorder foreign key (idPOrder) references orders (idOrder),
    constraint fk_idPOproduct foreign key (idPOproduct) references product (idProduct)
);

-- criar tabela relacionamento Estoque e Produto
create table storageLocation(
    idLProduct int,
    idLStorage int,
    location varchar(255) not null,
    constraint pk_idLproduct_idLstorage primary key(idLProduct, idLStorage),
    constraint fk_storag_product foreign key (idLproduct) references product(idProduct),
    constraint fk_storage_storage foreign key (idLStorage) references productStorage(idProductStorage)
);

-- criar tabela relacionamento Fornecedor e Produto
create table productSupplier(
    idPsSupplier int,
    idPsProduct int,
    quantity int not null,
    primary key(idPsSupplier, idPsProduct),
    constraint fk_product_supplier_suplier foreign key (idPsSupplier) references supplier(idSupplier),
    constraint fk_product_supplier_product foreign key (idPsProduct) references product(idProduct)
);



