;; ===============================================================
;; Contract: CommunityTipping.clar
;; Description: A simple decentralized tipping contract that allows
;;              users to send STX tips to other users and keeps
;;              track of total tips sent and received.
;; Author: Open Contribution
;; ===============================================================

;; ---------------------------
;; Data structures and constants
;; ---------------------------

(define-constant ERR_SELF_TIP (err u100))
(define-constant ERR_TRANSFER_FAILED (err u101))

(define-map tips-sent principal uint)        ;; total tips sent by each user
(define-map tips-received principal uint)    ;; total tips received by each user
(define-data-var total-tips uint u0)         ;; total tips (in microSTX)

;; ---------------------------
;; Public function: send-tip
;; ---------------------------
;; Allows a user to send STX to another user.
;; Updates mappings for both sender and receiver.

(define-public (send-tip (recipient principal) (amount uint))
  (begin
    (if (is-eq tx-sender recipient)
        (err u100) ;; ERR_SELF_TIP
        (begin
          (unwrap! (stx-transfer? amount tx-sender recipient) ERR_TRANSFER_FAILED)
          (map-set tips-sent tx-sender (+ (default-to u0 (map-get? tips-sent tx-sender)) amount))
          (map-set tips-received recipient (+ (default-to u0 (map-get? tips-received recipient)) amount))
          (var-set total-tips (+ (var-get total-tips) amount))
          ;; Removed invalid to-utf8 function and replaced with simple success message
          (ok "Tip sent successfully")
        )
    )
  )
)

;; ---------------------------
;; Read-only functions
;; ---------------------------

;; Get total tips sent by a user
(define-read-only (get-tips-sent (user principal))
  (ok (default-to u0 (map-get? tips-sent user)))
)

;; Get total tips received by a user
(define-read-only (get-tips-received (user principal))
  (ok (default-to u0 (map-get? tips-received user)))
)

;; Get the total amount of tips transacted through this contract
(define-read-only (get-total-tips)
  (ok (var-get total-tips))
)
