-- =============================================================
-- Case ID: TC_RETURN_STATEMENT_SMN_2
-- Rule Type: Semantic
-- Related Rule ID: SEM_SEQ_017
-- Standard Reference: IEEE 1076-2008 Section 10.13
-- Rule Description: Return expression in function must match function return type
-- Case Type: Negative
-- Error Category: type_error
-- Test Focus: SEM: function returns integer but a boolean is returned — violates SEM_SEQ_017 return type mismatch
-- Expected Result: Triggers semantic error: return expression type does not match function return type
-- Dependencies: None
-- =============================================================
entity return_type_mismatch_ent is
  port (flag : in boolean; result : out integer);
end entity return_type_mismatch_ent;

architecture sem of return_type_mismatch_ent is
  function wrong_return(x : boolean) return integer is
  begin
    return x;  -- ERROR: x is BOOLEAN, function returns INTEGER
  end function;
begin
  process(flag) is
  begin
    result <= wrong_return(flag);
  end process;
end architecture sem;
