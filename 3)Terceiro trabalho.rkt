;Autor: Thaíssa Gonçalves do Crato
;E-mail: cratothaissa34@gmail.com

;(Ex.33)
;O problema do ano 2000, também conhecido como problema Y2K, bug do Milênio, bug Y2K, ou Y2K, é uma classe de bugs relacionados à formatação e armazenamento de dados de calendário para datas a partir do ano 2000. Problemas foram antecipados, e surgiu, porque muitos programas representavam anos de quatro dígitos com apenas os dois dígitos finais - tornando o ano 2000 indistinguível de 1900.
;Y2K é um numeronimo e era a abreviação comum para o problema de software do ano 2000.

;(Ex.34)
;Design: Recebe uma string e retorna o primeiro caractere
;String-> String
(define (string-first hello)
        (string-ith hello 0))        
#|> (string-first "hello")
"h"
> (string-first "Anaísa")
"A"|#

;(Ex.35)
;Design: Recebe uma string e retorna o último caractere
;String-> String
(define (string-last hello)
  (string-ith hello(-(string-length hello)1)))
#|> (string-last "hello")
"o"|#


;(Ex.36)
;Design: Recebe uma imagem e retorna o número de pixels da imagem recebida
;Image-> Number
(require 2htdp/image)
(define (image-area img)
  (*(image-height img)(image-width img)))
#|> (image-area .)
1176|#


;(Ex.37)
;String-> String
(define (string-rest hello)
  (substring hello 1))
#|> (string-rest "hello")
"ello"
> (string-rest "Anaísa")
"naísa"|#

;(Ex.38)
(define (string-remove-last hello)
  (substring hello 0(-(string-length hello)1)))
#|> (string-remove-last "hello")
"hell"
> (string-remove-last "Anaísa")
"Anaís"|#



;(Exs.39-44)
(require 2htdp/image)
(require 2htdp/universe)

;define dimensões do "mundo"
(define WIDTH-OF-WORLD 400)
(define HEIGHT-OF-WORLD 40)

;informaçõs das rodas dos carros
(define WHEEL-RADIUS 5)
(define WHEEL-DISTANCE 5)
(define WHEEL
  (circle WHEEL-RADIUS "solid" "black"))
(define SPACE
  (rectangle WHEEL-DISTANCE WHEEL-RADIUS "solid" "white"))
(define BOTH-WHEELS
  (beside WHEEL SPACE WHEEL))

(define BODY-LENGHT 30)
(define BODY-HEIGHT 10)
(define BODY
  (above(rectangle 15 5 "solid" "yellow")
        (rectangle 30 10 "solid" "yellow")))

(define CAR
  (overlay/align/offset "middle" "bottom"
                                  BOTH-WHEELS 0 -5 BODY))


(define Y-CAR 30)
(define SPEED 4)
(define CAR-CENTER
  (/(image-width CAR) 2))

;define BACKGROUND (mundo com árvore)
(define TREE
  (underlay/xy(circle 10 "solid" "green")
              9 15
              (rectangle 2 20 "solid" "brown")))
(define BACKGROUND (place-image
                    TREE
                    30 25
                    (empty-scene WIDTH-OF-WORLD HEIGHT-OF-WORLD)))


;WorldState-> Image
(define(render ws)
  (place-image CAR ws Y-CAR BACKGROUND))

;WorldState-> WorldState
(define (tock ws)
  (+ ws 3))

(check-expect (tock 20) 23)
(check-expect (tock 78) 81)

;WorldState String-> WorldState
(define(stroke ws ke)0)
  
;WorldState -> WorldState
;inicializa o programa no estado inicial.
(define (main ws)
  (big-bang ws
    [on-tick tock]
    [to-draw render]
    [on-key stroke]
    [stop-when end?]))

(check-expect(render  50)
             (place-image CAR  50 Y-CAR BACKGROUND))
(check-expect(render 200)
             (place-image CAR 200 Y-CAR BACKGROUND))


