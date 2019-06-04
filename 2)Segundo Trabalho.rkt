;Autor: Thaissa Gonçalves do Crato
;E-mail: cratothaissa34@gmail.com

;(Ex.1)
(define x 3)
(define y 4)
(define (pitagoras a b)
  (sqrt (+ (sqr a)(sqr b))))
#| > (pitagoras x y)
5 |#


;(Ex.2)
(define prefixo "hello")
(define sufixo "world")
(define (junta pre suf)
  (string-append pre "_" suf))
#|> (junta prefixo sufixo)
"hello_world"
> (junta "hgfd" "nbvcx")
"hgfd_nbvcx"|#


;(Ex.3)
(define str "helloworld")
(define i 5)
(define (bota_ a i)
  (string-append (substring a 0 i) "_" (substring a i)))
#|> (bota_ str i)
"hello_world"|#


;(Ex.4)
(define (deleta str i)
  (string-append (substring str 0(- i 1)) (substring str i)))
#|> (deleta str i)
"hellworld"|#

 
;(Ex.5)
(require 2htdp/image)
(define tree
  (above (star-polygon 10 10 3 "solid" "green")
         (rectangle 8 40 "solid" "brown")))
#|> tree
.
> (place-image tree
               50 50
               (empty-scene 100 100))
.|#


;(Ex.6)
(define cat .)
(define (qtd-pixels img)
  (*(image-height cat)(image-width cat)))
#|> (qtd-pixels cat)
8775|#


