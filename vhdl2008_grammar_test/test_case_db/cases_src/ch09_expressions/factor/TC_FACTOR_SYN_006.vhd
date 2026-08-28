-- =============================================================
-- Case ID: TC_FACTOR_SYN_006
-- Rule Type: Syntax
-- Related Rule ID: BNF_FACTOR
-- Standard Reference: IEEE 1076-2008 Section 9.2
-- Production: factor ::= primary [ ** primary ] | abs primary | not primary | logical_operator primary
-- Case Type: Positive
-- Test Focus: or reduction operator: the or primary form performs a reduction or on a bus signal, detecting whether any bit is set
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity fac_orop_ent is
  port(bus_in : in bit_vector(7 downto 0); any_set : out bit);
end entity;
architecture rtl of fac_orop_ent is
begin
  any_set <= or bus_in;
end architecture rtl;
