-- =============================================================
-- Case ID: TC_DESIGNATOR_SMN_001
-- Related Rule ID: SMN_DESIGNAT_001
-- Rule Type: Semantic
-- BNF Production: DESIGNATOR
-- Standard Reference: IEEE 1076-2008 Section 6.5.7.1, Section 12.3
-- Production: designator ::= identifier | operator_symbol
-- Test Focus: Duplicate designator — two functions share the
--   same identifier 'f_convert' in the same declarative region
--   but with identical parameter/return profiles, violating
--   the rule that two subprogram specifications must be
--   distinguishable
-- Case Type: Negative
-- Error Category: declaration_elaboration_error
-- Expected Result: Triggers semantic error: duplicate subprogram
-- Dependencies: None
-- =============================================================
entity designator_smn_001 is
  port (
    data_in  : in  integer range 0 to 63;
    data_out : out integer range 0 to 63
  );
end entity designator_smn_001;

architecture rtl of designator_smn_001 is
  -- First function with this designator
  function f_convert(val : integer) return integer is
  begin
    return val * 2;
  end function;

  -- ERROR: duplicate designator with identical signature
  function f_convert(val : integer) return integer is
  begin
    return val + 10;
  end function;

  signal s_val : integer range 0 to 63 := 0;
begin
  s_val <= data_in;
  data_out <= f_convert(s_val);
end architecture rtl;
