class EmailNotificationObserver < ActiveRecord::Observer

  observe :order, :address
  
  def after_create(model)    
  	if model.class.name == "Order"
  	  for i in 0..5
  	    puts "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"    	  
    	  Notifier.delay.order_created
    	  #Delayed::Job.enqueue MailingJob.new()
    	end
    else
    	Notifier.address_created.deliver	
    end    
  end
  	
end
