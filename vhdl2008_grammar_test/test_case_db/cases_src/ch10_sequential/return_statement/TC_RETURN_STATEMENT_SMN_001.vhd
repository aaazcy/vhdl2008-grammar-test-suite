-- =============================================================
-- Case ID: TC_RETURN_STATEMENT_SMN_001
-- Rule Type: Semantic
-- Related Rule ID: SEM_SEQ_017
-- Standard Reference: IEEE 1076-2008 Section 10.13
-- Rule Description: Return expression type must match — negative variant
-- Case Type: Negative
-- Error Category: type_error
-- Test Focus: SMN: function returns bit_vector but a string is returned — return type mismatch across different type families
-- Expected Result: Triggers semantic error: return type STRING does not match BIT_VECTOR
-- Dependencies: None
-- =============================================================
entity return_str_vs_bv_ent is
  port (sel : in bit; result : out bit_vector);
end entity return_str_vs_bv_ent;

architecture smn of return_str_vs_bv_ent is
  function mismatch_func(x : bit) return bit_vector is
  begin
    return "hello";  -- ERROR: STRING literal, not BIT_VECTOR
  end function;
begin
  process(sel) is
  begin
    result <= mismatch_func(sel);
  end process;
end architecture smn;
