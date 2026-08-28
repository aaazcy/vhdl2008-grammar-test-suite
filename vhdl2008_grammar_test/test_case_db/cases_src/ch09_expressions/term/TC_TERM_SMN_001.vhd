-- =============================================================
-- Case ID: TC_TERM_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: BNF_TERM
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: term ::= factor { multiplying_operator factor }
-- Case Type: Negative
-- Rule Description: Multiplication/division of physical types: physical * physical is illegal; only physical * numeric or numeric * physical
-- Error Category: type_mismatch
-- Test Focus: physical * physical is illegal: time * time multiplication, VHDL does not allow two physical types to be multiplied directly
-- Expected Result: Triggers semantic error: cannot multiply two values of physical type
-- Dependencies: None
-- =============================================================
entity term_smn1_ent is
  port(t1, t2 : in time; y : out time);
end entity;
architecture err of term_smn1_ent is
begin
  y <= t1 * t2;
end architecture err;
