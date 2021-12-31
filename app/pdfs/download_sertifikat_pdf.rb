class DownloadSertifikatPdf < Prawn::Document
    
    def initialize(fir,las,closing,img_serti)
        require "open-uri"
        super(
            :page_size => 'A4', 
            :page_layout => :landscape
        )do  
            fill_color "FFFFFF"   
            image open(img_serti),:at => [-40,560], width: 850, height: 600
        end

        @fir = fir
        @las = las
        @closing = closing
        
        user_id
    end

    def user_id
        font "Courier"
        table user_id_all do
            column(0).width = 769
            row(0).font_style = :bold
            row(0).font_style = :italic
            # FFFFCC
            column(0).style(:size => 40, :align => :center, :padding_top => 250, :borders => [])
        end

        table name_id do
            column(0).width = 769
            row(0).font_style = :italic
            column(0).style(:size => 12, :align => :center, :padding_top => 3,:borders => [])
            
        end
    end

    def user_id_all
        [[@fir+' '+@las]] 
    end

    def name_id
        [[@closing]] 
    end

end