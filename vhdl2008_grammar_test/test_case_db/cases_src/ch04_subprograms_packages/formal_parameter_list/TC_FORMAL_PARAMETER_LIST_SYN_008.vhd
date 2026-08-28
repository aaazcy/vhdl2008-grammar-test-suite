-- =============================================================
-- Case ID: TC_FORMAL_PARAMETER_LIST_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_FORMAL_PARAMETER_LIST
-- Standard Reference: IEEE 1076-2008 Section 4.2.2.1
-- Production: formal_parameter_list ::= parameter_interface_list
-- Case Type: Positive
-- Test Focus: formal_parameter_list with array type parameter: v:bit_vector (interface parameters must be unconstrained arrays), verification of composite type use in the parameter list
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity fpl_array_ent is port(din:in bit_vector(7 downto 0); dout:out bit_vector(7 downto 0)); end entity;
architecture bh of fpl_array_ent is
  function f_invert(v:bit_vector) return bit_vector is
  begin return not v; end function;
begin
  dout<=f_invert(din);
end architecture bh;
