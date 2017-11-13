# Jungle

A mini e-commerce application built with Rails 4.2 utilizing bcrypt to hash passwords for logged in users. 

## Use

Users can simulate an order via Stripe portal. Users receive confirmation email of their order details once processed.

Users can register/login in order to create Reviews. Users can delete their own reviews.  

Admins can add products and categories. 


## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create `.env` by copying `.env.example`.
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate `.env` vars
9. Put Gmail and password keys in copied `.env` file in order to send confirmation emails. 
10. Add a custom Admin username and password in copied `.env` file. 
11. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios. Expiry date must be beyond current date. 

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
* Bcrypt

## Home Page
!["Home Page!"](https://github.com/zzidante/jungle-rails/blob/master/Jungle%20App%20Screenshots/1.%20Home%20Page.png?raw=true)

## Item Details
!["Item Details!"](https://github.com/zzidante/jungle-rails/blob/master/Jungle%20App%20Screenshots/2.%20Item%20details.png?raw=true)

## Reviews
!["Reviews!"](https://github.com/zzidante/jungle-rails/blob/master/Jungle%20App%20Screenshots/3.%20Reviews.png?raw=true)

## Cart Screen
!["Cart Screen!"](https://github.com/zzidante/jungle-rails/blob/master/Jungle%20App%20Screenshots/4.%20Cart%20Screen.png?raw=true)

## Order Screen
!["Order Screen!"](https://github.com/zzidante/jungle-rails/blob/master/Jungle%20App%20Screenshots/5.%20Order%20Screen.png?raw=true)

## Email Message ('live' client)
!["Email Message!"](https://github.com/zzidante/jungle-rails/blob/master/Jungle%20App%20Screenshots/6.%20Email%20Message.png?raw=true)
