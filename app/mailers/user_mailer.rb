class UserMailer < ApplicationMailer
  default from: 'no-reply@real-eventbrute.herokuapp.com'

  def welcome_email(user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user 

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://real-eventbrute.herokuapp.com/login' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Bienvenue chez nous !') 
  end

  def new_inscription(attendance)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @attendance = attendance 

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://real-eventbrute.herokuapp.com/login' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @attendance.event.admin.email, subject: 'Nouvel inscription !') 
  end

  def event_update(event)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @event = event

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://real-eventbrute.herokuapp.com/login' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @event.admin.email, subject: 'Validation de votre événement !') 
  end

end
