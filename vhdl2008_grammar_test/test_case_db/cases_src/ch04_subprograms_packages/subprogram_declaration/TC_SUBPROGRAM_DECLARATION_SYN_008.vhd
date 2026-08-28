-- =============================================================
-- Case ID: TC_SUBPROGRAM_DECLARATION_SYN_008
-- Rule Type: Syntax
-- Related Rule ID: BNF_SUBPROGRAM_DECLARATION
-- Standard Reference: IEEE 1076-2008 Section 4.3
-- Production: subprogram_declaration ::= subprogram_specification ;
-- Case Type: Positive
-- Test Focus: function declaration returning array type: function f_not(v:bit_vector) return bit_vector (interface and return type must be unconstrained arrays); verification of composite return type declared in subprogram_declaration
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
package pkg_sd_array is
  function f_not(v:bit_vector) return bit_vector;
end package pkg_sd_array;
package body pkg_sd_array is
  function f_not(v:bit_vector) return bit_vector is begin return not v; end function;
end package body pkg_sd_array;
entity sd_array_ent is port(din:in bit_vector(7 downto 0); dout:out bit_vector(7 downto 0)); end entity;
architecture bh of sd_array_ent is begin dout<=work.pkg_sd_array.f_not(din); end architecture bh;
