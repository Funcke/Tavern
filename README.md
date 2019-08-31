# Tavern

Tavern is a web-based management tool for catering at events.

## Products & Tables
As an event often provides tables for its guests, orders taken there are categorized by table to ensure a fast and flexible delivery of the desided products.

Products can be of one of two categories: food & beverage.

Depending on the category, the order is sent to a different printer (CATION: Printer access currently not implemented).

## Order
To create an order, the waiter/waitress scand the QR-Code at the table to access the corresponding view in the app. Here all products of this organization are listed and the personell can choose how ,uch of wich kind is to be ordered. After the amount of products is chosen, the order just has to be submitted.

## Pay
When the personell arrives with the ordered goods, they can confirm the payment of one or more goods with a press on the corresponding pay button.

## Requirements
Tavern is written on rails, therefore for an On-Prem installation, a functioning Ruby installation 2.5 or newer is needed. To make the required gems work, it is also recommended to provide a funcitoning build environment. The app itself uses SQLite3 as a database but can easily be configured to work with any other database system, Active Record is compatible with. To ensure the proper functionality, a SSL certificate is necessary, because the Instascan library needs one to access the camera of the device.
