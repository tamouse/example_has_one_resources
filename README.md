# README

This is a toy app to explore and understand how the Rails singular resource works.

There are two models in this app:
- `Company`
- `Logo`

A company has one logo. See each model to understand the relations.

The magic, so to speak, is happening in the `config/routes.rb` file.

The singular resource for `:logos` is placed inside the `resources` block for `:companies`. It will generate the following set of routes:

``` 
            Prefix Verb   URI Pattern                                   Controller#Action
 new_company_logos GET    /companies/:company_id/logos/new(.:format)    logos#new
edit_company_logos GET    /companies/:company_id/logos/edit(.:format)   logos#edit
     company_logos GET    /companies/:company_id/logos(.:format)        logos#show
                   PATCH  /companies/:company_id/logos(.:format)        logos#update
                   PUT    /companies/:company_id/logos(.:format)        logos#update
                   DELETE /companies/:company_id/logos(.:format)        logos#destroy
                   POST   /companies/:company_id/logos(.:format)        logos#create
         companies GET    /companies(.:format)                          companies#index
                   POST   /companies(.:format)                          companies#create
       new_company GET    /companies/new(.:format)                      companies#new
      edit_company GET    /companies/:id/edit(.:format)                 companies#edit
           company GET    /companies/:id(.:format)                      companies#show
                   PATCH  /companies/:id(.:format)                      companies#update
                   PUT    /companies/:id(.:format)                      companies#update
                   DELETE /companies/:id(.:format)                      companies#destroy

```

For the singular resouce for logo, it does not need to specify the `:id` since there can be only one.

## Difference in controllers ##

The generated scaffolding for the logos controller used the expected multiple resources method of obtaining the logo from the path. With the singular resource, the only identifying info we have is the `:company_id`. I added the before action callback `:set_company` to find the company based on the path identifier. Then the `:set_logo` callback uses the company's `logo_id` attribute to find the logo. In both cases, if the company or the logo is not found, a 404 Not Found error should be returned.

## Conclusions ##

So this is pretty cool; it's been in Rails for a long time, but I'd never really seen it used or spent time with it.

This repo is archived, as there's nothing more I want to learn from it.
