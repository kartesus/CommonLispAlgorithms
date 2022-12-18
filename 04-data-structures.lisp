;; a struct is a contiguous data structure
(defstruct pair left right)
(let ((pair (make-pair :left "foo" :right "bar")))
  (pair-right pair))

; (defstruct (pair (:type list) (:conc-name nil))
;   "A generic pair with left (LT) and right (RT)."
;   lt rt)

; (defun pair (x y)
;   "Shorter constructor for pairs."
;   (make-pair :lt x :rt y))


;; UNION-FIND
(defstruct item
  parent
  (size 1))

(defun uf-union (item1 item2)
  "Joins the subsets of ITEM1 and ITEM2."
  (rtl:with ((root1 (uf-find item1))
             (root2 (uf-find item2))
             (major minor (if (> (item-size root1)
                                 (item-size root2))
                              (values root1 root2)
                              (values root2 root1))))
    (incf (item-size major) (item-size minor))
    (setf (item-parent minor) major)))

(defun uf-find (item)
  "Determine the id of the subset that an ITEM belongs to."
  (let ((parent (item-parent item)))
    (if parent
        (setf (item-parent item) (uf-find parent))
        item)))

(defun uf-disjoint (items)
  "Return true if all ITEMS belong to different subsets."
  (let ((roots (list)))
    (dolist (item items)
      (let ((root (uf-find item)))
        (when (member root roots)
              (return-from uf-disjoint nil))
        (push root roots)))))