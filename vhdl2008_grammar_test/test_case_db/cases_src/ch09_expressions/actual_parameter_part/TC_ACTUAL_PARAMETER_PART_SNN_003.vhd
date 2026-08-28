-- =============================================================
-- Case ID: TC_ACTUAL_PARAMETER_PART_SNN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ACTUAL_PARAMETER_PART
-- Standard Reference: IEEE 1076-2008 Section 9.3.4
-- Production: actual_parameter_part ::= parameter_association_list
-- Case Type: Negative
-- Test Focus: SNN: positional actual appears after a named actual - in "func(y => b_i, a_i)" the positional parameter follows a named parameter in violation of the rule, verifying that VHDL requires positional association before named association
-- Expected Result: Triggers semantic error: positional association after named association
-- Dependencies: None
-- =============================================================
entity ent_snn_pos_after_named is
  port (
    a_i : in  integer;
    b_i : in  integer;
    y_o : out integer
  );
end entity ent_snn_pos_after_named;

architecture rtl of ent_snn_pos_after_named is
  function sub(x, y : integer) return integer is
  begin return x - y; end function;
begin
  -- ERROR: positional association after named association
  y_o <= sub(y => b_i, a_i);
end architecture rtl;
