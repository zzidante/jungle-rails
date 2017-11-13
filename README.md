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

!["Home Page!"]()

!["Item Details!"]()

!["Reviews!"]()

!["Cart Screen!"]()

!["Order Screen!"]()

!["Email Message!"]()