;(Ex.7)
(define sunny #true)
(define friday #false)
(define (mall sunny friday)
  (or(eq? sunny #false)(eq? friday #true)))
#|> (mall sunny friday)
#false|#


;(Ex.8)
(define CAT .)
(define (t-w img)
  (if (>(image-height img)(image-width img))
      "tall" "wide"))
#|> (t-w CAT)
"tall"|#


(define (t-w-s img)
  (if (>(image-height img)(image-width img))
      "tall"
  (if (=(image-height img)(image-width img))
      "square" "wide")))
#|> (t-w-s CAT)
"tall"|#


;(Ex.9)
(define in "hello")
(define (cnvtr in)
  (if (string? in)
      (string-length in)
      (if (image? in)
          (*(image-height in)(image-width in))
          (if (number? in)
              (if (- in 1)
                  (> in 0)
                  "número 0 ou negativo")
                  (if (false? in)
                  20 10)))))
#|> (cnvtr in)
5
;(número 0 ou negativo)
> (cnvtr 0)
if: question result is not true or false: -1
> (cnvtr #false)
20
> (cnvtr #true)
10|#


;(Ex.11)
(define (dist x y)
  (sqrt(+(sqr x)(sqr y))))
#|> (dist 3 4)
5|#
;(As variáveis x y já foram definidas no ex.1


;(Ex.12)
(define (cvolume a)
  (* a a a))
#|>(cvolume 1)
1
>(cvolume 2)
8
>(cvolume 3)
27|#
(define (csurface a)
  (sqr a))
#|>(csurface 1)
1
>(csurface 2)
4
>(csurface 3)
9|#


;(Ex.13)
(define (string-first hlp)
  (substring hlp 0 1))
#|> (string-first "world")
"w"|#

;(Ex.14)
(define (string-last hlp)
  (substring hlp(-(string-length hlp)1)))
#|> (string-last "world")
"d"|#

;(Ex.15)
(define (s-f sunny friday)
  (or(eq? sunny #false)
     (eq? friday #true)))
#|> (s-f #true #false)
#false
> (s-f #true #true)
#true
> (s-f #false #true)
#true
> (s-f #false #false)
#true|#

;(Ex.16)
#|(define cat .)|#
(define (qtde-pixels cat)
  (*(image-height cat)(image-width cat)))
#|> (qtde-pixels cat)
8775|#

;(Ex.17)
(define (T-W-S img)
  (if (>(image-height img)(image-width img))
      "tall"
      (if (=(image-height img)
            (image-width img))
          "square" "wide")))
#|> (T-W-S cat)
"tall"|#

;(Ex.18)
(define (string-join bota str i)
  (string-append bota "_" str i))
#|> (string-join "hello" "_" "world")
"hello__world"|#

;(Ex.19)
(define (string-insert str i)
  (string-append (substring str 0 i) "_"
                 (substring str i)))
#|(string-insert "hellopeople" 5)
"hello_people"|#

;(Ex.20)
(define (string-delete str i)
  (string-append (substring str 0(- i 1))
                 (substring str i)))
#|> (string-delete "peeople" 3)
"people"|#


;(Ex.21)
(define (ff a)
  (* 10 a))
#|(ff (+ 1 1))|#

(ff (ff 1))
#|100|#
;Step
#|(ff (*10 1))
(ff 10)
(* 10 10)
100|#

(+(ff 1)(ff 1))
#|20|#
;Step
#|(+(* 10 1)(ff 1)
(+ 10(ff 1))
(+ 10(* 10 1))
(+ 10 10)
20|#



;(Ex.22)
(define (distance-to-origin x y)
  (sqrt (+(sqr x)(sqr y))))
(distance-to-origin 3 4)
(sqrt (+(sqr 3)(sqr 4)))
#|5|#
;Step:
#|(sqrt
 (+(sqr 3)(sqr 4)))
(sqrt (+ 9(sqr 4)))
(sqrt (+ 9 16))
(sqrt 25)
5|#

;(Ex. 23)
(define (String-First s)
(substring s 0 1))
(String-First "PEOPLE")
#|"P"|#

;(Ex. 24)
(define (==> x y)
  (or (not x)y))
(==> #true #false)
;Step
#|(or (not #true) #false)
(or #false false)
#false|#

;(Ex.25)
(define (image-classify img)
  (cond
    [(>= (image-height img)(image-width img)) "tall"]
    [(= (image-height img)(image-width img)) "square"]
    [(<= (image-height img)(image-width img)) "wide"]))
(image-classify (circle 2 "solid" "red"))
#|"tall"|#

;Step
#|(cond
 ((>=(image-height .)(image-width .))"tall")
 ((= (image-height .)(image-width .))"square")
 ((<=(image-height .)(image-width .))"wide"))
(cond
 ((>= 4 (image-width .))"tall")
 ((=(image-height .)(image-width .))"square")
 ((<=(image-height .)(image-width .))"wide"))
(cond
 ((>= 4 4) "tall")
 ((=(image-height .)(image-width .))"square")
 ((<=(image-height .)(image-width .))"wide"))
(cond
 (#true "tall")
 ((=(image-height .)(image-width .))"square")
 ((<=(image-height .)(image-width .))"wide"))
"tall"|#

;(Ex.26)
(define (STRING-INSERT s i)
  (string-append (substring s 0 i)
                 "_"
                 (substring s i)))
(string-insert "helloworld" 6)
#|hellow_orld|#

;Step
#|(string-append (substring "helloworld" 0  6)"_"(substring "helloworld" 6))
(string-append "hellow" "_" (substring "helloworld" 6))
(string-append "hellow" "_" "orld")
"hellow_orld" |#

;(Ex.27)
(define costfix 180)
(define Attd 120)
(define costperAttd 0.04)
(define Attdchge 15)
(define ctchge 0.1)
(define price 5.0)

  (define (attendees ticket-price)
    (- 120(*(- ticket-price 5.0 )  (/ 15 0.1))))
#|(- Attd(*(-ticket-price price)(/ Attdchge ctchge))))|#

  (define (revenue ticket-price)
    (* ticket-price (attendees ticket-price)))

  (define (cost ticket-price)
    (+ 180(* 0.04 (attendees ticket-price))))
#|(+ costfix (* costperAttd (attendees ticket-price))))|#

  (define (profit ticket-price)
    (-(revenue ticket-price)
       (cost ticket-price)))

;(Ex.28)
#|> (profit 1)
511.2
> (profit 2)
937.2
> (profit 3)
1063.2
;mais lucrativo
> (profit 4)
889.2
> (profit 5)
415.2|#

 (define (proft price)
   (- (* (+ 120
            (* (/ 15 0.1)
               (- 5.0 price)))
         price)
      (+ 180
         (* 0.04
            (+ 120
               (* (/ 15 0.1)
                  (- 5.0 price)))))))
#|> (proft 1)
511.2
> (proft 2)
937.2
> (proft 3)
1063.2
> (proft 4)
889.2
> (proft 5)
415.2|#

;(Ex.29)
(define CostperAttd 1.50)
(define (Attendees ticket-price)
 (- Attd(*(- ticket-price price)(/ Attdchge ctchge))))
(define (Revenue ticket-price)
 (* ticket-price (Attendees ticket-price)))
(define (Cost ticket-price)
 (* CostperAttd (Attendees ticket-price)))
 (define (Proft ticket-price)
   (-(Revenue ticket-price)
     (Cost ticket-price)))
#|> (Proft 3)
630
> (Proft 4)
675
> (Proft 5)
420|#


(define(PROFIT price)
  (-(*(+ 120
           (*(/ 15 0.1)
             (- 5.0 price)))
        price)
     (* 1.50
           (+ 120
              (* (/ 15 0.1)
                 (- 5.0 price))))))
#|> (PROFIT 3)
630
> (PROFIT 4)
675
> (PROFIT 5)
420|#


;(Ex.30)
(define price-sensitivity(/ 15 0.1))
(define (PROFIT5 price)
  (-(*(+ 120
          (* price-sensitivity
             (- 5.0 price)))
        price)
     (* 1.50
           (+ 120
              (* price-sensitivity
                 (- 5.0 price))))))
