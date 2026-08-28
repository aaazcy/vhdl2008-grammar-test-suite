-- =============================================================
-- Case ID: TC_ELEMENT_ASSOCIATION_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SMN_ELEM_ASSOC_AMBIGUOUS
-- Standard Reference: IEEE 1076-2008 Section 9.3.3.1
-- Production: element_association ::= [ choices => ] expression
-- Case Type: Negative
-- Test Focus: SMN: duplicate named association index in aggregate — index 0 specified twice with different values
-- Expected Result: Triggers semantic error: duplicate element association
-- Dependencies: None
-- =============================================================
entity elem_assoc_smn1_ent is end entity;
architecture bh of elem_assoc_smn1_ent is
  type t_arr is array(0 to 3) of integer;
  signal s:t_arr:=(0=>5, 0=>10, others=>0);
begin end architecture bh;
