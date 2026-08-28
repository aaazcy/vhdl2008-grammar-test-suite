-- =============================================================
-- Case ID: TC_ACTUAL_PARAMETER_PART_SNN_002
-- Rule Type: Syntax
-- Related Rule ID: BNF_ACTUAL_PARAMETER_PART
-- Standard Reference: IEEE 1076-2008 Section 9.3.4
-- Production: actual_parameter_part ::= parameter_association_list
-- Case Type: Negative
-- Test Focus: SNN: extra comma at the end of the actual parameter list - "func(a_i,)" has one more comma after the parameter, verifying that in parameter_association_list the comma is a separator and no trailing comma is allowed
-- Expected Result: Triggers syntax error: trailing comma in parameter_association_list
-- Dependencies: None
-- =============================================================
entity ent_snn_trailing_comma is
  port (
    a_i : in  integer;
    y_o : out integer
  );
end entity ent_snn_trailing_comma;

architecture rtl of ent_snn_trailing_comma is
  function double(x : integer) return integer is
  begin return x * 2; end function;
begin
  -- ERROR: trailing comma after last parameter
  y_o <= double(a_i,);
end architecture rtl;
