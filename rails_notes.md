# RAILS TIPS

## URL helper

_routes.rb_  
```get "/article/:id", to: "aeticles#show", as: :article```
_html.erb_  
``` <%= link_to "Show", article_path(article.id) %> ```