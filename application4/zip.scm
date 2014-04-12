(define *default-hash-size* 97)
(define *default-hash-fill* '())

(define (make-hash #!optional size fill)
  (let ((s (if (eq? #!default size) *default-hash-size* size))
        (f (if (eq? #!default fill) *default-hash-fill* fill)))
    (make-vector s f)))

(define (hash-insert! hash proc item)
  (let ((key (proc item)))
    (if (null? (vector-ref hash key))
      (vector-set! hash key (list item))
      (append! (vector-ref hash key) (list item)))))

(define (hash-search hash proc item)
  (let* ((key (proc item))
         (mem (member item (vector-ref hash key))))
    (if (or (null? mem) (not mem))
      '()
      (car mem))))

(define (hash-delete! hash proc item)
  (let* ((key (proc item))
         (lst (vector-ref hash key)))
    (if (null? list) '()
      (if (= item (car lst))
        (vector-set! hash key (cdr lst))
        (list-delete!/once lst item)))))

(define (hash-pretty-display hash)
  ())