-- =============================================================
-- Case ID: TC_CONDITION_SMN_002
-- Rule Type: Semantic
-- Related Rule ID: SEM_CONDITION_BOOLEAN
-- Standard Reference: IEEE 1076-2008 Section 10.8
-- Production: condition ::= expression
-- Case Type: Negative
-- Test Focus: SEM: condition uses an array type expression - in if a then the a is a bit_vector array type, not convertible to boolean, illegal condition type
-- Expected Result: Triggers analysis error: cannot convert expression to boolean
-- Dependencies: None
-- =============================================================
entity condition_array_expr is port(a:in bit_vector(3 downto 0); y:out integer); end entity;
architecture vhdl2008 of condition_array_expr is
begin
  process(a) begin
    if a then
      y <= 1;
    else
      y <= 0;
    end if;
  end process;
end architecture vhdl2008;
