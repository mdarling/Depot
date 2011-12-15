#---
# Excerpted from "Agile Web Development with Rails",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails4 for more book information.
#---
#---
# Excerpted from "Agile Web Development with Rails, 4rd Ed.",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails4 for more book information.
#---
# encoding: utf-8
Product.delete_all

# . . .
Product.create(:title => 'iSight',
               :description =>
               %{<p>
               <em>iSight</em> is an app to assist people with sight impairments.
               </p>},
               :image_url => '/images/eyes.png',
               :price => 49.50)
# . . .

Product.create(:title => 'Can you ear me?',
               :description => 
               %{<p>
               <em>Can you ear me?</em> is an app to assist people with hearing impairments.
               </p>},
               :image_url => '/images/ears.png',
               :price => 43.75)
# . . . 
Product.create(:title => 'Speak-Easy speech aid app',
               :description => 
               %{<p>
               <em>Speak-Easy</em> This app is designed   as a user-friendly interface to allow individuals with speech impairments to input text sentences which will be output as audio through the speakers of an Android device. 
               Functionality: Display and speak inputted sentences,
               Adapt to English or Spanish,
               Include an interface that will allow the user to browse word icons,
               Enable the customer to customize vocabulary,and
               Change voices (male or female),
               </p>},
               :image_url =>   '/images/speakeasy.png',    
               :price => 42.95)
