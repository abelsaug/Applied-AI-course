;Discount system for e-commerce

;Templates

;TEMPLATE: Product template

(deftemplate product
(slot cost (default 0))
(slot item_no (default 0))    
(slot quantity (default 0))
(slot category (default "Other"))
(slot sale (default "n"))
(slot checked_out (default "n"))
(slot shipped_out (default "n"))  
(slot PB (default "n"))
(slot BOGO (default "n"))
(slot BXGYF (default "n"))
(slot BXiGYiF (default "n"))
(slot BXiGdniF (default "n"))  
(slot free_shipping (default "n"))          
(slot free_shipping_zones (default "")))

;(deftemplate product_cost (slot cost)(slot quantity)(slot category)(slot sale))

;TEMPLATE: User template

(deftemplate user
(slot student (default "n"))
(slot address_zone (default "US"))
(slot other_loyalty_membership (default "n"))
(slot store_loyalty_membership (default "n"))    
(slot bonus_points (default 0))
(slot frequent_customer (default "n"))
(slot vip_customer (default "n"))
(slot coupon_code (default ""))
(slot coupon_check (default "n"))
(slot eligible_free_shipping (default "n"))
(slot cart_cost (default 0))
(slot shipping_cost (default 0))
(slot checkout (default "n"))
(slot shipout (default "n"))
(slot item_count (default 0))
                
    )

;TEMPLATE: System template

(deftemplate admin-sys
(slot multiple_coupons (default "n"))
(slot sale_products_excluded (default "y"))
(slot repeat_customer_discounts (default "n"))
(slot vip_customer_discount (default "n"))    
(slot bonus_points_and_discounts (default "n"))
(slot avail_free_shipping_at_higher_price (default "y"))
(slot free_shipping_price (default 35)))

;TEMPLATE: Selection value

(deftemplate selection
    (slot choice) ; Holds user choice
)

(deftemplate product_selection
    (multislot choice) ; Holds user choice as a multislot.
)

;(deftemplate user_discount (slot vip_customer_discount)(slot repeat_customer_discounts)(slot repeat_customer_discounts)(slot multiple_coupons)(slot student)(slot other_loyalty_membership)(slot other_loyalty_membership)(slot bonus_points)(slot frequent_customer)(slot vip_customer)(slot coupon_code))
;(deftemplate shipping_cost (slot free_shipping_price)(slot avail_free_shipping_at_higher_price)(slot free_shipping) (slot free_shipping_zones)(slot address_zone))
;(deftemplate total_cost (slot sale_products_excluded) (slot user_discount)(slot shipping_cost)(slot category)(slot product_cost))


; Startup module for the application that prints the Welcome message

(defmodule initial)
(import java.util.*)
(defglobal ?*count* = 0)
(defglobal ?*ShippingCount* = 0)
(defglobal ?*totcount* = 0)


