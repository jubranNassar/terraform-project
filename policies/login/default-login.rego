package spacelift
# allow { 
#   input.session.login == "jubran.nassar13@gmail.com"
#  }
login := input.session.login
 admins := { "jubran.nassar13@gmail.com", "juby.nassar123@gmail.com"}

 allow {
  admins[login]
 }
space_read[space.id] {
  space := input.spaces[_]
  admins[login]
  }

  
sample { true }
