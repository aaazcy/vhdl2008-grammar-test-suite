-- =============================================================
-- Case ID: TC_RANGE_SMN_001
-- Related Rule ID: SMN_RANGE_001
-- Rule Type: Semantic (Negative)
-- Standard Reference: IEEE 1076-2008 Section 5.3.2.1
-- Production: range ::= range_attribute_name | simple_expression direction simple_expression
-- Test Focus: Semantic negative — the range '10 to 0.0' of a subtype of integer uses a real right expression, which cannot be matched against the integer base type of the range constraint
-- Expected Result: Triggers semantic error: can't match floating point literal with type integer
-- Dependencies: None
-- =============================================================
entity rng38_ent is
  port ( dout : out integer );
end entity rng38_ent;
architecture rtl of rng38_ent is
  subtype t_bad is integer range 10 to 0.0;
begin
  dout <= 0;
end architecture rtl;
