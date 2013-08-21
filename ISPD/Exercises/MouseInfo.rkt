;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname MouseInfo) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
(require 2htdp/universe)
(require 2htdp/image)

;; Show current mouse coordinates on scene

;; Constants

(define WIDTH 300)
(define HEIGHT 300)
(define MTS (empty-scene WIDTH HEIGHT))
(define FONT-COLOR "red")
(define FONT-SIZE 24)

;; Data Definitions

(define-struct mouse-info (mx my tx ty))
;; MouseInfo is (make-mouse-info Integer Integer Integer Integer)
;; interp. mx, my as the current mouse coordinates on the scene,
;;         tx, ty as the coordinates of the text on the scene 
;;         (may differ from mx, my!)
(define MI1 (make-mouse-info 10 10 30 30))
(define MI2 (make-mouse-info 50 50 50 50))

#;
(define (fn-for-mi mi)
  (... (mouse-info-mx mi)
       (mouse-info-my mi)
       (mouse-info-tx mi)
       (mouse-info-ty mi)))

;; Functions

;; MouseInfo -> MouseInfo
;; start the world with for example: (main (make-mouse-info 0 0 100 100))
(define (main mi)
  (big-bang mi                          
            (to-draw   render)          
            (on-mouse  handle-mouse)))  


;; MouseInfo -> Image
;; show the current mouse position at the current output position
(check-expect (render MI1) 
              (place-image (text "10/10" FONT-SIZE FONT-COLOR) 30 30 MTS))

(define (render mi) 
  (place-image (text (mouse-info->string mi) FONT-SIZE FONT-COLOR)
               (mouse-info-tx mi)
               (mouse-info-ty mi)
               MTS))

;; MouseInfo -> String
;; produce output text 
(check-expect (mouse-info->string MI1) "10/10")

(define (mouse-info->string mi)
  (string-append (number->string (mouse-info-mx mi))
                 "/" 
                 (number->string (mouse-info-my mi))))

;; MouseInfo Integer Integer MouseEvent -> MouseInfo
;; produce new MouseInfo from current MouseEvent
;; always updates mx, my but changes tx, ty only with mouse clicks.
(check-expect (handle-mouse MI1 20 30 "button-down")
              (make-mouse-info 20 30 20 30))
(check-expect (handle-mouse MI2 100 200 "button-up")
              (make-mouse-info 100 200 50 50))

(define (handle-mouse mi x y me)
  (cond [(mouse=? me "button-down") 
         (make-mouse-info x y x y)]
        [else
         (make-mouse-info x y (mouse-info-tx mi) (mouse-info-ty mi))]))

(main MI1)