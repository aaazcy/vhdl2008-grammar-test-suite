-- =============================================================
-- Case ID: TC_BASED_LITERAL_SMN_003
-- Rule Type: Semantic
-- Related Rule ID: BNF_BASED_LITERAL
-- Standard Reference: IEEE 1076-2008 Section 15.5.3
-- Production: based_literal ::= base # based_integer [ . based_integer ] # [ exponent ]
-- Case Type: Negative
-- Test Focus: based_literal fractional form assigned to integer type(16#AB.CD# to integer) — a based_literal with a decimal point denotes a real rather than an integer, assigning it to an integer signal causes a type mismatch
-- Expected Result: Triggers semantic error on real-to-integer assignment
-- Dependencies: None
-- =============================================================
entity bl_real_to_integer is
  port (
    bad_val : out integer
  );
end entity bl_real_to_integer;

architecture rtl of bl_real_to_integer is
  constant C_BAD : integer := 16#AB.CD#;
begin
  bad_val <= C_BAD;
end architecture rtl;
