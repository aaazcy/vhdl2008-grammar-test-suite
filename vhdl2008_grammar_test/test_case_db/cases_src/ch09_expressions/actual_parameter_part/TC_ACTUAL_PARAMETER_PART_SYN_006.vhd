-- =============================================================
-- Case ID: TC_ACTUAL_PARAMETER_PART_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_ACTUAL_PARAMETER_PART
-- Standard Reference: IEEE 1076-2008 Section 9.3.4
-- Production: actual_parameter_part ::= parameter_association_list
-- Case Type: Positive
-- Test Focus: Actual parameter list contains an expression - the actual is not a simple signal but a compound expression (a_i + b_i), verifying that actual_parameter_part allows an expression as an actual
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ent_expr_param is
  port (
    a_i : in  integer;
    b_i : in  integer;
    y_o : out integer
  );
end entity ent_expr_param;

architecture rtl of ent_expr_param is
  function square(x : integer) return integer is
  begin return x * x; end function;
begin
  y_o <= square(a_i + b_i);
end architecture rtl;
