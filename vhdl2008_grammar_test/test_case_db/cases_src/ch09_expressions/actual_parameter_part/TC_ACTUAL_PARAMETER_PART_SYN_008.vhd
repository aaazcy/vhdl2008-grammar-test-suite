-- =============================================================
-- Case ID: TC_ACTUAL_PARAMETER_PART_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_ACTUAL_PARAMETER_PART
-- Standard Reference: IEEE 1076-2008 Section 9.3.4
-- Production: actual_parameter_part ::= parameter_association_list
-- Case Type: Positive
-- Test Focus: Multiple named actuals associated out of order - named association allows an order different from the formal parameters, verifying the order independence of the named form of actual_parameter_part
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ent_outoforder is
  port (
    a_i : in  integer;
    b_i : in  integer;
    y_o : out integer
  );
end entity ent_outoforder;

architecture rtl of ent_outoforder is
  function sub(x, y : integer) return integer is
  begin return x - y; end function;
begin
  y_o <= sub(y => b_i, x => a_i);
end architecture rtl;
