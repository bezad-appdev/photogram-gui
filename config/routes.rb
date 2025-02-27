Rails.application.routes.draw do
get("/users", {:controller => "users", :action => "index" })
get("/users/:path_username", {:controller => "users", :action => "show" })
get("/photos", {:controller => "photos", :action => "index" })
get("/photos/:path_id", {:controller => "photos", :action => "show" })
get("/delete_photo/:path_id", {:controller => "photos", :action => "baii" })
get("/", {:controller => "users", :action => "index" })
get("/insert_photo", {:controller => "photos", :action => "create" })
get("/update_photo/:modify_id", {:controller => "photos", :action => "update" })
get("/insert_user_record", {:controller => "users", :action => "add_user" })
get("/update_user/:update_id", {:controller => "users", :action => "modify" })
get("/insert_comment_record", {:controller => "photos", :action => "add_comment" })


end