(defrule welcome-user
=>
(assert(admin-sys))
    
  (assert(product(cost 600) (item_no 1)(category "Electronics")(sale "y")(free_shipping "y")(free_shipping_zones "CA")))
  (assert(product(cost 1000) (item_no 2)(category "Electronics")(free_shipping "y")(free_shipping_zones "CA")))
  (assert(product(cost 1400) (item_no 3)(category "Electronics")(sale "y")(free_shipping "y")(free_shipping_zones "CA")))

  (assert(product(cost 90) (item_no 4)(category "Home Appliances")(sale "y")))
  (assert(product(cost 8) (item_no 5)(category "Home Appliances")(sale "y")(free_shipping "y")(free_shipping_zones "US")))
  (assert(product(cost 160) (item_no 6)(category "Home Appliances")(sale "y")(free_shipping "y")(free_shipping_zones "US")))
  (assert(product(cost 80) (item_no 7)(category "Home Appliances")(sale "y")(free_shipping "y")(free_shipping_zones "US")))

  (assert(product(cost 15) (item_no 8)(category "Clothing")(sale "y")(free_shipping "y")(free_shipping_zones "CA")))
  (assert(product(cost 20) (item_no 9)(category "Clothing")(sale "y")(free_shipping "y")(free_shipping_zones "CA")))
  (assert(product(cost 30) (item_no 10)(category "Clothing")(sale "y")(free_shipping "y")(free_shipping_zones "CA")))
  (assert(product(cost 25) (item_no 11)(category "Clothing")(sale "y")(free_shipping "y")(free_shipping_zones "US")))
  (assert(product(cost 25) (item_no 12)(category "Clothing")(sale "y")(free_shipping "y")(free_shipping_zones "US")))
  (assert(product(cost 20) (item_no 13)(category "Clothing")(sale "y")(free_shipping "y")(free_shipping_zones "US")))

  (assert(product(cost 17) (item_no 14)(category "Back to School")(free_shipping "y")(free_shipping_zones "US")))
  (assert(product(cost 3) (item_no 15)(category "Back to School")(sale "y")(free_shipping "y")(free_shipping_zones "US")))
  (assert(product(cost 3) (item_no 16)(category "Back to School")(sale "y")(free_shipping "y")(free_shipping_zones "US")))
  (assert(product(cost 5) (item_no 17)(category "Back to School")(sale "y")(free_shipping "y")(free_shipping_zones "US")))
  (assert(product(cost 20) (item_no 18)(category "Back to School")(sale "y")(free_shipping "y")(free_shipping_zones "US")))
  (assert(product(cost 1) (item_no 19)(category "Back to School")(sale "y")(free_shipping "y")(free_shipping_zones "US")))
  (assert(product(cost 1) (item_no 20)(category "Back to School")(sale "y")(free_shipping "y")(free_shipping_zones "US")))
  (assert(product(cost 2) (item_no 21)(category "Back to School")(sale "y")(free_shipping "y")(free_shipping_zones "US")))

  (assert(product(cost 35) (item_no 22)(category "Books")(free_shipping "y")(free_shipping_zones "CA")))
  (assert(product(cost 85) (item_no 23)(category "Books")(free_shipping "y")(free_shipping_zones "CA")))
  (assert(product(cost 110) (item_no 24)(category "Books")(sale "y")(free_shipping "y")(free_shipping_zones "US")))
  (assert(product(cost 80) (item_no 25)(category "Books")(sale "y")(free_shipping "y")(free_shipping_zones "US")))
  (assert(product(cost 70) (item_no 26)(category "Books")(sale "y")(free_shipping "y")(free_shipping_zones "US")))
  (assert(product(cost 30) (item_no 27)(category "Books")(sale "y")(free_shipping "y")(free_shipping_zones "CA")))
  (assert(product(cost 90) (item_no 28)(category "Books")(sale "y")(free_shipping "y")(free_shipping_zones "CA")))
                                                                
    
(printout t "Welcome to IntelliBuy Store!" crlf)
(printout t "We bring you the best discounts and offers in USA!" crlf)
(printout t "       " crlf)
(printout t "User Selection" crlf)
(printout t "       " crlf)
    (printout t "1. Customer" crlf)
    (printout t "2. Admin" crlf)  
    (printout t "3. Quit" crlf)  
    
(printout t "Select the type of user and press Enter> ")
(assert (selection (choice (read)))))	; store the user's input


(deffunction find-id (?aFact)
   (eval (str-cat "(defquery search ?f<-" ?aFact ")"))
   (bind ?result (run-query* search))
   (if (?result next) then
      (return (call (?result get f) getFactId))
   else
      (return nil)))


(defrule welcome-user-again (admin-sys(multiple_coupons ?multiple_coupons)
        (sale_products_excluded ?sale_products_excluded)
        (repeat_customer_discounts ?repeat_customer_discounts)
        (vip_customer_discount ?vip_customer_discount)
        (bonus_points_and_discounts ?bonus_points_and_discounts)
        (avail_free_shipping_at_higher_price ?avail_free_shipping_at_higher_price)
        (free_shipping_price ?free_shipping_price))
=>
(printout t "Welcome to IntelliBuy Store!" crlf)
(printout t "We bring you the best discounts and offers in USA!" crlf)
(printout t "       " crlf)
(printout t "User Selection" crlf)
(printout t "       " crlf)
    (printout t "1. Customer" crlf)
    (printout t "2. Admin" crlf)  
    (printout t "3. Quit" crlf)  
    
(printout t "Select the type of user and press Enter> ")
(assert (selection (choice (read)))))	; store the user's input

;RULE: customer-section: If user selects 1 in main menu; A Test module for rules

