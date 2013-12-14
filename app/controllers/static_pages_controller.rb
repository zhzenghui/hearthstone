class StaticPagesController < ApplicationController
  def home
    
  end
  
  def show
    @heros = Hero.all
    @hero_types = HeroType.all
    @card_types = CardType.all
  end
  
  
  def getPage
    url = "http://db.duowan.com/lushi/card/list/eyJwIjoiMSIsInNvcnQiOiJpZC5kZXNjIn0_3_.html"
    page = Nokogiri::HTML(open(url))
    
    return page
  end 
  

  
  def get_card_info

    
    news_links = getPage.css(".mod-bd.clearfix div")

    heroes = news_links[0].css("a")
    heroes.each{|l| Hero.create(:name=>l.text, :link=>l["href"])}

    hero_type  = news_links[1].css("a")
    hero_type.each{|l| HeroType.create(:name=>l.text, :link=>l["href"])}

    card_type  = news_links[2].css("a")
    card_type.each{|l| CardType.create(:name=>l.text, :link=>l["href"])}
    render text: "OK"
  end
  
  def getAllPage

    news_links = getPage.css(".mod-page.center a")
    news_links.each{|l| CardPage.create(:name=>l.text, :link=>l["href"])}
    
    render text: "OK"
  end
  
  
  def getCardForPage(url)
    begin
      page = Nokogiri::HTML(open(url))
    rescue => ex
      logger.error ex.message
      return false
    end
    return page
  end 
  
  
  def getCard
    
    CardPage.all.each do | cp |
      
      page = getCardForPage(cp.link)      
      cards = page.css(".table-s3 tr td.name a")
      
      # logger.info(cards[0].text)
      begin
        cards.each{|l| Card.create(:name=>l.text, :link=>l["href"])}
      rescue => ex
        logger.error ex.message
      end
      
    end
    render text: "OK"
    
  end
  
  
  def getCardInfo
    
    Card.all.each do | card |
      
      n = getCardForPage(card.link)            
      begin
        
        imglink = n.css(".table-s3.full tr img")[0]["src"]
        name = n.css(".table-s3.full tr td")[2].text
        english_name = n.css(".table-s3.full tr td")[4].text
        profession = n.css(".table-s3.full tr td")[6].text
        
        card_type = n.css(".table-s3.full tr td")[8].text
        type = n.css(".table-s3.full tr td")[10].text
        cost = n.css(".table-s3.full tr td")[12].text
        health = n.css(".table-s3.full tr td")[14].text
        
        attack = n.css(".table-s3.full tr td")[16].text
        power = n.css(".table-s3.full tr td")[18].text
        description = n.css(".table-s3.full tr td")[20].text
      
        c = Card.find_by_name(card.name)
        # # :name, :english_name, :link, :img_link, :description, :profession, :type, :card_type, :cost, :attack, :health, :power
        c.english_name = english_name
        c.img_link  = imglink
        c.description = description
        c.profession = profession
        c.type = type
        c.card_type = card_type
        c.cost =  cost
        c.attack = attack
        c.health = health
        c.power = power
        if c.save()
          logger.info(card.name)
        end
      rescue => ex
        logger.error ex.message
      end
      
    end
    render text: "OK"
    
  end
  
  def getCardInfoForList
    
    CardPage.all.each do | cp |
      
      page = getCardForPage(cp.link)      
      cards = page.css(".table-s3 tr")
      
      # logger.info(cards[0].text)
      # begin
        
        
        # cards = page.css(".table-s3 tr td.name a")
        
        cards.each{|l| 

          name = l.css("td.name a").text
          link = l.css("td.name a")["href"]

          # power = n.css(".skill").text
          logger.info(link )
          
          # n.css(".table-s3.full tr img")[0]["src"]
   #        name = n.css(".table-s3.full tr td")[2].text
   #        english_name = n.css(".table-s3.full tr td")[4].text
   #        profession = n.css(".table-s3.full tr td")[6].text
   #      
   #        card_type = n.css(".table-s3.full tr td")[8].text
   #        type = n.css(".table-s3.full tr td")[10].text
   #        cost = n.css(".table-s3.full tr td")[12].text
   #        health = n.css(".table-s3.full tr td")[14].text
   #      
   #        attack = n.css(".table-s3.full tr td")[16].text
   #        power = n.css(".table-s3.full tr td")[18].text
   #        description = n.css(".table-s3.full tr td")[20].text
   #        
   #        
   #        c = Card.new(:name=>l.text, :link=>l["href"])
   #        
   #        c.img_link = l["data-src"]
        }
        
      # rescue => ex
      #   # logger.error ex.message
      # end
      
    end
    render text: "OK"
  end
  
  
end