;WorldState-> Boolean
;end car simulation when car reaches end of world
(check-expect(end? 0)
             #false)
(check-expect(end? 100)
             #false)
(check-expect(end? (+ WIDTH-OF-WORLD(/(image-width CAR)2)))
             #true)

(define (end? ws)
  (>= ws 415))

;AnimationState é um Número
;O número de ticks do relógio é interpretado desde o começo da animação.
(define NSA1  0)

;AnimationState-> AnimationState
;A cada tick do relógio é somado 1 ao AnimationState.
(define(tock2 nsa)(add1 nsa))

(check-expect(tock2 0)1)
(check-expect(tock2 100)101)

;(define(render as)BACKGROUND)
;stub
(define(render2 nsa)
  (place-image CAR(* nsa 3)Y-CAR BACKGROUND))

;AnimationState-> Boolean
;A animação é finalizada quando o carro chega no fim do "mundo".
(check-expect(end?2 0)
             #false)
(check-expect(end?2 WIDTH-OF-WORLD)
             #true)
(define(end?2 nsa)
  (>=(* nsa 3)(+ WIDTH-OF-WORLD(/(image-width CAR)2))))

;AnimationState-> AnimationState
(define(main2 nsa)
  (big-bang nsa
            [on-tick   tock2]
            [on-mouse hyper]
            [to-draw   render2]
            [on-key stroke]
            [stop-when end?2]
            ))

#|All 11 tests passed!
> (main 0)
417
> (main2 0)
139|#

;WorldState Number Number String -> WorldState
;O carro é colocado na posição x-mouse.
(define(hyper x-position-of-car x-mouse y-mouse me)
  (cond
    [(string=? "button-down" me) x-mouse]
    [else x-position-of-car]))
;("on-mouse" adicionada no big-bang da função main e main2)

;(Ex.45)
(define cat .)
(define WORLD-WIDTH 400)
(define WORLD-HEIGHT 150)
(define catbon(/ WORLD-HEIGHT 2))
(define back(empty-scene WORLD-WIDTH WORLD-HEIGHT))

(define(main4 ws)
  (big-bang ws
            (on-tick tock3)
            (to-draw render3)
            ))
(check-expect(tock3 10)13)
(check-expect(tock3 WORLD-WIDTH)0)

(define(tock3 ws)
  (if(< ws WORLD-WIDTH)
       (+ ws 3)
        0))
(define(render3 ws)
  (place-image cat ws catbon back))

(check-expect(render3 0)
             (place-image cat 0 catbon back))
(check-expect(render3 4)
             (place-image cat 4 catbon back))
#|All 4 tests passed!
> (main4 0)|#


;(Ex.46)
;mesmas definições usadas no ex. 45
#|(define WORLD-WIDTH 400)
(define WORLD-HEIGHT 150)
(define catbon(/ WORLD-HEIGHT 2))
(define back(empty-scene WORLD-WIDTH WORLD-HEIGHT))|#
(define cat2 .)
(define(render4 ws)
  (cond
    [(= (modulo ws 2)0)(place-image cat ws catbon back)]
    [else(place-image cat2 ws catbon back)]))

(define(main5 ws)
  (big-bang ws
            (on-tick tock3)
            (to-draw render4)
            ))
#|(main5 0)|#

;(Ex.47)
(define moldura1
  (rectangle 12 102 "solid" "black"))
(define barra1
  (rectangle 10 100 "solid" "red"))
(define barra2
  (overlay barra1 moldura1))
(define moldura2
  (rectangle 14 104 "outline" "black"))

(define(render5 hp)
  (place-image barra2
               7
               (- 152 hp)
               moldura2))

(define(tock5 hp)
  (if(< hp 0.1)
      0
      (- hp 0.1)))

(define(main6 hp)
  (big-bang hp                         
            (on-tick tock5)           
            (to-draw render5)         
            (on-key setas)
            ))

(define(cima hp)(+ hp (/ 1 3)))
(define(baixo hp)(+ hp 0.2))

(define(setas hp ke)
  (cond[(key=? ke "up")(cima hp)]
       [(key=? ke "down")(baixo hp)]
       [else hp]))
#|> (main6 100)|#



;(Ex.48)
;observação de funções no stepper
(define(reward m)
  (cond
    ((<= 0 m 20) "bronze")
    ((and(< 20 m)(<= m 40))"silver")
    ((and(< 40 m)(<= m 100))"gold")
    (else "false")))
;All of the definitions have been successfully evaluated.
#|> (reward 10)
"bronze"
> (reward 18)
"bronze"
> (reward 40)
"silver"
> (reward 100)
"gold"
> (reward 101)
"false"|#

;(Ex.50)
;TrafficLight-> TrafficLight
(check-expect(traffic-light-next "red")"green")
(define(traffic-light-next s)
  (cond
    [(string=? "red" s) "green"]
    [(string=? "green" s) "yellow"]
    [(string=? "yellow" s) "red"]))

;(Ex.51)
;utilizando função "traffic-light-next" do ex. anterior

(define(render6 s)
  (circle 10 "solid" s))

(define(traffic-light s)
  (big-bang s
            [to-draw render6]
            [on-tick traffic-light-next 1]))
;precisa ser chamada com "yellow" para que comece com a cor vermelha
#| > (traffic-light "yellow")|#

;(Ex.52)
;Intervalo fechado
#|[3,5] => 3,4,5|#

;Intervalo aberto à esquerda
#|(3,5] => 4,5|#

;Intervalo aberto à direita
#|[3,5) => 3,4|#

;Intervalo aberto
#|(3,5) => 4|#

;(Ex.53)
(define HEIGHT 300)
(define WIDTH  100)
(define YDELTA 3)

(define BACKG(empty-scene WIDTH HEIGHT))
(define ROCKET(rectangle 5 30 "solid" "red"))
(define CENTER(/(image-height ROCKET) 2))

;An LRCD (for launching rocket countdown) is one of:
;– "resting"
;– a Number between -3 and -1
;– a NonnegativeNumber 
;interpretation a grounded rocket, in countdown mode,
;a number denotes the number of pixels between the
;top of the canvas and the rocket (its height)
;LRCD -> Image
;renders the state as a resting or flying rocket 
