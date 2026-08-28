-- =============================================================
-- Case ID: TC_CONSTRAINT_SMN_001
-- Rule Type: Static Model
-- Related Rule ID: BNF_CONSTRAINT
-- Standard Reference: IEEE 1076-2008 Section 5.3.2
-- Production: constraint ::= range_constraint | array_constraint | record_constraint
-- Case Type: Negative
-- Test Focus: static model negative — range_constraint on subtype of integer uses the real bound 7.5, which cannot be converted to the base type integer, so the constraint is rejected
-- Expected Result: Triggers semantic error: can't match floating point literal with type integer
-- Dependencies: None
-- =============================================================
entity con_ent is port(dout:out integer); end entity;
architecture rtl of con_ent is
  subtype t_bad is integer range 0 to 7.5;
begin
  dout<=0;
end architecture;