(defrule customer-view 
	?s1 <- (selection(choice 1))
	=>
    (retract ?s1)
    ;Gathers user information
	(printout t "Please provide some required information about yourself." crlf)
    (printout t "Are you a VIP customer?" crlf)
	(bind ?vip_customer (read))    

	(printout t "Are you a student?" crlf)
	(bind ?student (read))    
    
	(printout t "Country of Residence" crlf)
	(bind ?address_zone (read)) 
 
	(printout t "Would you like to use your loyalty card for the Loyal Member Discount?" crlf)   
	(bind ?store_loyalty_membership (read)) 
    
	(printout t "Are you part of our partner programs: Chase Credit Card Discount or Emirates Skywards?" crlf)
	(bind ?other_loyalty_membership (read))    
    
	(printout t "Do you qualify for our frequent customer program?" crlf)   
	(bind ?frequent_customer (read)) 
    
	(printout t "Do you have any coupon codes that would like to use?" crlf)  
	(bind ?coupon_code (read))  

    ; Product Menu
	(printout t "Products" crlf)
    (printout t "" crlf)
    (printout t "" crlf)
    (printout t "Electronics" crlf)
    
    	(printout t "1.  iPad Pro 9\" 								Price:600" crlf)
    	(printout t "2.  iPhone X									Price:1000" crlf)
    	(printout t "3.  Macbook Pro 2015 13\" 							Price:1400" crlf)
    (printout t "" crlf)
    (printout t "" crlf)
    (printout t "Home Appliances" crlf)
    (printout t "" crlf)
    	(printout t "4.  Dirt Devil Vacuum Cleaner							Price:90" crlf)
    	(printout t "5.  Room Essentials Torcherie Lamp						Price:8" crlf)
    	(printout t "6.  Zinus Mattress								Price:160" crlf)
    	(printout t "7.  Zinus Bed Frame								Price:80" crlf)
	(printout t "" crlf)
    (printout t "" crlf)
    (printout t "Clothing" crlf)
    (printout t "" crlf)
    	(printout t "8.  Adidas T-shirt Striped							Price:15" crlf)
    	(printout t "9.  Gap Shirt									Price:20" crlf)
    	(printout t "10. Levi's Jeans								Price:30" crlf)
    	(printout t "11. Giordano Jeans								Price:25" crlf)
    	(printout t "12. Levi's T-shirt								Price:25" crlf)
    	(printout t "13. Adidas Track pants								Price:20" crlf)
    (printout t "" crlf)
    (printout t "" crlf)
    (printout t "Back to School" crlf)
    (printout t "" crlf)
    	(printout t "14. Adidas School Bag								Price:17" crlf)
    	(printout t "15. Reynolds Pen (14pack)							Price:3" crlf)
    	(printout t "16. Faber Castell Pencil Set (12 pack)						Price:3" crlf)
    	(printout t "17. Whiteboard Marker								Price:5" crlf)
    	(printout t "18. Scientific Calculator							Price:20" crlf)
    	(printout t "19. Eraser									Price:1" crlf)
    	(printout t "20. Sharpener									Price:1" crlf)
    	(printout t "21. Ruler									Price:2" crlf)
    (printout t "" crlf)
    (printout t "" crlf)
    (printout t "Books" crlf)
    (printout t "" crlf)
    	(printout t "22. Godel, Escher, Bach: An Eternal Golden Braid	Price:35" crlf)
    	(printout t "23. Deep Learning					Price:85" crlf)
    	(printout t "24. Artificial Intelligence: A Modern Approach		Price:110" crlf)
    	(printout t "25. Algorithms						Price:80" crlf)
    	(printout t "26. Introduction to Algorithms				Price:70" crlf)
    	(printout t "27. Fundamentals of Digital Image Processing		Price:30" crlf)
    	(printout t "28. Computer Vision: Algorithms and Applications	Price:90" crlf)
    (printout t "" crlf)
    (printout t "" crlf)
    (printout t "" crlf)
    (printout t "" crlf)
        (printout t "99. Checkout" crlf)
    (printout t "" crlf)
        (printout t "100. Quit" crlf)
    (bind ?selected_item (create$ ))
    (bind ?product_menu_choice (read))
    (bind ?selected_item (insert$ ?selected_item (+ (length$ ?selected_item) 1) ?product_menu_choice))	; store the user's input for products    
    (bind ?checkout "n")    
    (bind ?query (str-cat "(product(item_no " ?product_menu_choice "))" ))
    (bind ?id (find-id ?query))
    (if (neq ?id nil) then  
       (bind ?f1 (fact-id ?id))   
       (modify ?id (quantity (+ ?f1.quantity 1)))
       (bind ?item_count 1)
           
     elif (= ?product_menu_choice 99) then
        (bind ?checkout "y")  
    )    
    
    (while (and(not(= ?product_menu_choice 100)) (not(= ?product_menu_choice 99)))
    	(printout t "Product added!" crlf)
        (printout t "Enter your next selection" crlf)
        (bind ?product_menu_choice (read))
        (bind ?selected_item (insert$ ?selected_item (+ (length$ ?selected_item) 1)  ?product_menu_choice))
        (bind ?query (str-cat "(product(item_no " ?product_menu_choice "))" ))
        (bind ?id (find-id ?query))
        (if (neq ?id nil) then     
            (bind ?f1 (fact-id ?id))        
        	(modify ?id (quantity (+ ?f1.quantity 1))) 
            (bind ?item_count (+ ?item_count 1))
            
         elif (= ?product_menu_choice 99) then
        	(bind ?checkout "y")           
        )
    )
          
      
     (assert(user (item_count ?item_count)(checkout ?checkout)(coupon_code ?coupon_code)(vip_customer ?vip_customer)(student ?student)(address_zone ?address_zone)
            (store_loyalty_membership ?store_loyalty_membership) (other_loyalty_membership ?other_loyalty_membership) (frequent_customer ?frequent_customer)) )
    
)



