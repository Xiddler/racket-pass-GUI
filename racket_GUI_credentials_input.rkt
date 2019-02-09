#lang racket
(require racket/gui)

;; This script allows easy entry of sign-on credentials using a GUI and appending 
;; the new credentials to a text file in JSON format - for maximum flexiblity.
;; There are seven fields: url-nick, website (URL), email, username, password, date, note.
;; url-nick is used for quick searching from the CLI e.g. The url-nick for https://www.drupal.org/ is drupal.

;; The plaintext file where the credentials are to be stored is defined as follows
(define myfile "/home/user/SignUps.txt")


;; This is the main window
(define my-window (new frame%
                       [label "Racket - Credentials for websites"]
                       [width 400]
                       [height 300]
                       [x 400]
                       [y 400]
                       [style '(fullscreen-button)]
                       [alignment '(left top)]))

;; Input field for  url-nick
;; The spaces in the labels are to align the fields in the GUI.
(define url-nick (new text-field%
                        [parent my-window]
                        [label "url-nick      "]
                        [min-width 150]
                        [min-height 20]
                        [vert-margin 2]
                        [horiz-margin 10]
                        [stretchable-width #t]
                        [stretchable-height #f]))

(define website (new text-field%
                        [parent my-window]
                        [label "website     "]
                        [min-width 150]
                        [min-height 20]
                        [vert-margin 2]
                        [horiz-margin 10]
                        [stretchable-width #t]
                        [stretchable-height #f]))

(define email (new text-field%
                        [parent my-window]
                        [label "email         "]
                        [min-width 150]
                        [min-height 20]
                        [vert-margin 2]
                        [horiz-margin 10]
                        [stretchable-width #t]
                        [stretchable-height #f]))

(define password (new text-field%
                        [parent my-window]
                        [label "password "]
                        [min-width 150]
                        [min-height 20]
                        [vert-margin 2]
                        [horiz-margin 10]
                        [stretchable-width #t]
                        [stretchable-height #f]))


(define username (new text-field%
                        [parent my-window]
                        [label "username "]
                        [min-width 150]
                        [min-height 20]
                        [vert-margin 2]
                        [horiz-margin 10]
                        [stretchable-width #t]
                        [stretchable-height #f]))


(define date (new text-field%
                        [parent my-window]
                        [label "date           "]
                        [min-width 150]
                        [min-height 20]
                        [vert-margin 2]
                        [horiz-margin 10]
                        [stretchable-width #t]
                        [stretchable-height #f]))


(define note (new text-field%
                        [parent my-window]
                        [label "note           "]
                        [min-width 150]
                        [min-height 20]
                        [vert-margin 2]
                        [horiz-margin 10]
                        [stretchable-width #t]))

;; Optional: Display a messager for the user
;; (define msg (new message%
;;                  [parent my-window]
;;                  [label "Hello dolly"]
;;                  [vert-margin 2]
;;                  [horiz-margin 10]))

;; A (parent) frame to take the output field and a button 
(define panel (new horizontal-pane%
                   [parent my-window]
                   [vert-margin 2]
                   [horiz-margin 10]
                   [alignment '(left bottom)]
                   [stretchable-width #t]
                   [stretchable-height #t]))


;; Button to run the script
(define send-data (new button%
                               [parent panel]
                               [label "Save to JSON"]
                               [vert-margin 2]
                               [horiz-margin 10]
                               [callback (lambda (button event)
                                           (get-urlnick-input (send url-nick  get-value ))
                                           (get-website-input (send website get-value ))
                                           (get-email-input (send email get-value ))
                                           (get-password-input (send password get-value ))
                                           (get-username-input (send username get-value ))
                                           (get-date-input (send date get-value ))
                                           (get-note-input (send note get-value ))
                                           )]))


;; With call-with-output-file you don't need to explicitly close the file
;; These are the callback functions when the 'Save to JSON' button is pressed
;; that send the input data to the 11SignUps.txt file in json format

;; I am a nooby at racket. I suspect there is a more efficient way of doing the following 
;; other than making a new function for every field. Feb 2019.

(define (get-urlnick-input URLNICK )
  (call-with-output-file myfile
                         #:exists 'append ; Append to the content
                         (λ (out-port)
                            (displayln (format "{\n\"url-nick\":~s," URLNICK  ) out-port))))

(define (get-website-input WEBSITE )
  (call-with-output-file myfile
                         #:exists 'append ; Append to the content
                         (λ (out-port)
                            (displayln (format "\"website\":~s," WEBSITE  ) out-port))))


(define (get-email-input EMAIL )
  (call-with-output-file myfile
                         #:exists 'append ; Append to the content
                         (λ (out-port)
                            (displayln (format "\"email\":~s," EMAIL  ) out-port))))

(define (get-password-input PASSWORD )
  (call-with-output-file myfile
                         #:exists 'append ; Append to the content
                         (λ (out-port)
                            (displayln (format "\"password\":~s," PASSWORD  ) out-port))))


(define (get-username-input USERNAME )
  (call-with-output-file myfile
                         #:exists 'append ; Append to the content
                         (λ (out-port)
                            (displayln (format "\"username\":~s," USERNAME  ) out-port))))


(define (get-date-input DATE )
  (call-with-output-file myfile
                         #:exists 'append ; Append to the content
                         (λ (out-port)
                            (displayln (format "\"date\":~s," DATE  ) out-port))))

(define (get-note-input NOTE )
  (call-with-output-file myfile
                         #:exists 'append ; Append to the content
                         (λ (out-port)
                            (displayln (format "\"note\":~s,\n}," NOTE  ) out-port))))


;Make window visible
(send my-window show #t)
