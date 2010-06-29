class AddTestData < ActiveRecord::Migration
  def self.up
    Product.delete_all
    Food.delete_all
    
    #Products
    Product.create( :product_name => 'Pniata' ,
                    :description => %{Piñatas sind ein riesiger Kinderspaß auf jeder Feier! Ganz klassisch in Form eines bunten Esels kommt diese Piñata daher!},
                    :image_url => '/images/pniata.jpg' ,
                    :price => 5.99,
                    :expirience_points =>50,
                    :continent_id => 3)
                    
    
    Product.create( :product_name => 'Sombrero' ,
                    :description => %{Fiesta, fiesta mexicana... Da darf dieser Sombrero natürlich nicht fehlen. },
                    :image_url => '/images/sombrero.jpg' ,
                    :price => 3.99,
                    :expirience_points =>25,
                    :continent_id => 3)
    
    Product.create( :product_name => 'Vuvuzela' ,
                    :description => %{Die Vuvuzela (Zulu) ist ein Blasinstrument und gilt als ein Symbol des südafrikanischen Fußballs.},
                    :image_url => '/images/vuvuzela.jpg',
                    :price => 2.59,
                    :expirience_points =>20,
                    :continent_id => 4)
                    
    Product.create( :product_name => 'WM Ball 2010' ,
                    :description => %{Offizieller Spielball der FIFA Fußball-WM 2010 in Südafrika},
                    :image_url => '/images/wmball.jpg' ,
                    :price => 70,
                    :expirience_points =>100,
                    :continent_id => 4)
                    
    Product.create( :product_name => 'Bumerang' ,
                    :description => %{Der Bumerang ist eine traditionelle Wurfwaffe, in der Neuzeit zunehmend vor allem ein Sportgerät. Bumerangs können aus Holz, Knochen, Metall oder Kunststoffen gefertigt sein.},
                    :image_url => '/images/bumerang.jpg' ,
                    :price => 3.59,
                    :expirience_points =>15,
                    :continent_id => 7)
                    
    #Foods
    Food.create( :food_name => 'Wasser',
                     :description => %{Kühles frisches Alpenquellwasser},
                    :image_url => '/images/wasser.png' ,
                    :price => 0.99,
                    :expirience_points =>5,
                    :foodkind_id => 1,
                    :continent_id =>6)
    
   Food.create( :food_name => 'Coca Cola',
                    :description => %{Eine eisgekülte Coke},
                    :image_url => '/images/cola.jpg' ,
                    :price => 1.99,
                    :expirience_points =>15,
                    :foodkind_id => 1,
                    :continent_id =>2)
                    
   Food.create( :food_name => 'Paulaner Weißbier',
                    :description => %{Ein echtes Paulner Weißbier},
                    :image_url => '/images/paulaner-weissbier.jpg' ,
                    :price => 2.99,
                    :expirience_points =>15,
                    :foodkind_id => 1,
                    :continent_id =>6)
    
   Food.create( :food_name => 'Sake',
                    :description => %{Sake ein Synonym für Reiswein, ein klares oder weißlich-trübes alkoholisches Getränk aus Japan},
                    :image_url => '/images/sake.jpg' ,
                    :price => 5.99,
                    :expirience_points =>30,
                    :foodkind_id => 1,
                    :continent_id =>5)
    
    Food.create( :food_name => 'Baguette' ,
                    :description => %{Echte Fanzösiche Baguette.},
                    :image_url => '/images/baguette.jpg',
                    :price => 2.59,
                    :expirience_points =>20,
                    :foodkind_id =>5,
                    :continent_id =>6)
                    
    Food.create( :food_name => 'Burger' ,
                    :description => %{Ein richtiger amerikanischer Burger.},
                    :image_url => '/images/Burger.png' ,
                    :price => 1.15,
                    :expirience_points =>5,
                    :foodkind_id => 3,
                    :continent_id => 2)
                    
    Food.create( :food_name => 'Garten Salat' ,
                    :description => %{Ein toller Salat schmekt fas so gut wies aus dem eignen Garten.},
                    :image_url => '/images/salat.png' ,
                    :price => 1.59,
                    :expirience_points =>0,
                    :foodkind_id => 4,
                    :continent_id =>6)
                    
    Food.create( :food_name => 'Mlichschake' ,
                    :description => %{Lieber geschüttelt als gerührt? Auf jeden Fall lecker: unsere Milchshakes mit den begehrenswerten Geschmäckern Vanilla, Strawberry oder Chocolate.},
                    :image_url => '/images/milchschake.png' ,
                    :price => 1.59,
                    :expirience_points =>10,
                    :foodkind_id => 6)
    
    Food.create( :food_name => 'Donut' ,
                    :description => %{Ob als Abschluss eines leckeren Frühstücks oder als süßer Höhepunkt: Die Entscheidung ist nicht, ob man einen Donut* essen soll, sondern nur welchen. },
                    :image_url => '/images/donuts.png' ,
                    :price => 0.95,
                    :expirience_points =>5,
                    :foodkind_id => 6,
                    :continent_id =>2)
                    
    Food.create( :food_name => 'Nachos' ,
                    :description => %{Eine leckere portion Mexikanischer},
                    :image_url => '/images/nachos.jpg' ,
                    :price => 1.59,
                    :expirience_points =>15,
                    :foodkind_id => 5,
                    :continent_id => 2)
    
    Food.create( :food_name => 'Burito' ,
                    :description => %{Ein Burrito ist ein Gericht aus der texanisch-mexikanischen Küche. Er besteht aus einer weichen Tortilla, in die unter anderem Hackfleisch, Bohnen, Reis, Tomaten, Avocado oder Käse eingewickelt werden.},
                    :image_url => '/images/Burito.png',
                    :price => 2.59,
                    :expirience_points =>25,
                    :foodkind_id => 3,
                    :continent_id => 3)
                    
    Food.create( :food_name => 'Sushi' ,
                    :description => %{Sushi nach original japanischem Rezept},
                    :image_url => '/images/sushi.jpg',
                    :price => 5.59,
                    :expirience_points =>25,
                    :foodkind_id => 3,
                    :continent_id => 5)
  end
  
  def self.down
    Product.delete_all
    Food.delete_all
  end
end