(defrule admin-view 
	?s1 <- (selection(choice 2))
    ?a1 <- (admin-sys(multiple_coupons ?multiple_coupons)
        (sale_products_excluded ?sale_products_excluded)
        (repeat_customer_discounts ?repeat_customer_discounts)
        (vip_customer_discount ?vip_customer_discount)
        (bonus_points_and_discounts ?bonus_points_and_discounts)
        (avail_free_shipping_at_higher_price ?avail_free_shipping_at_higher_price)
        (free_shipping_price ?free_shipping_price))
	=>
    
    ;Gathers user information
	(printout t "You can go ahead and change following rules." crlf)
    
    (printout t "Would you like to accept multiple coupons in one transaction?" crlf)
	(bind ?multiple_coupons (read))    
    
    (printout t "Would you like to exclude discounted products from using in conjunction with coupons?" crlf)
	(bind ?sale_products_excluded (read))    

	(printout t "Would you like to give discounts to frequent customers?" crlf)
	(bind ?repeat_customer_discounts (read))    
    
	(printout t "Would you like to give discounts to VIP customers?" crlf)
	(bind ?vip_customer_discount (read)) 
 
	(printout t "Would you like to add discounts for partner programs and loyalty members?" crlf)   
	(bind ?bonus_points_and_discounts (read)) 
    
	(printout t "Would you like to provide free shipping for purchases above certain threshold?" crlf)
	(bind ?avail_free_shipping_at_higher_price (read))    
    
    (if(or (= ?avail_free_shipping_at_higher_price "y") (= ?avail_free_shipping_at_higher_price "Y") (= ?avail_free_shipping_at_higher_price "Yes") (= ?avail_free_shipping_at_higher_price "YES") (= ?avail_free_shipping_at_higher_price "yes")) then
	(printout t "Please specify the threshold over which it is consitituted as free shipping." crlf)   
	(bind ?free_shipping_price (read)) 
	)
	(retract ?a1)
    (retract ?s1)
    (assert(admin-sys(multiple_coupons ?multiple_coupons)
            (sale_products_excluded ?sale_products_excluded)
            (repeat_customer_discounts ?repeat_customer_discounts)
            (vip_customer_discount ?vip_customer_discount)
            (bonus_points_and_discounts ?bonus_points_and_discounts)
            (avail_free_shipping_at_higher_price ?avail_free_shipping_at_higher_price)
            (free_shipping_price ?free_shipping_price)))

    
)

;RULE: shipping_handle: Handles shipping and calculates shipping cost.


(defrule shipping_handle
    ?uss1 <- (user(shipout "n")(shipping_cost ?shipping_cost)(item_count ?item_count)(address_zone ?address_zone))
    ?prs1 <- (product(item_no ?ino)(quantity ?q&:(>= ?q 1))(cost ?cost)(shipped_out "n")(free_shipping ?free_shipping)(free_shipping_zones ?free_shipping_zones))
	=>
    (bind ?total_shipping_cost 0)
    (bind ?quantship ?q)
    (while (> ?q 0)
    	(bind ?*ShippingCount* (+ ?*ShippingCount* 1))
         (if (not(and(or(= ?free_shipping "y")(= ?free_shipping "Y")(= ?free_shipping "yes")(= ?free_shipping "YES")) (= ?free_shipping_zones ?address_zone)))
    	  then
        	(bind ?total_shipping_cost (+ 10 ?total_shipping_cost))
          )
        (bind ?q (- ?q 1))
    )    
    (modify ?uss1 (shipping_cost (+ ?shipping_cost ?total_shipping_cost)))
    (modify ?prs1 (shipped_out "y"))
    (if (= ?*ShippingCount* ?item_count) then
           (modify ?uss1 (shipout "y"))
         )
    (printout t "Item no.: " ?ino " Quantity: " ?quantship " Added. Total Cart Shipping Cost: " (+ ?shipping_cost ?total_shipping_cost) crlf)
    
    )

;RULE: checkout_handle: Handles checkout and calculates cart cost.

(defrule checkout_handle
    ?pr1 <- (product(item_no ?ino)(quantity ?q&:(>= ?q 1))(cost ?cost)(checked_out "n"))
    ?us1 <- (user(checkout "y")(cart_cost ?cart_cost)(item_count ?item_count))
	=>
    (bind ?total_cost 0)
    (bind ?quant ?q)
    (while (> ?q 0)
    	(bind ?*count* (+ ?*count* 1))
        (bind ?total_cost (+ ?cost ?total_cost))
        (bind ?q (- ?q 1))
    )    
    (modify ?us1 (cart_cost (+ ?cart_cost ?total_cost)))
    (modify ?pr1 (checked_out "y"))
    (if (= ?*count* ?item_count) then
           (modify ?us1 (checkout "c"))
         )
    (printout t "Item no.: " ?ino " Quantity: " ?quant " Cart Cost: " (+ ?cart_cost ?total_cost) crlf)
    
    )

