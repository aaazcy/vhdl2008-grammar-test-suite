-- =============================================================
-- Case ID: TC_FUNCTION_CALL_SYN_001
-- Rule Type: Syntax
-- Related Rule ID: BNF_FUNCTION_CALL
-- Standard Reference: IEEE 1076-2008 Section 9.3.4
-- Production: function_call ::= function_name [ ( actual_parameter_part ) ]
-- Case Type: Positive
-- Test Focus: minimal form: no-parameter function call — f_const without parentheses, verifying that function_call may omit parentheses when there are no parameters
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================

entity ent_fc_simple is
  port (
    y : out integer
  );
end entity ent_fc_simple;

architecture no_param of ent_fc_simple is
  function f_const return integer is
  begin
    return 42;
  end function;
begin
  process
  begin
    y <= f_const;
    wait;
  end process;
end architecture no_param;
