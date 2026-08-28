-- =============================================================
-- Case ID: TC_ELEMENT_ASSOCIATION_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_ELEM_ASSOC_INDEX
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: element_association ::= [ choices => ] expression
-- Case Type: Negative
-- Test Focus: SEM: named association index out of array bounds — index 3 used for array(0 to 2)
-- Expected Result: Triggers semantic error: index out of range
-- Dependencies: None
-- =============================================================
entity elem_assoc_sem2_ent is end entity;
architecture bh of elem_assoc_sem2_ent is
  type t_arr is array(0 to 2) of integer;
  signal s:t_arr:=(0=>10, 3=>30);
begin end architecture bh;