;RULE: Buy_One_Get_One: Adds quantity for pens and erasers

(defrule Buy_One_Get_One
    ?p1 <- (product(item_no ?ino&: (or(= ?ino 15)(= ?ino 19)))(checked_out "y")(BOGO "n")(quantity ?q&:(>= ?q 1) ))
	=>
    
    (modify ?p1 (quantity (* ?q 2)) (BOGO "y"))
    (printout t "Buy One Get One Offer Applied" crlf)
    (printout t "New Quantity: " (* ?q 2) crlf)
    
    )

;RULE: Buy_X_Get_Y_Free: Adds sharpeners when buying pencil pack.

(defrule Buy_X_Get_Y_Free
    ?p0 <- (product(item_no 16)(checked_out "y")(BXGYF "n")(quantity ?q&:(>= ?q 1) ))
    ?usf <- (user(checkout "c")(cart_cost ?cart_cost)(item_count ?item_count))
    
	=>
    
    (bind ?query (str-cat "(product(item_no " 20 "))" ))
    (bind ?id (find-id ?query))
    (if (neq ?id nil) then             
    	(modify ?id (quantity ?q)) 
        (modify ?p0 (BXGYF "y"))  
        (printout t "Buy X Get Y Free Offer Applied" crlf)  
         (printout t "Item no.: " 20 " Quantity: " ?q " Added Free " crlf)      
    )
    )

;RULE: Product_Bundles: 100$ off when buying both iPhone and Macbook.

(defrule Product_Bundles
    ?pb0 <- (product(item_no 2)(checked_out "y")(PB "n")(quantity ?q0&:(>= ?q0 1) ))
    ?pb1 <- (product(item_no 3)(checked_out "y")(PB "n")(quantity ?q1&:(>= ?q1 1) ))
    ?uspb <- (user(checkout "y")(cart_cost ?cart_cost)(item_count ?item_count))
    
	=>
    
    (if (> ?q0 ?q1) 
        then
        (bind ?quant ?q1)
     else
        (bind ?quant ?q0) 
    )
        
        (modify ?pb0 (PB "y"))
        (modify ?pb1 (PB "y"))
        
        (modify ?uspb (cart_cost (- ?cart_cost (* 100 ?quant))))  
        (printout t "Product bundle Offer Applied" crlf)  
		(printout t "New Cart Cost: " (- ?cart_cost (* 100 ?quant)) crlf)
    )

;RULE: Buy_X_items_Get_Y_items_Free: Buy 4 Levi's Tshirts and get 2 free.

(defrule Buy_X_items_Get_Y_items_Free
    ?pL <- (product(item_no 12)(checked_out "y")(BXiGYiF "n")(quantity ?q&:(>= ?q 4) ))
	=>
    
    (bind ?fours (/ ?q 4))
    (bind ?fours (integer ?fours))
    
    (bind ?fours (* ?fours 2))
	(modify ?pL (quantity (+ ?q ?fours)) (BXiGYiF "y"))  
    (printout t "Buy X items Get Y items Free Offer Applied" crlf)
    (printout t "Item no.: " ?pL.item_no " New Quantity: " (+ ?q ?fours) crlf)      
       
   )

;RULE: Buy_X_items_Get_Discount_next_item: Buy 3 Adidas T shirt and get 4th for 50%

(defrule Buy_X_items_Get_Discount_next_item
    ?pA <- (product(item_no 8)(checked_out "y")(BXiGdniF "n")(quantity ?q&:(>= ?q 4) ))
    ?us1 <- (user(checkout "y")(cart_cost ?cart_cost)(item_count ?item_count))
	=>
    
    (bind ?fours (/ ?q 4))
    (bind ?fours (integer ?fours))
    (bind ?discount_percentage (* ?fours 0.5))
    (bind ?discount (* ?discount_percentage ?pA.cost))
    
	(modify ?us1 (cart_cost (- ?cart_cost ?discount)))
    (modify ?pA (BXiGdniF "y"))  
    (printout t "Buy X items and get discount on next item Offer Applied" crlf)
    (printout t "Item no.: " ?pA.item_no " Quantity: " ?q " Discount applied: " ?discount crlf)      
       
   )

;RULE: Coupon_Eligibilty: Check if sale products are present

