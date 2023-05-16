class Card
 
    def initialize(face_value, status)
      @face_value = face_value
      @status = status
    end

    def face_up?
     @status == "face_up"
    end

    def face_value
      if self.face_up?
        return @face_value
        true
      else
        return false
      end
    end

    def hide
      @status = "face_down"
    end


    def reveal
        @status = "face_up"
    end

    # def ==(card)
    #    card.reveal
    #    self.reveal
    #   unless card.face_value == self.face_value
    #     card.hide 
    #     self.hide
    #   end
    # end




end