-- =============================================================
-- Case ID: TC_ELEMENT_ASSOCIATION_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: SEM_ELEM_ASSOC_TYPE
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Rule Description: Expression type must match element type of aggregate
-- Case Type: Negative
-- Error Category: type_error
-- Test Focus: SEM: type mismatch - bit value in integer array aggregate
-- Expected Result: Triggers semantic error: type mismatch
-- Dependencies: None
-- =============================================================
entity elem_assoc_sem1_ent is end entity;
architecture bh of elem_assoc_sem1_ent is
  type t_arr is array(0 to 1) of integer;
  signal s:t_arr:=(0=>'1', 1=>'0');
begin end architecture bh;