(defrule Coupon_Eligibilty
    ?pCE <- (product(checked_out "y")(sale ?sale)(quantity ?q&:(>= ?q 1) ))
    ?usc1 <- (user(checkout "c")(coupon_check "n")(item_count ?item_count))
    ?adc1 <- (admin-sys(sale_products_excluded ?sale_products_excluded))
	=>
    
    
    (if (= ?sale_products_excluded "y")
        then
    	(bind ?quant ?q)
    	(while (> ?q 0)
    		(bind ?*totcount* (+ ?*totcount* 1))
        	(bind ?q (- ?q 1))
    	)  
        (if (= ?sale "y")
            then
            (modify ?usc1 (coupon_check "f"))
            
            )
        (if (= ?*totcount* ?item_count)
            then
            (modify ?usc1 (coupon_check "y"))
            
            ) 
     else
        (modify ?usc1 (coupon_check "y"))   
        
        )
    
   )

;RULE: Coupon_Discounts: Enter coupons for discounts
(defrule Coupon_Discounts
    ?adc2 <- (admin-sys(multiple_coupons ?multiple_coupons))
    ?usc2 <- (user(checkout "c")(coupon_check "y")(coupon_code ?coupon_code)(shipping_cost ?shipping_cost)(cart_cost ?cart_cost)(item_count ?item_count))
	=>
    (if (= ?coupon_code "y")
        then
    (bind ?Number_of_coupons 1)
    (bind ?legit_coupons 0)
    (bind ?coupon "")
    
    (if (= ?multiple_coupons "y")
        then 
        (printout t "How many coupons do you have?" crlf)
        (bind ?Number_of_coupons (read))
    )
    (while (> ?Number_of_coupons 0)
        (printout t "Enter coupon code:" crlf)
        (bind ?coupon (read))
        (if (or(= ?coupon "CXLRF")(= ?coupon "CXLRI"))
            then
            (bind ?legit_coupons (+ ?legit_coupons 1))   
        )
        (bind ?Number_of_coupons (- ?Number_of_coupons 1))
    )
    (bind ?discount (* ?legit_coupons 20))
    (bind ?total_cost (+ ?cart_cost ?shipping_cost))
    (if (> ?discount ?total_cost)
      then 
        (modify ?usc2 (cart_cost 0))
        (modify ?usc2 (coupon_code "n"))
        (printout t "Coupons Applied" crlf)
    	(printout t "Total cost: " 0 crlf)    
     elif(> ?discount ?cart_cost)
        then
        (bind ?remaining_discount (- ?discount ?cart_cost))
        (modify ?usc2 (cart_cost 0)( shipping_cost (- ?shipping_cost ?remaining_discount)))
        (modify ?usc2 (coupon_code "n"))
        
        (printout t "Coupons Applied" crlf)
    	(printout t "Total cost: " (- ?shipping_cost ?remaining_discount) crlf)    
     else
        then
        (modify ?usc2 (cart_cost (- ?cart_cost ?discount)))
        (modify ?usc2 (coupon_code "n"))
        
        (printout t "Coupons Applied" crlf)
    	(printout t "Total cost: " (+ (- ?cart_cost ?discount) ?shipping_cost) crlf)    
  
    )
   )    
   )

;RULE: Free_Shipping: Provides Free Shipping worldwide if the cart price is above free shipping price and admin has set free shipping option to TRUE.

(defrule Free_Shipping
    ?a2 <-  (admin-sys
        (avail_free_shipping_at_higher_price ?avail_free_shipping_at_higher_price)
        (free_shipping_price ?free_shipping_price))
    ?u2 <- (user(shipout "y")(checkout "c")(cart_cost ?cart_cost)(shipping_cost ?shipping_cost))
    (test(and (> ?shipping_cost 0)(>= ?cart_cost ?free_shipping_price)(or (= ?avail_free_shipping_at_higher_price "YES")(= ?avail_free_shipping_at_higher_price "y")(= ?avail_free_shipping_at_higher_price "Y")(= ?avail_free_shipping_at_higher_price "yes"))))
	=>

    	(if (and (>= ?cart_cost ?free_shipping_price)(or (= ?avail_free_shipping_at_higher_price "YES")(= ?avail_free_shipping_at_higher_price "y")(= ?avail_free_shipping_at_higher_price "Y")(= ?avail_free_shipping_at_higher_price "yes"))) then
    		(modify ?u2 (shipping_cost 0)(shipout "n"))         
        	(modify ?u2 (eligible_free_shipping "y"))
            (printout t "Free Shipping Offer Applied" crlf)
            (printout t "Previous Shipping Cost: " ?shipping_cost crlf)
         
        	(printout t "New Cart Cost: " ?cart_cost " Shipping Cost: " 0 crlf)
        	(printout t "New Total Cost: " (+ ?cart_cost 0) crlf) 
    	)
    )

