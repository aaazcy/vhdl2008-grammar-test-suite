-- =============================================================
-- Case ID: TC_ACTUAL_PARAMETER_PART_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ACTUAL_PARAMETER_PART
-- Standard Reference: IEEE 1076-2008 Section 9.3.4
-- Production: actual_parameter_part ::= parameter_association_list
-- Case Type: Positive
-- Test Focus: Named actual association - the function call uses the formal => actual named association syntax, verifying the named actual association form of actual_parameter_part
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ent_named_params is
  port (
    a_i : in  bit_vector(3 downto 0);
    b_i : in  bit_vector(3 downto 0);
    y_o : out bit_vector(7 downto 0)
  );
end entity ent_named_params;

architecture rtl of ent_named_params is
  function concat(hi : bit_vector; lo : bit_vector) return bit_vector is
  begin return hi & lo; end function;
begin
  y_o <= concat(hi => a_i, lo => b_i);
end architecture rtl;
