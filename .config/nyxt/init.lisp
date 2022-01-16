(define-configuration prompt-buffer
  ((style (str:concat
           %slot-default%
           (cl-css:css
            '((body
               :background-color "black"
               :color "#808080")
              ("#prompt-area"
               :background-color "black")
              ;; The area you input text in.
              ("#input"
               :background-color "white")
              (".source-name"
               :color "black"
               :background-color "gray")
              (".source-content"
               :background-color "black")
              (".source-content th"
               :border "1px solid lightgray"
               :background-color "black")
              ;; The currently highlighted option.
              ("#selection"
               :background-color "#37a8e4"
               :color "black")
              (.marked :background-color "darkgray"
                       :font-weight "bold"
                       :color "white")
              (.selected :background-color "black"
                         :color "white")))))))

;;; Panel buffers are the same in regards to style.
(define-configuration (internal-buffer panel-buffer)
  ((style
    (str:concat
     %slot-default%
     (cl-css:css
      '((body
         :background-color "black"
         :color "lightgray")
        (hr
         :color "darkgray")
        (a
         :color "lightgray")
        (.button
         :color "lightgray"
         :background-color "gray")))))))

(define-configuration window
  ((message-buffer-style
    (str:concat
     %slot-default%
     (cl-css:css
      '((body
         :background-color "black"
         :color "white")))))))

(define-configuration buffer
  ((default-modes `(dark-mode
                    ,@%slot-default%))))
