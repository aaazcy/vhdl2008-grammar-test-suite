-- =============================================================
-- Case ID: TC_ACTUAL_PARAMETER_PART_SYN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_ACTUAL_PARAMETER_PART
-- Standard Reference: IEEE 1076-2008 Section 9.3.4
-- Production: actual_parameter_part ::= parameter_association_list
-- Case Type: Positive
-- Test Focus: Multiple positional actuals - the function call passes two positional actuals to compute a sum, verifying the multi-actual positional list syntax of actual_parameter_part (element_association { , element_association })
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ent_two_params is
  port (
    a_i : in  integer;
    b_i : in  integer;
    y_o : out integer
  );
end entity ent_two_params;

architecture rtl of ent_two_params is
  function add(x, y : integer) return integer is
  begin return x + y; end function;
begin
  y_o <= add(a_i, b_i);
end architecture rtl;