;RULE: Frequent_Customer: Provides Frequent Customer with a 5% discount or 25$ off whichever is lower. Only if admin has set it as TRUE.

(defrule Frequent_Customer
    ?a3 <-  (admin-sys
        (repeat_customer_discounts ?repeat_customer_discounts))
    ?u3 <- (user(checkout "c")(frequent_customer ?frequent_customer)(cart_cost ?cart_cost)(shipping_cost ?shipping_cost))
	=>
        (if(and (or (= ?repeat_customer_discounts "YES")(= ?repeat_customer_discounts "y")(= ?repeat_customer_discounts "Y")(= ?repeat_customer_discounts "yes")) (or (= ?frequent_customer "YES")(= ?frequent_customer "y")(= ?frequent_customer "Y")(= ?frequent_customer "yes")))
    		then
			(printout t "Frequent Customer Offer Applied" crlf)
            (printout t "Previous Cart Cost: " ?cart_cost crlf)
        
			(bind ?c1 (* 0.05 ?cart_cost))
    		(bind ?c2 25)
    		(if (<= ?c1 ?c2) then
    			(modify ?u3 (frequent_customer "n")(cart_cost (* 0.95 ?cart_cost))) 
                (printout t "New Cart Cost: " (* 0.95 ?cart_cost) " Shipping Cost: " ?shipping_cost crlf)
        		(printout t "New Total Cost: " (+ (* 0.95 ?cart_cost) ?shipping_cost) crlf) 
        	 else
        		 (modify ?u3 (frequent_customer "n")(cart_cost (- ?cart_cost 25)))      
                 (printout t "New Cart Cost: " (- ?cart_cost 25) " Shipping Cost: " ?shipping_cost crlf)
        		 (printout t "New Total Cost: " (+ (- ?cart_cost 25) ?shipping_cost) crlf) 
        	) 
        else
        (modify ?u3 (frequent_customer "n"))
        )
)

;RULE: Store_Member_Customers: Provides Customers with store membership with a 5% discount or 25$ off whichever is lower. Only if admin has set it as TRUE.

(defrule Store_Member_Customers
    ?a4 <-  (admin-sys
        (bonus_points_and_discounts ?bonus_points_and_discounts))
    ?u4 <- (user(checkout "c")(store_loyalty_membership ?store_loyalty_membership)(cart_cost ?cart_cost)(shipping_cost ?shipping_cost))
    =>
        
    (if(and (or (= ?bonus_points_and_discounts "YES")(= ?bonus_points_and_discounts "y")(= ?bonus_points_and_discounts "Y")(= ?bonus_points_and_discounts "yes")) 
            (or (= ?store_loyalty_membership "YES")(= ?store_loyalty_membership "y")(= ?store_loyalty_membership "Y")(= ?store_loyalty_membership "yes")))
		then
    		(printout t "Store Loyalty Members Offer Applied" crlf)
    
        	(printout t "Previous Cart Cost: " ?cart_cost crlf)
			(bind ?c1 (* 0.05 ?cart_cost))
    		(bind ?c2 25)
    		(if (<= ?c1 ?c2) then
    			(modify ?u4 (store_loyalty_membership "n")(cart_cost (* 0.95 ?cart_cost))) 
                (printout t "New Cart Cost: " (* 0.95 ?cart_cost) " Shipping Cost: " ?shipping_cost crlf)
        		(printout t "New Total Cost: " (+ (* 0.95 ?cart_cost) ?shipping_cost) crlf)     
        	 else
        		 (modify ?u4 (store_loyalty_membership "n")(cart_cost (- ?cart_cost 25)))     
                 (printout t "New Cart Cost: " (- ?cart_cost 25) " Shipping Cost: " ?shipping_cost crlf)
        		 (printout t "New Total Cost: " (+ (- ?cart_cost 25) ?shipping_cost) crlf)     
        	)
        else
         (modify ?u4 (store_loyalty_membership "n"))
        )
)

;RULE: Partner_Member_Customers: Provides Customers with Partner membership with a 2% discount or 10$ off whichever is lower. Only if admin has set it as TRUE.

