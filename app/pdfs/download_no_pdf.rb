class DownloadNoPdf < Prawn::Document
    
    def initialize(list,listts)
        super(
            :page_size => 'A4', 
            :page_layout => :landscape, 
            # :background => "app/assets/images/Nomor_Dada.png"
        )do     
            pigs = "app/assets/images/Nomor_Dada.png" 
            image pigs, :at => [-40,560], :width => 850  
        end

        @lists = list
        @listts = listts
        @no = 0
        @totald = 0
        @totalp = 0
        
        user_id
    end

    def user_id
        table name_id do
            column(0).width = 750
            row(0).font_style = :italic
            column(0).style(:size => 35, :align => :center, :padding_top => 60, :borders => [], :text_color => "#FFFFCC")
            
        end

        table user_id_all do
            column(0).width = 750
            row(0).font_style = :bold
            column(0).style(:size => 60, :align => :center, :padding_top => 150, :borders => [])
        end
    end

    def name_id
        [[@listts]] 
    end

    def user_id_all
        [[@lists]] 
    end

end