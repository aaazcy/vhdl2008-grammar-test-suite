-- =============================================================
-- Case ID: TC_RANGE_CONSTRAINT_SMN_001
-- Related Rule ID: SMN_RANGE_CO_001
-- Rule Type: Semantic (Negative)
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: range_constraint ::= range range
-- Test Focus: Semantic negative — the range constraint 't_uint8 range 0 to 300.5' uses a real bound 300.5 although the base type t_uint8 is an integer type, so the constraint cannot be applied
-- Expected Result: Triggers semantic error: can't match floating point literal with type t_uint8
-- Dependencies: None
-- =============================================================
entity rc41b_ent is
  port ( val : out integer );
end entity rc41b_ent;
architecture rtl of rc41b_ent is
  type t_uint8 is range 0 to 255;
  subtype t_bad is t_uint8 range 0 to 300.5;
begin
  val <= 0;
end architecture rtl;