(defrule Partner_Member_Customers
    ?ap4 <-  (admin-sys
        (bonus_points_and_discounts ?bonus_points_and_discounts))
    ?up4 <- (user(checkout "c")(other_loyalty_membership ?other_loyalty_membership)(cart_cost ?cart_cost)(shipping_cost ?shipping_cost))
   	=>
         (if(and (or (= ?bonus_points_and_discounts "YES")(= ?bonus_points_and_discounts "y")(= ?bonus_points_and_discounts "Y")(= ?bonus_points_and_discounts "yes")) 
            (or (= ?other_loyalty_membership "YES")(= ?other_loyalty_membership "y")(= ?other_loyalty_membership "Y")(= ?other_loyalty_membership "yes")))
    		then
        
    		(printout t "Partner Loyalty Members Offer Applied" crlf)
            (printout t "Previous Cart Cost: " ?cart_cost crlf)
        
			(bind ?c1 (* 0.02 ?cart_cost))
    		(bind ?c2 10)
    		(if (<= ?c1 ?c2) then
    			(modify ?up4 (other_loyalty_membership "n")(cart_cost (* 0.98 ?cart_cost))) 
                (printout t "New Cart Cost: " (* 0.98 ?cart_cost) " Shipping Cost: " ?shipping_cost crlf)
        		(printout t "New Total Cost: " (+ (* 0.98 ?cart_cost) ?shipping_cost) crlf) 
        	 else
        		 (modify ?up4 (other_loyalty_membership "n")(cart_cost (- ?cart_cost 10)))
                 (printout t "New Cart Cost: " (- ?cart_cost 10) " Shipping Cost: " ?shipping_cost crlf)
        		 (printout t "New Total Cost: " (+ (- ?cart_cost 10) ?shipping_cost) crlf)       
        	) 
        else
        (modify ?up4 (other_loyalty_membership "n"))
        )
)

;RULE: VIP_Customer: Provides VIP Customer with a 20% discount. Only if admin has set it as TRUE.

(defrule VIP_Customer
     ?a5 <-  (admin-sys
        (vip_customer_discount ?vip_customer_discount))
    ?u5 <- (user(checkout "c")(vip_customer ?vip_customer)(cart_cost ?cart_cost)(shipping_cost ?shipping_cost))
   	=>
     (if(and (or (= ?vip_customer_discount "YES")(= ?vip_customer_discount "y")(= ?vip_customer_discount "Y")(= ?vip_customer_discount "yes"))
             (or (= ?vip_customer "YES")(= ?vip_customer "y")(= ?vip_customer "Y")(= ?vip_customer "yes")))
    			then
        		(printout t "VIP Customer Offer Applied" crlf)
                (printout t "Previous Cart Cost: " ?cart_cost crlf)
        
    			(modify ?u5 (vip_customer "n")(cart_cost (* 0.8 ?cart_cost)))   
            	(printout t "New Cart Cost: " (* 0.8 ?cart_cost) " Shipping Cost: " ?shipping_cost crlf)
        		(printout t "New Total Cost: " (+ (* 0.8 ?cart_cost) ?shipping_cost) crlf) 
        	else
        		(modify ?u5 (vip_customer "n"))
        )
)

;RULE: Student_Discount: Provides Student Customers with a 10% discount or 25$ off whichever is lower.

(defrule Student_Discount
    ?u6 <- (user(checkout "c")(student ?student)(cart_cost ?cart_cost)(shipping_cost ?shipping_cost))
    (test(or (= ?student "YES")(= ?student "y")(= ?student "Y")(= ?student "yes")))
	=>
        	(if(or (= ?student "YES")(= ?student "y")(= ?student "Y")(= ?student "yes")) then
    
    			(printout t "Student Discount Offer Applied" crlf)
                (printout t "Previous Cart Cost: " ?cart_cost crlf)
        
				(bind ?c1 (* 0.1 ?cart_cost))
    			(bind ?c2 25)
    			(if (<= ?c1 ?c2) then
    				(modify ?u6 (student "n")(cart_cost (* 0.9 ?cart_cost))) 
        			(printout t "New Cart Cost: " (* 0.9 ?cart_cost) " Shipping Cost: " ?shipping_cost crlf)
        			(printout t "New Total Cost: " (+ (* 0.9 ?cart_cost) ?shipping_cost) crlf)
        		 else
        			 (modify ?u6 (student "n")(cart_cost (- ?cart_cost 25)))     
        			 (printout t "New Cart Cost: " (- ?cart_cost 25) " Shipping Cost: " ?shipping_cost crlf)
        			 (printout t "New Total Cost: " (+ (- ?cart_cost 25) ?shipping_cost) crlf) 
        		) 
			else
             (modify ?u6 (student "n"))
    )
)

;RULE: quit-program: If user selects 3 in main menu

(defrule quit ; Rule to end program
	?s1 <- (selection(choice 3))
	=>
	(printout t "Closing..." crlf)
    (retract ?s1)
	(exit) ; ends the program
)

;RULE: quit-program: If user selects 100 in product menu

(defrule quit_again ; Rule to end program
	?s1 <- ( product_selection(choice $? 100 $?))
	=>
	(printout t "Closing..." crlf)
    (retract ?s1)
	(exit) ; ends the program
)


(deffunction run-application ()
(reset)
(set-reset-globals TRUE)
(focus initial)
(run)
)

;Run the above function in a loop to get back the prompt every time we have to enter the values for another candidate or re-run the program

(while TRUE
(run-application))