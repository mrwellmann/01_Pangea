class AddTestData < ActiveRecord::Migration
  def self.up
    Product.delete_all
    
    Product.create( :title => 'WHOPPER®' ,
                    :description => %{<p>Der WHOPPER® bleibt unsere ungeschlagene Nummer eins. Flame-grilled Beef, frische Tomaten, knackiger Salat, cremige Salatmayonnaise, Ketchup, würzige Gurken und Zwiebeln zwischen zwei Sesambrötchenhälften, das ist sein Geheimnis ... Korrektur, das war sein Geheimnis. Bis eben (schon okay, du kannst es ruhig weiter erzählen).</p>},
                    :image_url => '/images/Burger.png' ,
                    :price => 1.99,
                    :expirience_points =>10)
                    
    
    Product.create( :title => 'WHOPPER® Jr.' ,
                    :description => %{<p>Manchmal ist weniger eben mehr. Der WHOPPER® Jr. ist die kleine Ausgabe des original WHOPPER® - steht seinem großen Bruder aber in nichts nach. Bestes Beef auf einem Sesambrötchen, umschmeichelt von saftigen Tomaten, knackigem Salat, cremiger Salatmayonnaise, Ketchup, Gurken und frischen Zwiebeln - gut gemacht, Junior!.</p>},
                    :image_url => '/images/Burger.png' ,
                    :price => 1.59,
                    :expirience_points =>0)
    
    Product.create( :title => 'Double WHOPPER®' ,
                    :description => %{<p>Viele Leute denken, der WHOPPER® ist das Maß der Dinge - und sie haben Recht! So gesehen ist der Double WHOPPER® der Aufbruch in eine neue Dimension: 222g* flame-grilled Beef, frische Tomaten, knackiger Salat, cremige Salatmayonnaise, Ketchup, Gurken und Zwiebeln - das ist der Anfang von etwas Großem. <br/>* vor dem Grillen</p>},
                    :image_url => '/images/Burger.png',
                    :price => 2.59,
                    :expirience_points =>20)
                    
    Product.create( :title => '02_WHOPPER®' ,
                    :description => %{<p>Der WHOPPER® bleibt unsere ungeschlagene Nummer eins. Flame-grilled Beef, frische Tomaten, knackiger Salat, cremige Salatmayonnaise, Ketchup, würzige Gurken und Zwiebeln zwischen zwei Sesambrötchenhälften, das ist sein Geheimnis ... Korrektur, das war sein Geheimnis. Bis eben (schon okay, du kannst es ruhig weiter erzählen).</p>},
                    :image_url => '/images/Burger.png' ,
                    :price => 1.99,
                    :expirience_points =>10)
                    
    Product.create( :title => '02_WHOPPER® Jr.' ,
                    :description => %{<p>Manchmal ist weniger eben mehr. Der WHOPPER® Jr. ist die kleine Ausgabe des original WHOPPER® - steht seinem großen Bruder aber in nichts nach. Bestes Beef auf einem Sesambrötchen, umschmeichelt von saftigen Tomaten, knackigem Salat, cremiger Salatmayonnaise, Ketchup, Gurken und frischen Zwiebeln - gut gemacht, Junior!.</p>},
                    :image_url => '/images/Burger.png' ,
                    :price => 1.59,
                    :expirience_points =>0)
    
    Product.create( :title => '02_Double WHOPPER®' ,
                    :description => %{<p>Viele Leute denken, der WHOPPER® ist das Maß der Dinge - und sie haben Recht! So gesehen ist der Double WHOPPER® der Aufbruch in eine neue Dimension: 222g* flame-grilled Beef, frische Tomaten, knackiger Salat, cremige Salatmayonnaise, Ketchup, Gurken und Zwiebeln - das ist der Anfang von etwas Großem. <br/>* vor dem Grillen</p>},
                    :image_url => '/images/Burger.png',
                    :price => 2.59,
                    :expirience_points =>20)
  end
  
  def self.down
    Product.delete_all
  end
end

